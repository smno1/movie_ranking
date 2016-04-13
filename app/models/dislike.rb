class Dislike < ActiveRecord::Base
  belongs_to :user
  belongs_to :film

  def self.count_dislike_by_film fid
    Dislike.where(:film_id=>fid).count
  end
end
