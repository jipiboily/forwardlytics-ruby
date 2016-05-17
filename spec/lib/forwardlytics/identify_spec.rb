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

      Forwardlytics.identify(user_id: 33, traits: {some: 'trait'}).join

      expect(stub).to have_been_requested.once
    end

    context 'when an exception is raised' do
      it 'calls Forwardlytics.exception_handler' do
        allow(Net::HTTP::Post).to receive(:new).and_raise(Forwardlytics::NetException, "something bad")
        expect(Forwardlytics).to receive(:exception_handler) do |ex|
          expect(ex.class).to eq Forwardlytics::NetException
          expect(ex.message).to eq 'something bad'
        end

        Forwardlytics.identify(user_id: 33, traits: {some: 'trait'}).join
      end
    end
  end
end
