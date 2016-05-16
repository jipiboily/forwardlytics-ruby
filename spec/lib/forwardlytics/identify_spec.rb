require 'spec_helper'

describe 'Forwardlytics.identify' do
  describe 'identify' do
    let(:now) { Time.now }

    before do
      ENV['FORWARDLYTICS_URL'] = 'http://www.example.com'
      ENV['FORWARDLYTICS_API_KEY'] = 'abc123'

      Timecop.freeze(now)
    end

    after do
      Timecop.return
    end

    it 'posts the event to Forwardlytics' do
      stub = stub_request(:post, "http://www.example.com/identify").
         with(:body => "{\"userID\":\"33\",\"userTraits\":{\"some\":\"trait\"},\"timestamp\":#{now.to_i}}",
              :headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Content-Type'=>'application/json', 'Forwardlytics-Api-Key'=>'abc123', 'Host'=>'www.example.com', 'User-Agent'=>'Ruby'}).
         to_return(:status => 200, :body => "", :headers => {})

      Forwardlytics.identify(user_id: 33, traits: {some: 'trait'})

      expect(stub).to have_been_requested.once
    end
  end
end
