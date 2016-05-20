class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :guild_assignments
  has_many :guilds, through: :guild_assignments

  def name
    "#{first_name} #{last_name}"
  end
end
