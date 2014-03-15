# faking roles

<div class='fragment'>
  <p>![magnets](img/magnets.jpg)</p>
  <h1>(how do they work)</h1>
</div>


## what if I told you

```ruby
describe Weather do
  describe '#for' do
    it 'returns weather at argument’s whereabouts' do
      camaro     = fake :vehicle,    whereabouts: 'Warsaw'
      wrocloverb = fake :conference, whereabouts: 'Wrocław'
      weather    = Weather.new
      expect(weather.for camaro).to be :outsideish
      expect(weather.for wrocloverb).to be :insideish
    end
  end
end
```

## conferences also have their whereabouts?


## two classes that are pinpointable

```ruby
class Conference
  def whereabouts
  end
end

class Vehicle
  def whereabouts
  end
end

class Weather
  def for pinpointable
    case pinpointable.whereabouts
    when 'Warsaw'  then :outsideish
    when 'Wrocław' then :insideish
    end
  end
end
```


## can we describe the role?

```ruby
describe Weather do
  describe '#for' do
    it 'returns weather at vehicle location' do
      pinpointable = fake(:pinpointable) { [Conference, Vehicle] }
      stub(pinpointable).whereabouts { 'Wrocław' }
      weather = Weather.new
      expect(weather.for pinpointable).to be :insideish
    end
  end
end
```

## both `Conference` & `Vehicle` must have `#whereabouts`


## probably best to define globally and reuse

```ruby
Bogus.fakes do
  fake :logger, class: -> { [FileLogger, UDPLogger, LoggerOverAvianCarriers] }
end
```

## `logger = fake(:logger)` fakes<br />can now only stub and mock<br />methods common to all three classes
<!-- .element class="fragment" -->

<p class='fragment quote'>OH: ‘You can’t do that with
Test Driven Development.’<br />‘No, YOU can’t do that
with Test Driven Development.’<br />— Katrina Owen</p>
