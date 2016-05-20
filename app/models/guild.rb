class Guild < ActiveRecord::Base
  has_many :guild_assignments
  has_many :users, through: :guild_assignments
end
