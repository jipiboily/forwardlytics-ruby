module Forwardlytics
  def self.track(event:, user_id:, properties: {})
    params = {
      name: event,
      userID: user_id,
      properties: properties,
      timestamp: Time.now().to_i
    }
    post('/track', params)
  end
end
