# BDD

## (Bogus-Driven Development)


## doubles driving design

```ruby
describe Weather do
  describe '#fo﻿r' do
    it 'returns weather at plane’s whereabouts' do
      charter = fake(:plane)
      weather = Weather.new
      stub(charter).whereabouts { 'Warsaw' }
      expect(weather.fo﻿r(charter)).to be :insideish
      stub(charter).whereabouts { 'Florence' }
      expect(weather.fo﻿r(charter)).to be :outsideish
    end
  end
end
```


## the previous spec requires at least the below

```ruby
class Plane
  def whereabouts
  end
end

class Weather
  def fo﻿r(plane)
    case plane.whereabouts
    when 'Warsaw'   then :insideish
    when 'Florence' then :outsideish
    end
  end
end
```


## let’s query an external service (via mocking)

```ruby
describe Weather do
  describe '#fo﻿r' do
    it 'passes the query to an external service' do
      charter = fake(:plane, whereabouts: 'Warsaw')   # stubbing directly
      service = fake(:service)
      weather = Weather.new(service: service)
      mock(service).weather_at 'Warsaw'               # mocking requires a call
      weather.fo﻿r charter
    end
  end
end
```


## let’s query an external service (via spying)

```ruby
describe Weather do
  describe '#fo﻿r' do
    it 'passes the query to an external service' do
      charter = fake(:plane, whereabouts: 'Warsaw')
      service = fake(:service)
      weather = Weather.new(service: service)
      weather.fo﻿r charter
      expect(service).to have_received.weather_at('Warsaw')   # spying after
    end
  end
end
```


## again, the below was required to pass the spec

```ruby
class Service
  def weather_at(whereabouts)
  end
end

class Plane
  def whereabouts
  end
end

class Weather
  def initialize(service: Service.new)
    @service = service
  end

  def fo﻿r(plane)
    @service.weather_at(plane.whereabouts)
  end
end
```


# bonus: object decoupling

![dhh](img/dhh.jpg)

# via dependency injection


<p class='quote'>Seems like (mockist) TDD<br />leads to designing
objects<br />which don’t appear to need tests,<br />but not writing
tests<br />leads to objects that do.<br />— Peter Jaros</p>
