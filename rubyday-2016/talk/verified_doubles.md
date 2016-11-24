# enter<br /><del>Bogus</del><br />verified doubles

## (using Bogus)
<!-- .element: class="fragment" -->

## (but also available in RSpec)
<!-- .element: class="fragment" -->


## previously: naïve stubbing

```ruby
require 'ostruct'

describe Weather do
  describe '#fo﻿r' do
    it 'returns weather at plane’s location' do
      charter = OpenStruct.new
      weather = Weather.new
      charter.location = 'Warsaw'
      expect(weather.fo﻿r(charter)).to be :insideish
      charter.location = 'Florence'
      expect(weather.fo﻿r(charter)).to be :outsideish
    end
  end
end
```


## now: verified stubbing!

```ruby
require 'bogus/rspec'                                  # a different require!

describe Weather do
  describe '#fo﻿r' do
    it 'returns weather at plane’s location' do
      charter = fake(:plane)                           # this car is a fake!
      weather = Weather.new
      stub(charter).location { 'Warsaw' }              # stubbin’
      expect(weather.fo﻿r(charter)).to be :insideish
      stub(charter).location { 'Florence' }            # stubbin’
      expect(weather.fo﻿r(charter)).to be :outsideish
    end
  end
end
```


## crisis averted via doubles you can count on!

```no-highlight
$ rspec weather_spec.rb
```

```no-highlight
F

Failures:

  1) Weather#fo﻿r returns weather at plane’s location
     Failure/Error: stub(charter).location { 'Warsaw' }
     NameError:
       #<…> does not respond to location
     # ./weather_spec.rb:27:in `block (3 levels) in <top (required)>'

Finished in 0.00293 seconds
1 example, 1 failure

Failed examples:

rspec ./weather_spec.rb:24 # Weather#fo﻿r returns weather at plane’s location
```


## (pure RSpec – this passes and shouldn’t)

```ruby
describe Weather do
  describe '#fo﻿r' do
    it 'returns weather at plane’s location' do
      charter = double(:plane)                             # an RSpec double
      weather = Weather.new
      allow(charter).to receive(:location) { 'Warsaw' }    # an RSpec stub
      expect(weather.fo﻿r(charter)).to be :insideish
      allow(charter).to receive(:location) { 'Florence' }  # another
      expect(weather.fo﻿r(charter)).to be :outsideish
    end
  end
end
```


## (pure RSpec – the fix)

```ruby
describe Weather do
  describe '#fo﻿r' do
    it 'returns weather at plane’s location' do
      charter = instance_double('Plane')                    # a verified double
      weather = Weather.new
      allow(charter).to receive(:location) { 'Warsaw' }
      expect(weather.fo﻿r(charter)).to be :insideish
      allow(charter).to receive(:location) { 'Florence' }
      expect(weather.fo﻿r(charter)).to be :outsideish
    end
  end
end
```


## (RSpec verified doubles also save the day)

```no-highlight
$ rspec weather_spec.rb
```
```no-highlight
F

Failures:

  1) Weather#fo﻿r returns weather at plane’s location
     Failure/Error: allow(charter).to receive(:location) { 'Warsaw' }
       Plane does not implement:
         location
     # ./weather_spec.rb:25:in `block (3 levels) in <top (required)>'

Finished in 0.0005 seconds
1 example, 1 failure

Failed examples:

rspec ./weather_spec.rb:22 # Weather#fo﻿r returns weather at plane’s location
```


# RSpec verified doubles

* [available in RSpec](https://relishapp.com/rspec/rspec-mocks/v/3-5/docs/verifying-doubles)
<!-- .element: class="fragment" -->

* guard when doubling existing classes
<!-- .element: class="fragment" -->

* work like regular doubles<br />when doubling missing classes
<!-- .element: class="fragment" -->

* (is this good or bad?)
<!-- .element: class="fragment" -->
