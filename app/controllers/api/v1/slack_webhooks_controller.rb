class Api::V1::SlackWebhooksController < ApplicationController
  def times
    puts params.inspect
    render json: { status: :ok }
  end
  def tasks
    puts params.inspect
    render json: { status: :ok }
  end
  private
  def slack_notifier
    Slack::Notifier.new ENV["SLACK_TEAMGRID_WEBHOOK_URL"]
  end
end
