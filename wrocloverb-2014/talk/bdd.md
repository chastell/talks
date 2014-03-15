# BDD

## (Bogus-Driven Development)


## doubles driving design

```ruby
describe Weather do
  describe '#for' do
    it 'returns weather at vehicle’s whereabouts' do
      camaro  = fake :vehicle
      weather = Weather.new
      stub(camaro).whereabouts { 'Warsaw' }
      expect(weather.for camaro).to be :outsideish
      stub(camaro).whereabouts { 'Wrocław' }
      expect(weather.for camaro).to be :insideish
    end
  end
end
```


## the previous spec requires at least the below

```ruby
class Vehicle
  def whereabouts
  end
end

class Weather
  def for vehicle
    case vehicle.whereabouts
    when 'Warsaw'  then :outsideish
    when 'Wrocław' then :insideish
    end
  end
end
```


## let’s query an external service (via mocking)

```ruby
describe Weather do
  describe '#for' do
    it 'passes the query to an external service' do
      camaro  = fake :vehicle, whereabouts: 'Warsaw'   # stubbing directly
      service = fake :service
      weather = Weather.new service: service
      mock(service).weather_at 'Warsaw'                # mocking forces call
      weather.for camaro
    end
  end
end
```


## let’s query an external service (via spying)

```ruby
describe Weather do
  describe '#for' do
    it 'passes the query to an external service' do
      camaro  = fake :vehicle, whereabouts: 'Warsaw'
      service = fake :service
      weather = Weather.new service: service
      weather.for camaro
      expect(service).to have_received.weather_at 'Warsaw'   # spying after
    end
  end
end
```


## again, the below was required to pass the spec

```ruby
class Service
  def weather_at whereabouts
  end
end

class Vehicle
  def whereabouts
  end
end

class Weather
  def initialize service: Service.new
    @service = service
  end

  def for vehicle
    @service.weather_at vehicle.whereabouts
  end
end
```


# bonus: object decoupling

![dhh](img/dhh.jpg)

# via dependency injection


<p class='quote'>Seems like (mockist) TDD<br />leads to designing
objects<br />which don’t appear to need tests,<br />but not writing
tests<br />leads to objects that do.<br />— Peter Jaros</p>
