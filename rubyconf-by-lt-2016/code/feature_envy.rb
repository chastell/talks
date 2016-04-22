class Conference
  def initialize(language)
    @language = language
  end

  def successful?(attendees)
    excited, indifferent = attendees.partition do |attendee|
      attendee.excited? || @language == 'Ruby' && attendee.rubyist?
    end
    excited.count > indifferent.count
  end
end

class Attendees
  def excited?(language: nil)
    excited, indifferent = partition { |att| att.excited?(language: language) }
    excited.count > indifferent.count
  end
end

class Attendee
  def excited?(language: nil)
    @excited || @rubyist && language == 'Ruby'
  end
end

class Conference
  def initialize(attendees, language: nil)
    @attendees = attendees
    @language  = language
  end

  def successful?
    @attendees.excited?(language: @language)
  end
end
