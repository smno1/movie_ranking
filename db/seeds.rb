# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#=======test data=============== 
Category.create(:name=>"action")
am=Category.first
am.films.create(:name=>"star war", :description=>"walker war", :released_date=>Date.today, :online=>false)
f2=am.films.create(:name=>"star war II", :description=>"walker war", :released_date=>Date.today, :online=>true)
f3=am.films.create(:name=>"star war III", :description=>"walker war", :released_date=>Date.today, :online=>true)

f2.posters.create(:title=>"casts",:image_url=>"http://www.nbr.co.nz/sites/default/files/story_imgs/Star%20Wars%20poster.jpg")
f3.posters.create(:title=>"star war",:image_url=>"http://images.amcnetworks.com/ifc.com/wp-content/uploads/2013/04/103012-star-wars111.jpeg")
#=======test data=============== 