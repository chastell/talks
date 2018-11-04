Location = Struct.new(:lat, :lon)

class Conference
  def initialize(city, nav_source: NavSource.new)
    @city       = city
    @nav_source = nav_source
    @location   = nav_source.location(@city)
  end

  def directions(source_location)
    if @location
      @nav_source.directions(from: source_location, to: @location)
    end
  end

  def distance(source_location)
    if @location
      @nav_source.distance(from: source_location, to: @location)
    end
  end

  def needs_passport?(source_location)
    if @location
      @nav_source.borders?(from: source_location, to: @location)
    end
  end
end

nav_source = Class.new do
  def borders?(from:, to:)
    "checking borders between #{from} and #{to}…"
  end

  def location(_)
    Location.new(0, 0)
  end

  def directions(from:, to:)
    "calculating directions from #{from} to #{to}…"
  end

  def distance(from:, to:)
    "calculating distance from #{from} to #{to}…"
  end
end.new

p Conference.new('Braga', nav_source: nav_source).directions(Location.new(1, 2))
p Conference.new('Braga', nav_source: nav_source).distance(Location.new(3, 4))
p Conference.new('Braga', nav_source: nav_source).needs_passport?(Location.new(1, 2))
