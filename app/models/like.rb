class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :film

  def self.count_like_by_film fid
    Like.where(:film_id=>fid).count
  end
end
