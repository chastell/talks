## let’s have a weather service for vehicles

```ruby
describe Weather do
  describe '#for' do
    it 'returns weather at vehicle’s location' do
      camaro  = Vehicle.new
      weather = Weather.new
      camaro.location = 'Warsaw'
      expect(weather.for camaro).to be :outsideish
      camaro.location = 'Wrocław'
      expect(weather.for camaro).to be :insideish
    end
  end
end
```


## let’s make the spec pass

```ruby
class Vehicle
  attr_writer :location

  def location
    @location
  end
end
```

```ruby
class Weather
  def for vehicle
    case vehicle.location
    when 'Warsaw'  then :outsideish
    when 'Wrocław' then :insideish
    end
  end
end
```
<!-- .element: class="fragment" -->

```no-highlight
$ rspec weather_spec.rb
```
<!-- .element: class="fragment" -->

```no-highlight
.

Finished in 0.0007 seconds
1 example, 0 failures
```
<!-- .element: class="fragment" -->


## fondling with GPS is never quick

```ruby
class Vehicle
  attr_writer :location

  def location
    sleep 10              # this just in
    @location
  end
end
```

```no-highlight
$ rspec weather_spec.rb
```
<!-- .element: class="fragment" -->

```no-highlight
.

Finished in 20 seconds
1 example, 0 failures
```
<!-- .element: class="fragment" -->

<p class='fragment quote'>OH: These tests run so long,<br
/>they must by really good.<br />— Filip Tepper</p>


## stub all the pain away

```ruby
require 'ostruct'                                   # don’t forget about this

describe Weather do
  describe '#for' do
    it 'returns weather at vehicle’s location' do
      camaro  = OpenStruct.new                      # the simplest double
      weather = Weather.new
      camaro.location = 'Warsaw'
      expect(weather.for camaro).to be :outsideish
      camaro.location = 'Wrocław'
      expect(weather.for camaro).to be :insideish
    end
  end
end
```

```no-highlight
$ rspec weather_spec.rb
```
<!-- .element: class="fragment" -->

```no-highlight
.

Finished in 0.00062 seconds
1 example, 0 failures
```
<!-- .element: class="fragment" -->


## lovely sophistication you got there…

```ruby
class Vehicle
  attr_writer :whereabouts   # whereabouts!

  def whereabouts            # look, here as well!
    sleep 10
    @whereabouts             # and here! CON-SIST-EN-CY!
  end
end
```

## it’d be a shame if something happened to it


## WHAT BREAKING CHANGE?

```no-highlight
$ rspec weather_spec.rb
```
<!-- .element: class="fragment" -->

```no-highlight
.

Finished in 0.00063 seconds
1 example, 0 failures
```
<!-- .element: class="fragment" -->

## EVERYTHING WORKS FINE LOL
<!-- .element: class="fragment" -->

# ಠ_ರೃ
<!-- .element: class="fragment" -->


## meanwhile in integration tests…

```no-highlight
$ rspec weather_spec.rb
```

```no-highlight
F

Failures:

  1) Weather#for returns weather at vehicle’s location
     Failure/Error: camaro.location = 'Warsaw'
     NoMethodError:
       undefined method `location=' for #<Vehicle:0x007f60799ff700>
     # ./weather_spec.rb:25:in `block (3 levels) in <top (required)>'

Finished in 0.00034 seconds
1 example, 1 failure

Failed examples:

rspec ./weather_spec.rb:22 # Weather#for returns weather at vehicle’s location
```
