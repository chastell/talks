class Meetup
  def initialize(city, nav_source: NavSource.new)
    @city       = city
    @nav_source = nav_source
    @lat, @lon  = nav_source.coords(@city)
  end

  def directions(source_lat, source_lon)
    @nav_source.directions(from: [source_lat, source_lon], to: [@lat, @lon])
  end

  def distance(source_lat, source_lon)
    @nav_source.distance(from: [source_lat, source_lon], to: [@lat, @lon])
  end

  def needs_passport?(source_lat, source_lon)
    @nav_source.borders?(from: [source_lat, source_lon], to: [@lat, @lon])
  end
end

nav_source = Class.new do
  def borders?(from:, to:)
    "checking borders between #{from} and #{to}…"
  end

  def coords(_)
    [0, 0]
  end

  def directions(from:, to:)
    "calculating directions from #{from} to #{to}…"
  end

  def distance(from:, to:)
    "calculating distance from #{from} to #{to}…"
  end
end.new

p Meetup.new('Braga', nav_source: nav_source).directions(1, 2)
p Meetup.new('Braga', nav_source: nav_source).distance(3, 4)
p Meetup.new('Braga', nav_source: nav_source).needs_passport?(1, 2)

Location = Struct.new(:lat, :lon)

class Meetup
  def initialize(city, nav_source: NavSource.new)
    @city       = city
    @nav_source = nav_source
    @location   = nav_source.location(@city)
  end

  def directions(source_location)
    @nav_source.directions(from: source_location, to: @location)
  end

  def distance(source_location)
    @nav_source.distance(from: source_location, to: @location)
  end

  def needs_passport?(source_location)
    @nav_source.borders?(from: source_location, to: @location)
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

p Meetup.new('Braga', nav_source: nav_source).directions(Location.new(1, 2))
p Meetup.new('Braga', nav_source: nav_source).distance(Location.new(3, 4))
p Meetup.new('Braga', nav_source: nav_source).needs_passport?(Location.new(1, 2))
