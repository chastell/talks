!SLIDE center transition=scrollLeft

# let’s stub
## (in real life consider not stubbing value objects)

!SLIDE

```ruby
require 'minitest/autorun'
require 'minitest/pride'







describe Envelope do
  describe '#formatted' do
    it 'returns a formatted envelope' do
      frodo    = Person.new 'Frodo', 'Baggins'
      bag_end  = Address.new 'Bag End', 'Hobbiton', 'Shire'
      envelope = Envelope.new person: frodo, address: bag_end
      envelope.formatted.must_equal <<-end.gsub(/^ {8}/, '')
        Frodo Baggins
        Bag End
        Hobbiton, Shire
      end
    end
  end
end
```

!SLIDE

```ruby
require 'minitest/autorun'
require 'minitest/pride'

require 'ostruct'

def stób opts = {}
  OpenStruct.new opts
end

describe Envelope do
  describe '#formatted' do
    it 'returns a formatted envelope' do
      frodo    = Person.new 'Frodo', 'Baggins'
      bag_end  = Address.new 'Bag End', 'Hobbiton', 'Shire'
      envelope = Envelope.new person: frodo, address: bag_end
      envelope.formatted.must_equal <<-end.gsub(/^ {8}/, '')
        Frodo Baggins
        Bag End
        Hobbiton, Shire
      end
    end
  end
end
```

!SLIDE

```ruby
require 'minitest/autorun'
require 'minitest/pride'

require 'ostruct'

def stób opts = {}
  OpenStruct.new opts
end

describe Envelope do
  describe '#formatted' do
    it 'returns a formatted envelope' do
      frodo    = stób first_name: 'Frodo', last_name: 'Baggins'
      bag_end  = stób street: 'Bag End', city: 'Hobbiton', country: 'Shire'
      envelope = Envelope.new person: frodo, address: bag_end
      envelope.formatted.must_equal <<-end.gsub(/^ {8}/, '')
        Frodo Baggins
        Bag End
        Hobbiton, Shire
      end
    end
  end
end
```

!SLIDE commandline incremental

    $ ruby stubbed.rb
    Run options: --seed 51265

    ​# Running:

    .

    Fabulous run in 0.000959s, 1043.2794 runs/s, 1043.2794 assertions/s.

    1 runs, 1 assertions, 0 failures, 0 errors, 0 skips

!SLIDE bullets incremental

# what if…
* Frodo Baggins went on a trip
* came back as Nine Fingered Frodo
* …or you just read<br />[Personal names around the world](http://www.w3.org/International/questions/qa-personal-names)?
* `Person = Struct.new :first_name, :last_name`
* `Person = Struct.new :name`

!SLIDE commandline incremental

    $ ruby integrated.rb
    Run options: --seed 36592

    ​# Running:

    E

    Fabulous run in 0.000896s, 1116.5238 runs/s, 0.0000 assertions/s.

      1) Error:
    Envelope::#formatted#test_0001_returns a formatted envelope:
    ArgumentError: struct size differs
        integrated.rb:23:in `initialize'
        integrated.rb:23:in `new'
        integrated.rb:23:in `block (3 levels) in <main>'

    1 runs, 0 assertions, 0 failures, 1 errors, 0 skips

!SLIDE commandline incremental

    $ ruby stubbed.rb
    Run options: --seed 21067

    ​# Running:

    .

    Fabulous run in 0.000971s, 1029.7039 runs/s, 1029.7039 assertions/s.

    1 runs, 1 assertions, 0 failures, 0 errors, 0 skips

!SLIDE center

# ಠ_ಠ
