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
end
