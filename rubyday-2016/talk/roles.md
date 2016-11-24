# faking roles

<div class='fragment'>
  <p>![magnets](img/magnets.jpg)</p>
  <h1>(how do they work)</h1>
</div>


## what if I told you

```ruby
describe Weather do
  describe '#fo﻿r' do
    it 'returns weather at argument’s whereabouts' do
      charter = fake(:plane,      whereabouts: 'Warsaw')
      rubyday = fake(:conference, whereabouts: 'Florence')
      weather = Weather.new
      expect(weather.fo﻿r(charter)).to be :insideish
      expect(weather.fo﻿r(rubyday)).to be :outsideish
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

class Plane
  def whereabouts
  end
end

class Weather
  def fo﻿r(pinpointable)
    case pinpointable.whereabouts
    when 'Warsaw'   then :insideish
    when 'Florence' then :outsideish
    end
  end
end
```


## can we describe the role?

```ruby
describe Weather do
  describe '#fo﻿r' do
    it 'returns weather at plane location' do
      pinpointable = fake(:pinpointable) { [Conference, Plane] }
      stub(pinpointable).whereabouts { 'Florence' }
      weather = Weather.new
      expect(weather.fo﻿r(pinpointable)).to be :outsideish
    end
  end
end
```

## both `Conference` & `Plane` must have `#whereabouts`


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
