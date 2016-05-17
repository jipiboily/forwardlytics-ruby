require 'forwardlytics/version'
require 'forwardlytics/identify'
require 'forwardlytics/track'
require 'json'

FORWARDLYTICS_API_KEY = ENV.fetch('FORWARDLYTICS_API_KEY')
FORWARDLYTICS_URL = ENV.fetch('FORWARDLYTICS_URL')


module Forwardlytics
  class NetException < StandardError
  end

  def self.post(uri, params)
    begin
      # Forces the user_id to be a string, which is the expected format by Forwardlytics (the server part)
      params[:userID] = params[:userID].to_s unless params[:userID].nil?

      full_url = URI("#{FORWARDLYTICS_URL}#{uri}")
      http = Net::HTTP.new(full_url.host, full_url.port)
      req = Net::HTTP::Post.new(full_url, initheader = {'Content-Type' =>'application/json'})
      req['Forwardlytics-Api-Key'] = FORWARDLYTICS_API_KEY
      req.body = params.to_json
      res = http.request(req)

      case res
      when Net::HTTPSuccess, Net::HTTPRedirection
        # OK
      else
        raise NetException, "Potential problem posting to Forwardlytics (#{full_url}) - #{res.inspect} - #{res.code} - #{res.body}"
      end
    rescue Exception => ex
      exception_handler(ex)
    end
  end

  def self.exception_handler=(handler)
    @exception_handler = handler
  end

  def self.exception_handler(ex)
    if @exception_handler
      @exception_handler.call(ex)
    end
  end
end
