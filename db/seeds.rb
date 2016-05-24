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
# ========================================The jungle book
Film.create(id: 7,name: "The Jungle Book", description: "Directed by Jon Favreau (Chef, Iron Man, Elf), based on Rudyard Kipling’s timeless stories and inspired by Disney’s classic animated film, THE JUNGLE BOOK is an all-new live-action epic adventure about Mowgli, a man-cub who’s been raised by a family of wolves. But Mowgli finds he is no longer welcome in the jungle when fearsome tiger Shere Khan, who bears the scars of Man, promises to eliminate what he sees as a threat. 
Urged to abandon the only home he’s ever known, Mowgli embarks on a captivating journey of self-discovery, guided by panther-turned-stern mentor Bagheera , and the free-spirited bear Baloo. Along the way, Mowgli encounters jungle creatures who don’t exactly have his best interests at heart, including Kaa, a python whose seductive voice and gaze hypnotizes the mancub, and the smooth-talking King Louie, who tries to coerce Mowgli into giving up the secret to the elusive and deadly red flower: fire. ", released_date: "2016-04-07", trailer_link: '<iframe width="560" height="315" src="https://www.youtube.com/embed/C4qgAaxB_pc" frameborder="0" allowfullscreen></iframe>', online: true, duration: "111 min")

Poster.create(id: 7,title: "small size", image_url: "https://farm8.staticflickr.com/7060/26868581410_e4e4593732_m.jpg", film_id: 7)
CinemaShowing.create(cinema_id: 1, film_id: 7, on_date: "2016-05-11", off_date: Date.today+1.month);
#============================================================

Film.find(3).update(:name=>"Civil War", :description=>"Marvel’s CAPTAIN AMERICA: CIVIL WAR finds Steve Rogers leading the newly formed team of Avengers in their continued efforts to safeguard humanity. But after another incident involving the Avengers results in collateral damage, political pressure mounts to install a system of accountability, headed by a governing body to oversee and direct the team. The new status quo fractures the Avengers, resulting in two camps—one led by Steve Rogers and his desire for the Avengers to remain free to defend humanity without government interference, and the other following Tony Stark’s surprising decision to support government oversight and accountability.", online: true,released_date: "2016-04-28", duration: "147 min", trailer_link: '<iframe width="560" height="315" src="https://www.youtube.com/embed/21HP6OFn5OE" frameborder="0" allowfullscreen></iframe>')
Film.find(1).update(:name=>"Star Wars", :description=>"The Force Awakens", online: true,released_date: "2015-12-18", duration: "136 min", trailer_link: '<iframe width="560" height="315" src="https://www.youtube.com/embed/sGbxmsDFVnE" frameborder="0" allowfullscreen></iframe>')
Poster.create(title: "small size", image_url: "https://farm8.staticflickr.com/7051/27074386061_c545a85883_m.jpg", film_id: 3)


#=======screen data=============== 
Cinema.all.each do |c|
    (1..12).each do |i|
        c.screens.create(:number=> i)
    end
end
# ===================add film===========
Film.create(id: 8,name: "Zootopia", description: "In the animal city of Zootopia, a fast-talking fox who's trying to make it big goes on the run when he's framed for a crime he didn't commit. Zootopia's top cop, a self-righteous rabbit, is hot on his tail, but when both become targets of a conspiracy, they're forced to team up and discover even natural enemies can become best friends.", released_date: "2016-03-17", trailer_link: '<iframe width="560" height="315" src="https://www.youtube.com/embed/yCOPJi0Urq4" frameborder="0" allowfullscreen></iframe>',  online: true, duration: "108 min")

Poster.create(id: 8,title: "small size", image_url: "https://farm8.staticflickr.com/7270/27160643246_e7e25d0462_m.jpg", film_id: 8)

CinemaShowing.create(cinema_id: 1, film_id: 8, on_date: "2016-05-11", off_date: Date.today+3.months);
CinemaShowing.create(cinema_id: 2, film_id: 8, on_date: "2016-05-11", off_date: Date.today+3.months);
CinemaShowing.create(cinema_id: 3, film_id: 8, on_date: "2016-05-11", off_date: Date.today+3.months);



Film.create(id: 9, name: "X-Men: Apocalypse", description: "Following the critically acclaimed global smash hit X-Men: Days of Future Past, director Bryan Singer returns with X-MEN: APOCALYPSE. Since the dawn of civilization, he was worshipped as a god. Apocalypse, the first and most powerful mutant from Marvel's X-Men universe, amassed the powers of many other mutants, becoming immortal and invincible. Upon awakening after thousands of years, he is disillusioned with the world as he finds it and recruits a team of powerful mutants, including a disheartened Magneto (Michael Fassbender), to cleanse mankind and create a new world order, over which he will reign. As the fate of the Earth hangs in the balance, Raven (Jennifer Lawrence) with the help of Professor X (James McAvoy) must lead a team of young X-Men to stop their greatest nemesis and save mankind from complete destruction.", released_date: "2016-05-19", trailer_link: '<iframe width="560" height="315" src="https://www.youtube.com/embed/C0Jz0oYBzBU" frameborder="0" allowfullscreen></iframe>', online: true, duration: "144 min")

Poster.create(id: 9,title: "small size", image_url: "https://farm8.staticflickr.com/7600/26587927654_5744731a5f_m.jpg", film_id: 9)

CinemaShowing.create(cinema_id: 1, film_id: 9, on_date: "2016-05-11", off_date: Date.today+3.months);
CinemaShowing.create(cinema_id: 3, film_id: 9, on_date: "2016-05-11", off_date: Date.today+3.months);

# =================
Film.create(id: 10, name: "Teenage Mutant Ninja Turtles: Out Of The Shadow", description: "The Turtles return to save the city from a dangerous threat.", released_date: "2016-06-09", trailer_link: '<iframe width="560" height="315" src="https://www.youtube.com/embed/HeaugHGd1Kw" frameborder="0" allowfullscreen></iframe>', online: true, duration: "144 min")

Poster.create(id: 10,title: "small size", image_url: "https://farm8.staticflickr.com/7127/26589013263_8636b33a5b_m.jpg", film_id: 10)

CinemaShowing.create(cinema_id: 1, film_id: 10, on_date: "2016-05-11", off_date: Date.today+3.months);
CinemaShowing.create(cinema_id: 2, film_id: 10, on_date: "2016-05-11", off_date: Date.today+3.months);
CinemaShowing.create(cinema_id: 3, film_id: 10, on_date: "2016-05-11", off_date: Date.today+3.months);

# =================
Film.create(id: 11, name: "The Angry Birds Movie", description: "The movie takes us to an island populated entirely by happy, flightless birds - or almost entirely. In this paradise, Red (Jason Sudeikis, We're the Millers, Horrible Bosses), a bird with a temper problem, speedy Chuck (Josh Gad in his first animated role since Frozen), and the volatile Bomb (Danny McBride, This is the End, Eastbound and Down) have always been outsiders. But when the island is visited by mysterious green piggies, it's up to these unlikely outcasts to figure out what the pigs are up to. Featuring a hilarious, all-star voice cast that includes Bill Hader (Trainwreck, Inside Out), Maya Rudolph (Bridesmaids), and Peter Dinklage (Game of Thrones), as well as Keegan-Michael Key (Key & Peele), Kate McKinnon (Saturday Night Live, next year's Ghostbusters) and Tony Hale (Veep, Arrested Development).", released_date: "2016-05-12", trailer_link: '<iframe width="560" height="315" src="https://www.youtube.com/embed/1U2DKKqxHgE" frameborder="0" allowfullscreen></iframe>', online: true, duration: "97 min")

Poster.create(id: 11,title: "small size", image_url: "https://farm8.staticflickr.com/7362/27124965021_f6e9213271_m.jpg", film_id: 11)

CinemaShowing.create(cinema_id: 1, film_id: 11, on_date: "2016-05-11", off_date: Date.today+3.months);
CinemaShowing.create(cinema_id: 2, film_id: 11, on_date: "2016-05-11", off_date: Date.today+3.months);
CinemaShowing.create(cinema_id: 3, film_id: 11, on_date: "2016-05-11", off_date: Date.today+3.months);







