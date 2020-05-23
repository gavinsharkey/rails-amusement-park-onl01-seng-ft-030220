class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    error_string = 'Sorry.'
    if self.user.tickets < self.attraction.tickets
      error_string << " You do not have enough tickets to ride the #{self.attraction.name}."
    end

    if self.user.height < self.attraction.min_height
      error_string << " You are not tall enough to ride the #{self.attraction.name}."
    end

    if error_string == 'Sorry.'
      self.user.tickets -= self.attraction.tickets
      self.user.nausea += self.attraction.nausea_rating
      self.user.happiness += self.attraction.happiness_rating
      self.user.save
      "Thanks for riding the #{self.attraction.name}!"
    else
      error_string
    end
  end
end
