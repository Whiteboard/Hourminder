class AddTeamgridUidToUsers < ActiveRecord::Migration
  def change
    add_column :users, :teamgrid_uid, :string
  end
end
