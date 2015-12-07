class Category < ActiveRecord::Base
    has_many :films
  # def serializable_hash(options={})
  #   options = { 
  #     :include => {:user => {:only => [:email, :id]}, 
  #     :only => [:title, :id]
  #   }.update(options)
  #   super(options)
  # end

end
