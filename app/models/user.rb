class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :guild_assignments
  has_many :guilds, through: :guild_assignments
  has_many :status_messages

  include TeamgridTools

  def name
    "#{first_name} #{last_name}"
  end

  def get_week_hours
    get_hours_for_user(self)
  end
end
