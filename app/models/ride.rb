class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride
        message = "Sorry. "
        no_tickets = "You do not have enough tickets to ride the #{attraction.name}."
        too_short = "You are not tall enough to ride the #{attraction.name}."
        if user.tickets < attraction.tickets && user.height < attraction.min_height
            message + no_tickets + " " + too_short
        elsif user.tickets < attraction.tickets
            message + no_tickets
        elsif user.height < attraction.min_height
            message + too_short
        else
            user.tickets -= attraction.tickets
            user.happiness += attraction.happiness_rating
            user.nausea += attraction.nausea_rating
            user.save
            "Thanks for riding the #{attraction.name}!"
        end
    end
end
