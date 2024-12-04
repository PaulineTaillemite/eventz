class Event < ApplicationRecord
  def free?
    price.blank? || price.zero?
  end
end

#.blank? method to know if it has been set or not ?
#.zero? == 0

