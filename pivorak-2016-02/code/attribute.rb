class Meetup
  def initialize(city:, name:)
    @city = city
    @name = name
  end

  attr_accessor :city, :name
end

class Meetup
  def initialize(city:, name:)
    @city = city
    @name = name
  end

  attr_reader :city, :name

  def update(city: @city, name: @name)
    self.class.new(city: city, name: name)
  end
end

jrubyconf_eu = Meetup.new(city: 'Berlin', name: 'JRubyConf EU') 
eurucamp = jrubyconf_eu.update(name: 'eurucamp')

p jrubyconf_eu
p eurucamp
