class ScreenDislike < ActiveRecord::Base
  belongs_to :user
  belongs_to :screen
  belongs_to :film
end
