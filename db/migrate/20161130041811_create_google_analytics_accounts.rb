class CreateGoogleAnalyticsAccounts < ActiveRecord::Migration
  def change
    create_table :google_analytics_accounts do |t|
      t.text :account_json

      t.timestamps null: false
    end
  end
end
