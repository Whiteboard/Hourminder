require 'twilio-ruby'
module TwilioTools
  attr_accessor :twilio_client_instance
  attr_accessor :twilio_lookup_client_instance
  def twilio_client
    @twilio_client_instance ||= Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
  end

  def twilio_lookup_client
    @twilio_lookup_client ||= Twilio::REST::LookupsClient.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
  end
end
