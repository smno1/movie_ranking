class Cinema < ActiveRecord::Base
    has_and_belongs_to_many :showing_films, -> { select('cinema_showings.*') }, :class_name=>"Film", :join_table =>:cinema_showings

    def current_films
        d=Date.today
        self.showing_films#.where(":on_date < ? and :off_date> ?", d, d)
    end
end
