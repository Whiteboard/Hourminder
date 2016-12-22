class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :guild_assignments
  has_many :guilds, through: :guild_assignments
  has_many :status_messages
  has_many :user_locations
  has_many :boom_award_titles

  has_attached_file :avatar, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  include TeamgridTools

  def name
    "#{first_name} #{last_name}"
  end

  def has_boom_award?
    boom_award_titles.last.try(:id) == BoomAwardTitle.last.try(:id)
  end

  def get_week_hours
    get_hours_for_user(self)
  end
end
