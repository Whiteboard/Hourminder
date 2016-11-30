class CreateBoomAwardTitles < ActiveRecord::Migration
  def change
    create_table :boom_award_titles do |t|
      t.references :user, index: true, foreign_key: true
      t.datetime :awarded_on

      t.timestamps null: false
    end
  end
end
