class Screen < ActiveRecord::Base
  belongs_to :cinema

  def likes_and_dislikes uid
    likes=ScreenLike.where(screen_id: self.id).count
    dislikes=ScreenDislike.where(screen_id: self.id).count
    like_by_me=ScreenLike.where(screen_id: self.id, user_id: uid).count
    dislike_by_me=ScreenDislike.where(screen_id: self.id, user_id: uid).count
    {
      likes: likes,
      dislikes: dislikes,
      like_by_me: like_by_me,
      dislike_by_me: dislike_by_me
    }
  end
end
