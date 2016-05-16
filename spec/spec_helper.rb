require 'webmock/rspec'
require 'timecop'

# Required for Forwardlytics to even start
ENV['FORWARDLYTICS_URL'] = 'http://www.example.com'
ENV['FORWARDLYTICS_API_KEY'] = 'abc123'

require 'forwardlytics'