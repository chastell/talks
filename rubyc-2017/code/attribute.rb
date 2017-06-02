class Conference
  def initialize(city:, name:)
    @city = city
    @name = name
  end

  attr_accessor :city, :name
end

class Conference
  def initialize(city:, name:)
    @city = city
    @name = name
  end

  attr_reader :city, :name

  def with(city: @city, name: @name)
    self.class.new(city: city, name: name)
  end
end

jrubyconf_eu = Conference.new(city: 'Berlin', name: 'JRubyConf EU') 
eurucamp = jrubyconf_eu.with(name: 'eurucamp')

p jrubyconf_eu
p eurucamp

polyconf_2016 = Conference.new(city: 'Poznań', name: 'PolyConf')
polyconf_2017 = polyconf_2016.with(city: 'Paris')
p polyconf_2016
p polyconf_2017
