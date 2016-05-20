# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#=======dummy data=============== 
Category.create(:name=>"action")
am=Category.first
am.films.create(:name=>"star war", :description=>"walker war", :released_date=>Date.today, :online=>false)
f2=am.films.create(:name=>"star war II", :description=>"walker war", :released_date=>Date.today, :online=>true)
f3=am.films.create(:name=>"star war III", :description=>"walker war", :released_date=>Date.today, :online=>true)

f2.posters.create(:title=>"casts",:image_url=>"http://www.nbr.co.nz/sites/default/files/story_imgs/Star%20Wars%20poster.jpg")
f3.posters.create(:title=>"star war",:image_url=>"http://images.amcnetworks.com/ifc.com/wp-content/uploads/2013/04/103012-star-wars111.jpeg")

CinemaShowing.create(cinema_id: 1, film_id: 1, on_date: Date.today, off_date: Date.today+1.year);
CinemaShowing.create(cinema_id: 1, film_id: 3, on_date: "2016-05-11", off_date: Date.today+1.month);
CinemaShowing.create(cinema_id: 1, film_id: 4, on_date: "2016-05-11", off_date: Date.today+2.months);
CinemaShowing.create(cinema_id: 1, film_id: 5, on_date: "2016-05-11", off_date:  Date.today+1.year);
CinemaShowing.create(cinema_id: 2, film_id: 1, on_date: "2016-05-11", off_date:  Date.today+1.month);
CinemaShowing.create(cinema_id: 2, film_id: 5, on_date: "2016-05-11", off_date:  Date.today+2.months);
CinemaShowing.create(cinema_id: 3, film_id: 3, on_date: "2016-05-11", off_date: Date.today+1.year);
CinemaShowing.create(cinema_id: 3, film_id: 5, on_date: "2016-05-11", off_date: Date.today+1.month);

Film.create(name: "star war III", description: "walker war", released_date: "2015-12-07", trailer_link: "<iframe max-width:100% height=\"205\" src=\"https://w...", created_at: "2015-12-07 05:22:43", updated_at: "2015-12-07 05:22:43", online: true, duration: "133 min")
Film.create(name: "star war", description: "walker war", released_date: "2015-12-07", trailer_link: nil, created_at: "2015-12-07 05:22:43", updated_at: "2015-12-07 05:22:43", online: false, duration: "111 min")
Film.create(name: "after death", description: "after death", released_date: "2016-02-02", trailer_link: "<iframe max-width:100% height=\"205\" src=\"https://w...", created_at: "2016-02-02 04:35:11", updated_at: "2016-02-02 04:35:11", online: true, duration: "98 min")
Film.create(name: "aligator", description: "aligator", released_date: "2016-02-02", trailer_link: "<iframe max-width:100% height=\"205\" src=\"https://w...", created_at: "2016-02-02 04:36:03", updated_at: "2016-02-02 04:36:03", online: true, duration: "165 min")
Film.create(name: "suicide squad", description: "A secret government agency recruits imprisoned sup...", released_date: "2016-08-05", trailer_link: "<iframe max-width=\"300\" height=\"205\" src=\"https://...", created_at: "2016-03-05 00:00:00", updated_at: "2016-03-05 00:00:00", online: true, duration: "124 min")
#=======test data=============== 