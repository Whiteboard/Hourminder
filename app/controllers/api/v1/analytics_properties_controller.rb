require 'google/apis/analytics_v3'
class Api::V1::AnalyticsPropertiesController < ApplicationController

  SCOPE = 'https://www.googleapis.com/auth/analytics.readonly'
  attr_accessor :account_json

  def initialize(account_json)
    @account_json ||= account_json
    setup
  end

  def analytics
    @analytics
  end

  def profile_data
    setup
    analytics.list_accounts.items.map do |item|
      analytics.list_web_properties(item.id).items.map do |property|
        analytics.list_profiles(item.id, property.id).items.map do |profile|
          analytics.get_ga_data("ga:#{profile.id}", "yesterday", "today", 'ga:sessions,ga:pageviews')
        end
      end
    end
  end

  def setup
    @analytics = Google::Apis::AnalyticsV3::AnalyticsService.new
    @analytics.authorization = Google::Auth::ServiceAccountCredentials.make_creds({
     "json_key_io": account_json, 
     "scope": SCOPE
    })
  end
end
