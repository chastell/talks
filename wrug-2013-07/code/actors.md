!SLIDE

```ruby
Person  = Struct.new :first_name, :last_name
Address = Struct.new :street, :city, :country


















```

!SLIDE

```ruby
Person  = Struct.new :first_name, :last_name
Address = Struct.new :street, :city, :country

require 'minitest/autorun'
require 'minitest/pride'

describe Envelope do
  describe '#formatted' do
    it 'returns a formatted envelope' do








    end
  end
end
```

!SLIDE

```ruby
Person  = Struct.new :first_name, :last_name
Address = Struct.new :street, :city, :country

require 'minitest/autorun'
require 'minitest/pride'

describe Envelope do
  describe '#formatted' do
    it 'returns a formatted envelope' do
      frodo    = Person.new 'Frodo', 'Baggins'
      bag_end  = Address.new 'Bag End', 'Hobbiton', 'Shire'






    end
  end
end
```

!SLIDE

```ruby
Person  = Struct.new :first_name, :last_name
Address = Struct.new :street, :city, :country

require 'minitest/autorun'
require 'minitest/pride'

describe Envelope do
  describe '#formatted' do
    it 'returns a formatted envelope' do
      frodo    = Person.new 'Frodo', 'Baggins'
      bag_end  = Address.new 'Bag End', 'Hobbiton', 'Shire'

                                    <<-end
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
Person  = Struct.new :first_name, :last_name
Address = Struct.new :street, :city, :country

require 'minitest/autorun'
require 'minitest/pride'

describe Envelope do
  describe '#formatted' do
    it 'returns a formatted envelope' do
      frodo    = Person.new 'Frodo', 'Baggins'
      bag_end  = Address.new 'Bag End', 'Hobbiton', 'Shire'
      envelope = Envelope.new person: frodo, address: bag_end
                                    <<-end
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
Person  = Struct.new :first_name, :last_name
Address = Struct.new :street, :city, :country

require 'minitest/autorun'
require 'minitest/pride'

describe Envelope do
  describe '#formatted' do
    it 'returns a formatted envelope' do
      frodo    = Person.new 'Frodo', 'Baggins'
      bag_end  = Address.new 'Bag End', 'Hobbiton', 'Shire'
      envelope = Envelope.new person: frodo, address: bag_end
      envelope.formatted.must_equal <<-end
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
Person  = Struct.new :first_name, :last_name
Address = Struct.new :street, :city, :country

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
