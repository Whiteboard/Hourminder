require 'google/apis/analytics_v3'
class GoogleAnalyticsService

  attr_accessor :account_json
  attr_accessor :gaa

  SCOPE = 'https://www.googleapis.com/auth/analytics.readonly'


  def initialize
    @analytics = Google::Apis::AnalyticsV3::AnalyticsService.new
    @analytics.authorization = Google::Auth::ServiceAccountCredentials.make_creds({
     "json_key_io": get_account_json, 
     "scope": SCOPE
    })
  end

  def get_account_json(gaa)
    StringIO.new(gaa.account_json)
  end

end
