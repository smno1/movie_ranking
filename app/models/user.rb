class User < ActiveRecord::Base
  has_and_belongs_to_many :liked_films, :class_name=>"Film", :join_table =>:likes
  before_create :generate_authentication_token!
  # belongs_to :default_cinema, :class_name=>"Cinema"
  validates :auth_token, uniqueness: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def default_cinema
    return self.cinema_id.blank? ? [] : Cinema.find(self.cinema_id)
  end

  def default_cinema_screen
    return self.cinema_id.blank? ? [] : Cinema.find(self.cinema_id).screens
  end

  def generate_authentication_token!
    begin 
      self.auth_token=Devise.friendly_token
    end while self.class.exists?(auth_token: auth_token)
  end
end
