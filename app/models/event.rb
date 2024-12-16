class Event < ApplicationRecord

  def self.upcoming
    where("starts_at > ?", Time.now).order("starts_at")
  end

  def free?
    price.blank? || price.zero?
  end
end

#.blank? method to know if it has been set or not ?
#.zero? == 0

