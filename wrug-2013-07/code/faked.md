!SLIDE center transition=scrollLeft

# Bogus: fakes

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

!SLIDE

```ruby
require 'minitest/autorun'
require 'minitest/pride'

require 'bogus/minitest/spec'





describe Envelope do
  describe '#formatted' do
    it 'returns a formatted envelope' do
      frodo    = fake :person, first_name: 'Frodo', last_name: 'Baggins'
      bag_end  = fake :address, street: 'Bag End', city: 'Hobbiton', country: 'Shire'
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

!SLIDE commandline incremental transition=scrollLeft

`Person = Struct.new :first_name, :last_name`

    $ ruby faked.rb
    Run options: --seed 52916

    ​# Running:

    .

    Fabulous run in 0.015601s, 64.0982 runs/s, 64.0982 assertions/s.

    1 runs, 1 assertions, 0 failures, 0 errors, 0 skips

!SLIDE commandline incremental

`Person = Struct.new :name`

    $ ruby faked.rb
    Run options: --seed 62670

    ​# Running:

    E

    Fabulous run in 0.009231s, 108.3306 runs/s, 0.0000 assertions/s.

      1) Error:
    Envelope::#formatted#test_0001_returns a formatted envelope:
    NameError: #<[…]> does not respond to first_name
        […]
        faked.rb:33:in `block (3 levels) in <main>'

    1 runs, 0 assertions, 0 failures, 1 errors, 0 skips
