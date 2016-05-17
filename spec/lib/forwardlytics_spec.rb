require 'spec_helper'

describe 'Forwardlytics' do
  describe 'exception_handler= and exception_handler' do
    it 'sets @exception_handler with the value, and calls it when exception_handler is called' do
      called = false
      Forwardlytics.exception_handler = -> (ex) { called =  true }
      Forwardlytics.exception_handler(Forwardlytics::NetException.new("meh"))
      expect(called).to eq(true)
    end
  end
end