module Forwardlytics
  def self.identify(user_id:, traits: {})
    params = {
      userID: user_id,
      userTraits: traits,
      timestamp: Time.now().to_i
    }
    post('/identify', params)
  end
end
