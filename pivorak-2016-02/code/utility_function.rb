class Meetup
  def successful?(attendees)
    excited, indifferent = attendees.partition(&:excited?)
    excited.count > indifferent.count
  end
end

class Meetup
  def initialize(attendees)
    @attendees = attendees
  end

  def successful?
    @attendees.excited?
  end
end

require 'forwardable'

class Attendees
  extend Forwardable

  def initialize(attendees)
    @attendees = attendees
  end

  delegate partition: :@attendees

  def excited?
    excited, indifferent = partition(&:excited?)
    excited.count > indifferent.count
  end
end
