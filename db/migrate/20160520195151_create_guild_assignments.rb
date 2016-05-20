class CreateGuildAssignments < ActiveRecord::Migration
  def change
    create_table :guild_assignments do |t|
      t.references :user, index: true, foreign_key: true
      t.references :guild, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
