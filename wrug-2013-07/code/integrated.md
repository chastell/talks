!SLIDE commandline incremental transition=scrollLeft

    $ ruby integrated.rb
    integrated.rb:7:in `<main>': uninitialized constant Envelope (NameError)

!SLIDE transition=scrollRight

```ruby



class Envelope
















end
```

!SLIDE commandline incremental transition=scrollLeft

    $ ruby integrated.rb
    Run options: --seed 15210

    ​# Running:

    E

    Fabulous run in 0.000956s, 1045.9321 runs/s, 0.0000 assertions/s.

      1) Error:
    Envelope::#formatted#test_0001_returns a formatted envelope:
    ArgumentError: wrong number of arguments (1 for 0)
        integrated.rb:15:in `initialize'
        integrated.rb:15:in `new'
        integrated.rb:15:in `block (3 levels) in <main>'

    1 runs, 0 assertions, 0 failures, 1 errors, 0 skips

!SLIDE transition=scrollRight

```ruby



class Envelope


  def initialize person: person, address: address

  end











end
```

!SLIDE commandline incremental transition=scrollLeft

    $ ruby integrated.rb
    Run options: --seed 61530

    ​# Running:

    E

    Fabulous run in 0.000900s, 1111.6756 runs/s, 0.0000 assertions/s.

      1) Error:
    Envelope::#formatted#test_0001_returns a formatted envelope:
    NoMethodError: undefined method `formatted' for #<Envelope:0x00000001d47d20>
        integrated.rb:18:in `block (3 levels) in <main>'

    1 runs, 0 assertions, 0 failures, 1 errors, 0 skips

!SLIDE transition=scrollRight

```ruby



class Envelope


  def initialize person: person, address: address

  end




  def formatted





  end
end
```

!SLIDE commandline incremental transition=scrollLeft

    $ ruby integrated.rb
    Run options: --seed 4772

    ​# Running:

    F

    Fabulous run in 0.022226s, 44.9926 runs/s, 44.9926 assertions/s.

      1) Failure:
    Envelope::#formatted#test_0001_returns a formatted envelope [integrated.rb:21]:
    --- expected
    +++ actual
    @@ -1,4 +1 @@
    -"Frodo Baggins
    -Bag End
    -Hobbiton, Shire
    -"
    +nil


    1 runs, 1 assertions, 1 failures, 0 errors, 0 skips

!SLIDE transition=scrollRight

```ruby



class envelope


  def initialize person: person, address: address

  end




  def formatted
    <<-end.gsub(/^ {6}/, '')
      Frodo Baggins
      Bag End
      Hobbiton, Shire
    end
  end
end
```

!SLIDE commandline incremental transition=scrollLeft

    $ ruby integrated.rb
    Run options: --seed 53637

    ​# Running:

    .

    Fabulous run in 0.000918s, 1089.8446 runs/s, 1089.8446 assertions/s.

    1 runs, 1 assertions, 0 failures, 0 errors, 0 skips

!SLIDE transition=scrollRight

```ruby



class Envelope


  def initialize person: person, address: address

  end




  def formatted
    <<-end.gsub(/^ {6}/, '')
      Frodo Baggins
      Bag End
      Hobbiton, Shire
    end
  end
end
```

!SLIDE

```ruby



class Envelope


  def initialize person: person, address: address

  end




  def formatted
    <<-end.gsub(/^ {6}/, '')
      #{first_name} #{last_name}
      #{street}
      #{city}, #{country}
    end
  end
end
```

!SLIDE

```ruby



class Envelope


  def initialize person: person, address: address
    @person, @address = person, address
  end




  def formatted
    <<-end.gsub(/^ {6}/, '')
      #{first_name} #{last_name}
      #{street}
      #{city}, #{country}
    end
  end
end
```

!SLIDE

```ruby
require 'forwardable'

class Envelope
  extend Forwardable

  def initialize person: person, address: address
    @person, @address = person, address
  end

  def_delegators :@person,  :first_name, :last_name
  def_delegators :@address, :street, :city, :country

  def formatted
    <<-end.gsub(/^ {6}/, '')
      #{first_name} #{last_name}
      #{street}
      #{city}, #{country}
    end
  end
end
```

!SLIDE commandline incremental

    $ ruby integrated.rb
    Run options: --seed 4192

    ​# Running:

    .

    Fabulous run in 0.000882s, 1133.3975 runs/s, 1133.3975 assertions/s.

    1 runs, 1 assertions, 0 failures, 0 errors, 0 skips
