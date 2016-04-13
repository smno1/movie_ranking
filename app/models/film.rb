class Film < ActiveRecord::Base
  belongs_to :category
  has_many :posters
  def basic_info
    self.to_json(:include=>[{:category=>{:only=>:name}},{:posters=>{:except=>:updated_at}}], 
        :except=>[:created_at, :updated_at,:category_id])
  end

  def self.online_films
    Film.where(:online=>true).to_json(:include=>[{:category=>{:only=>:name}},{:posters=>{:except=>:updated_at}}], 
        :except=>[:created_at, :updated_at,:category_id])
  end

  def likes_and_dislikes uid
    likes=Like.where(film_id: self.id).count
    dislikes=Dislike.where(film_id: self.id).count
    like_by_me=Like.where(film_id: self.id, user_id: uid).count
    dislike_by_me=Dislike.where(film_id: self.id, user_id: uid).count
    {
      likes: likes,
      dislikes: dislikes,
      like_by_me: like_by_me,
      dislike_by_me: dislike_by_me
    }
  end
end
   