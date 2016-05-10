class Category < ActiveRecord::Base
  has_and_belongs_to_many :films, :join_table => :films_categories  # def serializable_hash(options={})
  #   options = { 
  #     :include => {:user => {:only => [:email, :id]}, 
  #     :only => [:title, :id]
  #   }.update(options)
  #   super(options)
  # end

end
