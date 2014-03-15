# enter<br /><del>Bogus</del><br />verified doubles

## (using Bogus)
<!-- .element: class="fragment" -->

## (but also available in RSpec 3)
<!-- .element: class="fragment" -->


## previously: naïve stubbing

```ruby
require 'ostruct'

describe Weather do
  describe '#for' do
    it 'returns weather at vehicle’s location' do
      camaro  = OpenStruct.new
      weather = Weather.new
      camaro.location = 'Warsaw'
      expect(weather.for camaro).to be :outsideish
      camaro.location = 'Wrocław'
      expect(weather.for camaro).to be :insideish
    end
  end
end
```


## now: verified stubbing!

```ruby
require 'bogus/rspec'                               # a different require!

describe Weather do
  describe '#for' do
    it 'returns weather at vehicle’s location' do
      camaro  = fake :vehicle                       # this car is a fake!
      weather = Weather.new
      stub(camaro).location { 'Warsaw' }            # stubbin’
      expect(weather.for camaro).to be :outsideish
      stub(camaro).location { 'Wrocław' }           # stubbin’
      expect(weather.for camaro).to be :insideish
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

  1) Weather#for returns weather at vehicle’s location
     Failure/Error: stub(camaro).location { 'Warsaw' }
     NameError:
       #<…> does not respond to location
     # ./weather_spec.rb:27:in `block (3 levels) in <top (required)>'

Finished in 0.00293 seconds
1 example, 1 failure

Failed examples:

rspec ./weather_spec.rb:24 # Weather#for returns weather at vehicle’s location
```


## (pure RSpec – this passes and shouldn’t)

```ruby
describe Weather do
  describe '#for' do
    it 'returns weather at vehicle’s location' do
      camaro  = double :vehicle                           # an RSpec double
      weather = Weather.new
      allow(camaro).to receive(:location) { 'Warsaw' }    # an RSpec stub
      expect(weather.for camaro).to be :outsideish
      allow(camaro).to receive(:location) { 'Wrocław' }   # another
      expect(weather.for camaro).to be :insideish
    end
  end
end
```


## (pure RSpec – the fix)

```ruby
describe Weather do
  describe '#for' do
    it 'returns weather at vehicle’s location' do
      camaro  = instance_double 'Vehicle'                # a verified double
      weather = Weather.new
      allow(camaro).to receive(:location) { 'Warsaw' }
      expect(weather.for camaro).to be :outsideish
      allow(camaro).to receive(:location) { 'Wrocław' }
      expect(weather.for camaro).to be :insideish
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

  1) Weather#for returns weather at vehicle’s location
     Failure/Error: allow(camaro).to receive(:location) { 'Warsaw' }
       Vehicle does not implement:
         location
     # ./weather_spec.rb:25:in `block (3 levels) in <top (required)>'

Finished in 0.0005 seconds
1 example, 1 failure

Failed examples:

rspec ./weather_spec.rb:22 # Weather#for returns weather at vehicle’s location
```


# RSpec verified doubles

* [available in RSpec
3](https://relishapp.com/rspec/rspec-mocks/v/3-0/docs/verifying-doubles)
<!-- .element: class="fragment" -->

* guard when doubling existing classes
<!-- .element: class="fragment" -->

* work like regular doubles<br />when doubling missing classes
<!-- .element: class="fragment" -->

* (is this good or bad?)
<!-- .element: class="fragment" -->
