class ScreenDislike < ActiveRecord::Base
  belongs_to :user
  belongs_to :cinema
end
