!SLIDE bullets incremental transition=scrollLeft
# composition over inheritance
* <div class='quote'>Inheritance is a code smell. There, I said it.   — Chris Strom</div>
* compose domain objects from data objects
* Forwardable

!SLIDE transition=scrollLeft
    @@@ Ruby
    class Address
      # extend with your favourite persistence solution or:
      attr_accessor :street, :postcode, :city, :country

      def initialize args = {}
        args.each { |key, value| send "#{key}=", value }
      end
    end








     

 

!SLIDE
    @@@ Ruby
    class Address
      # extend with your favourite persistence solution or:
      attr_accessor :street, :postcode, :city, :country

      def initialize args = {}
        args.each { |key, value| send "#{key}=", value }
      end
    end

    class Person
      # extend with your favourite persistence solution or:
      attr_accessor :given_names, :surname, :title

      def initialize args = {}
        args.each { |key, value| send "#{key}=", value }
      end
    end

 

!SLIDE
    @@@ Ruby
    class Address
      # extend with your favourite persistence solution or:
      attr_accessor :street, :postcode, :city, :country

      def initialize args = {}
        args.each { |key, value| send "#{key}=", value }
      end
    end

    class Person
      # extend with your favourite persistence solution or:
      attr_accessor :given_names, :surname, :title   # *

      def initialize args = {}
        args.each { |key, value| send "#{key}=", value }
      end
    end

\* please read [Personal names around the world](http://www.w3.org/International/questions/qa-personal-names)

!SLIDE transition=scrollLeft
    @@@ Ruby


    class ScottishEnvelopeAddress


      def initialize args
        @person  = args.fetch :person,  Person.new
        @address = args.fetch :address, Address.new
      end




      # Dr P. Rate
      # 9 Queen Street
      # Edinburgh EH2 1JQ
      # Scotland
    end

!SLIDE
    @@@ Ruby


    class ScottishEnvelopeAddress


      def initialize args
        @person  = args.fetch :person,  Person.new
        @address = args.fetch :address, Address.new
      end




      def formatted
        ["#{title} #{given_names} #{surname}",
          street, "#{city} #{postcode}", country].join "\n"
      end
    end

!SLIDE
    @@@ Ruby
    require 'forwardable'

    class ScottishEnvelopeAddress
      extend Forwardable

      def initialize args
        @person  = args.fetch :person,  Person.new
        @address = args.fetch :address, Address.new
      end

      def_delegators :@person,  :given_names, :surname, :title
      def_delegators :@address, :street, :postcode, :city, :country

      def formatted
        ["#{title} #{given_names} #{surname}",
          street, "#{city} #{postcode}", country].join "\n"
      end
    end

!SLIDE transition=scrollLeft
    @@@ Ruby
    person = Person.new given_names: 'P.', surname: 'Rate', title: 'Dr'














     

!SLIDE
    @@@ Ruby
    person = Person.new given_names: 'P.', surname: 'Rate', title: 'Dr'

    address = Address.new street: '9 Queen Street',
        postcode: 'EH2 1JQ', city: 'Edinburgh', country: 'Scotland'











     

!SLIDE
    @@@ Ruby
    person = Person.new given_names: 'P.', surname: 'Rate', title: 'Dr'

    address = Address.new street: '9 Queen Street',
        postcode: 'EH2 1JQ', city: 'Edinburgh', country: 'Scotland'

    sea = ScottishEnvelopeAddress.new person: person, address: address









     

!SLIDE
    @@@ Ruby
    person = Person.new given_names: 'P.', surname: 'Rate', title: 'Dr'

    address = Address.new street: '9 Queen Street',
        postcode: 'EH2 1JQ', city: 'Edinburgh', country: 'Scotland'

    sea = ScottishEnvelopeAddress.new person: person, address: address

    sea.surname   # => 'Rate'
    sea.city      # => 'Edinburgh'






     

!SLIDE
    @@@ Ruby
    person = Person.new given_names: 'P.', surname: 'Rate', title: 'Dr'

    address = Address.new street: '9 Queen Street',
        postcode: 'EH2 1JQ', city: 'Edinburgh', country: 'Scotland'

    sea = ScottishEnvelopeAddress.new person: person, address: address

    sea.surname   # => 'Rate'
    sea.city      # => 'Edinburgh'

    puts sea.formatted

    # Dr P. Rate
    # 9 Queen Street
    # Edinburgh EH2 1JQ
    # Scotland

!SLIDE bullets incremental transition=scrollLeft
# composition over inheritance
* domain models composed from data models
* persistence as a component?
* …so you can dependency-inject it
* [Making Little Classes out of Big Ones](http://devblog.avdi.org/2012/05/25/making-little-classes-out-of-big-ones-video/)
* [Composing Ruby](http://www.rubyflow.com/items/7712-going-to-write-a-book-called-composing-ruby)

!SLIDE center transition=scrollRight
![pandas](pandas.jpg)
[Священные панды](http://aliktron.livejournal.com/756496.html)
