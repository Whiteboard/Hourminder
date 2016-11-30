class Api::V1::AnalyticsPropertiesController < ApplicationController

  attr_accessor :analytics

  def profile_data
    respond_to do |format|
      format.json {
        setup
        render json: analytics.list_accounts.items.map do |item|
          analytics.list_web_properties(item.id).items.map do |property|
            ids = analytics.list_profiles(item.id, property.id).items.map do |profile|
              "#{profile.id}"
            end
            matched_ids = (ids & ENV["GA_WHITELISTED_IDS"].split(",")).map {|id| "ga:#{id}"}
            if matched_ids.count > 0
              analytics.get_ga_data(matched_ids, "yesterday", "today", 'ga:sessions,ga:sessionDuration')
            else
              nil
            end
          end
        end.flatten.compact
      }
    end
  end

private

  def analytics
    @analytics ||= GoogleAnalyticsService.new
  end
end
