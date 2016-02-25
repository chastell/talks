class Meetup
  def initialize(name = nil)
    @name = name
  end

  def acronym?
    !!@name.match(/\A(\p{Upper})+\z/) unless @name.nil?
  end
end

p Meetup.new('Pivorak').acronym?
p Meetup.new('WRUG').acronym?
p Meetup.new.acronym?

class Meetup
  def self.new(name = nil)
    name ? super : UnnamedMeetup.new
  end

  def initialize(name)
    @name = name
  end

  def acronym?
    !!@name.match(/\A(\p{Upper})+\z/)
  end
end

class UnnamedMeetup
  def acronym?
    false
  end
end

p Meetup.new('Pivorak').acronym?
p Meetup.new('WRUG').acronym?
p Meetup.new.acronym?
