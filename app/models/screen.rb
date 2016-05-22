class Screen < ActiveRecord::Base
  belongs_to :cinema

  def likes_and_dislikes(uid,fid)
    likes=ScreenLike.where(screen_id: self.id,film_id: fid).count
    dislikes=ScreenDislike.where(screen_id: self.id,film_id: fid).count
    like_by_me=ScreenLike.where(screen_id: self.id, user_id: uid,film_id: fid).count
    dislike_by_me=ScreenDislike.where(screen_id: self.id, user_id: uid,film_id: fid).count
    {
      likes: likes,
      dislikes: dislikes,
      like_by_me: like_by_me,
      dislike_by_me: dislike_by_me
    }
  end
end
