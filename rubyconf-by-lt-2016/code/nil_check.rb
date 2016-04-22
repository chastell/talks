class Conference
  def initialize(name = nil)
    @name = name
  end

  def acronym?
    !!@name.match(/\A(\p{Upper})+\z/) unless @name.nil?
  end
end

p Conference.new('Pivorak').acronym?
p Conference.new('WRUG').acronym?
p Conference.new.acronym?

class Conference
  def self.new(name = nil)
    name ? super : UnnamedConference.new
  end

  def initialize(name)
    @name = name
  end

  def acronym?
    !!@name.match(/\A(\p{Upper})+\z/)
  end
end

class UnnamedConference
  def acronym?
    false
  end
end

p Conference.new('Pivorak').acronym?
p Conference.new('WRUG').acronym?
p Conference.new.acronym?
