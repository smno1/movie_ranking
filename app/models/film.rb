class Film < ActiveRecord::Base
  has_and_belongs_to_many :on_showing_cinemas, :class_name=>"Cinema", :join_table =>:cinema_showings
  has_and_belongs_to_many :liked_users, :class_name=>"User", :join_table =>:likes
  has_many :likes
  has_many :dislikes
  has_many :screen_likes
  has_many :screen_dislikes
  # belongs_to :category
  has_many :posters
  has_and_belongs_to_many :categories, :join_table => :films_categories
  def basic_info
    self.to_json(:include=>[{:categories=>{:only=>:name}},{:posters=>{:except=>:updated_at}}], 
        :except=>[:created_at, :updated_at])
  end

  def self.search_films film_name
    Film.where("lower(name) like ?", "%#{film_name.downcase}%")
  end

  def self.online_films
    Film.where(:online=>true).to_json(:include=>[{:categories=>{:only=>:name}},{:posters=>{:except=>:updated_at}}], 
        :except=>[:created_at, :updated_at])
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
   