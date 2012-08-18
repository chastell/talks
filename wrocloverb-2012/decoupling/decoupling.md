!SLIDE bullets incremental transition=scrollLeft
# decorators
* e.g., objects for views
* better than per-class helpers
* [Draper](https://github.com/jcasimir/draper)
* SimpleDelegator

!SLIDE transition=scrollLeft
    @@@Ruby


    class Address
      # extend with your favourite persistence solution





    end









     

!SLIDE
    @@@Ruby


    class Address
      # extend with your favourite persistence solution or:
      attr_accessor :street, :postcode, :city, :country

      def initialize args = {}
        args.each { |key, value| send "#{key}=", value }
      end
    end









     

!SLIDE
    @@@Ruby


    class Address
      # extend with your favourite persistence solution or:
      attr_accessor :street, :postcode, :city, :country

      def initialize args = {}
        args.each { |key, value| send "#{key}=", value }
      end
    end






    # Fryderyka Joliot-Curie 15
    # 50-001 Wrocław
    # Poland
     

!SLIDE
    @@@Ruby


    class Address
      # extend with your favourite persistence solution or:
      attr_accessor :street, :postcode, :city, :country

      def initialize args = {}
        args.each { |key, value| send "#{key}=", value }
      end
    end

    class PolishAddress




      def formatted
        [street, "#{postcode} #{city}", country].join "\n"
      end
    end

!SLIDE
    @@@Ruby
    require 'delegate'

    class Address
      # extend with your favourite persistence solution or:
      attr_accessor :street, :postcode, :city, :country

      def initialize args = {}
        args.each { |key, value| send "#{key}=", value }
      end
    end

    class PolishAddress < SimpleDelegator
      def initialize address
        super address
      end

      def formatted
        [street, "#{postcode} #{city}", country].join "\n"
      end
    end

!SLIDE transition=scrollLeft
    @@@Ruby
    address = Address.new street: 'Fryderyka Joliot-Curie 15',
        postcode: '50-001', city: 'Wrocław', country: 'Poland'









     

!SLIDE
    @@@Ruby
    address = Address.new street: 'Fryderyka Joliot-Curie 15',
        postcode: '50-001', city: 'Wrocław', country: 'Poland'

    polish_address = PolishAddress.new address







     

!SLIDE
    @@@Ruby
    address = Address.new street: 'Fryderyka Joliot-Curie 15',
        postcode: '50-001', city: 'Wrocław', country: 'Poland'

    polish_address = PolishAddress.new address

    polish_address.country   # => Poland





     

!SLIDE
    @@@Ruby
    address = Address.new street: 'Fryderyka Joliot-Curie 15',
        postcode: '50-001', city: 'Wrocław', country: 'Poland'

    polish_address = PolishAddress.new address

    polish_address.country   # => Poland

    puts polish_address.formatted

    # Fryderyka Joliot-Curie 15
    # 50-001 Wrocław
    # Poland

!SLIDE bullets incremental transition=scrollLeft

# decorators
* let your data objects be data objects
* logic in bussiness? behaviour? objects
* bonus: ease of testing + reuse

!SLIDE bullets incremental transition=scrollLeft
# composition over inheritance
* <div class='quote'>Inheritance is a code smell. There, I said it.   — Chris Strom</div>
* compose domain objects from data objects
* Forwardable

!SLIDE transition=scrollLeft
    @@@Ruby
    class Address
      # extend with your favourite persistence solution or:
      attr_accessor :street, :postcode, :city, :country

      def initialize args = {}
        args.each { |key, value| send "#{key}=", value }
      end
    end








     

 

!SLIDE
    @@@Ruby
    class Address
      # extend with your favourite persistence solution or:
      attr_accessor :street, :postcode, :city, :country

      def initialize args = {}
        args.each { |key, value| send "#{key}=", value }
      end
    end

    class Person
      # extend with your favourite persistence solution or:
      attr_accessor :given_names, :surname

      def initialize args = {}
        args.each { |key, value| send "#{key}=", value }
      end
    end

 

!SLIDE
    @@@Ruby
    class Address
      # extend with your favourite persistence solution or:
      attr_accessor :street, :postcode, :city, :country

      def initialize args = {}
        args.each { |key, value| send "#{key}=", value }
      end
    end

    class Person
      # extend with your favourite persistence solution or:
      attr_accessor :given_names, :surname   # *

      def initialize args = {}
        args.each { |key, value| send "#{key}=", value }
      end
    end

\* please read [Personal names around the world](http://www.w3.org/International/questions/qa-personal-names)

!SLIDE transition=scrollLeft
    @@@Ruby


    class PolishEnvelopeAddress


      def initialize args
        @person  = args.fetch :person,  Person.new
        @address = args.fetch :address, Address.new
      end




      # Sz.P. A. None Mouse
      # Fryderyka Joliot-Curie 15
      # 50-001 Wrocław
      # Poland
    end

!SLIDE
    @@@Ruby


    class PolishEnvelopeAddress


      def initialize args
        @person  = args.fetch :person,  Person.new
        @address = args.fetch :address, Address.new
      end




      def formatted
        ["Sz.P. #{given_names} #{surname}",
          street, "#{postcode} #{city}", country].join "\n"
      end
    end

!SLIDE
    @@@Ruby
    require 'forwardable'

    class PolishEnvelopeAddress
      extend Forwardable

      def initialize args
        @person  = args.fetch :person,  Person.new
        @address = args.fetch :address, Address.new
      end

      def_delegators :@person,  :given_names, :surname
      def_delegators :@address, :street, :postcode, :city, :country

      def formatted
        ["Sz.P. #{given_names} #{surname}",
          street, "#{postcode} #{city}", country].join "\n"
      end
    end

!SLIDE transition=scrollLeft
    @@@Ruby
    person = Person.new given_names: 'A. None', surname: 'Mouse'














     

!SLIDE
    @@@Ruby
    person = Person.new given_names: 'A. None', surname: 'Mouse'

    address = Address.new street: 'Fryderyka Joliot-Curie 15',
        postcode: '50-001', city: 'Wrocław', country: 'Poland'











     

!SLIDE
    @@@Ruby
    person = Person.new given_names: 'A. None', surname: 'Mouse'

    address = Address.new street: 'Fryderyka Joliot-Curie 15',
        postcode: '50-001', city: 'Wrocław', country: 'Poland'

    pea = PolishEnvelopeAddress.new person: person, address: address









     

!SLIDE
    @@@Ruby
    person = Person.new given_names: 'A. None', surname: 'Mouse'

    address = Address.new street: 'Fryderyka Joliot-Curie 15',
        postcode: '50-001', city: 'Wrocław', country: 'Poland'

    pea = PolishEnvelopeAddress.new person: person, address: address

    pea.surname   # => 'Mouse'
    pea.city      # => 'Wrocław'






     

!SLIDE
    @@@Ruby
    person = Person.new given_names: 'A. None', surname: 'Mouse'

    address = Address.new street: 'Fryderyka Joliot-Curie 15',
        postcode: '50-001', city: 'Wrocław', country: 'Poland'

    pea = PolishEnvelopeAddress.new person: person, address: address

    pea.surname   # => 'Mouse'
    pea.city      # => 'Wrocław'

    puts pea.formatted

    # Sz.P. A. None Mouse
    # Fryderyka Joliot-Curie 15
    # 50-001 Wrocław
    # Poland

!SLIDE bullets incremental transition=scrollLeft
# composition over inheritance
* domain models composed from data models
* persistence as a component?
* …so you can dependency-inject it

!SLIDE bullets incremental transition=scrollLeft
# DCI
* Data + Context + Interaction
* data objects (1:1 persistence?)
* per-role behaviour: mixins extending data

!SLIDE transition=scrollLeft
    @@@Ruby
    module Data
      class Person
        # …
      end

      class Address
        # …
      end
    end

!SLIDE transition=scrollLeft
    @@@Ruby
    module Roles
      module Landlord
        def rent_a_place address, person
          # rent only if the person is credible (as a tenant)
        end
      end

      module Tenant
        def credible?
          # …
        end
      end
    end

!SLIDE transition=scrollLeft
    @@@Ruby
    module Contexts
      class RentingAPlace
        def initialize address, person_a, person_b
          @address  = address
          @landlord = person_a.extend Roles::Landlord
          @tenant   = person_b.extend Roles::Tenant
        end
      end

      def call
        # …
        @landlord.rent_a_place @address, @tenant
        # …
      end
    end

!SLIDE transition=scrollLeft
    @@@Ruby
    address  = …   # probably fetch from persistence store
    person_a = …   # probably fetch from persistence store
    person_b = …   # probably fetch from persistence store

    renting = Contexts::RentingAPlace.new address, person_a, person_b

    renting.call

!SLIDE bullets incremental transition=scrollLeft
# DCI
* it’s not about persistence
* it’s a fundamental architectural change
* data | behaviour separation
* read _[The Right Way to Code DCI in Ruby](http://mikepackdev.com/blog_posts/24-the-right-way-to-code-dci-in-ruby)_

!SLIDE center transition=scrollRight
![cops](cops.jpg)
[*THE* Random Picture Thread](http://tdpri.com/forum/2602851-post1573.html)

!SLIDE bullets incremental transition=scrollLeft
# going way overboard (?)
* it’s all about objects
* why not hide persistance altogether?
* [Candy](https://github.com/SFEley/candy)
* [Ambition](http://defunkt.io/ambition)

!SLIDE transition=scrollLeft
## Candy: transparent persistence in MongoDB
    @@@Ruby
    require 'candy'













     

!SLIDE
## Candy: transparent persistence in MongoDB
    @@@Ruby
    require 'candy'

    class Conference
      include Candy::Piece
    end









     

!SLIDE
## Candy: transparent persistence in MongoDB
    @@@Ruby
    require 'candy'

    class Conference
      include Candy::Piece
    end

    wrocloverb = Conference.new
    # connects to localhost:27017 and ‘chastell’ db if needed
    # and saves a new document to the ‘Conference’ collection





     

!SLIDE
## Candy: transparent persistence in MongoDB
    @@@Ruby
    require 'candy'

    class Conference
      include Candy::Piece
    end

    wrocloverb = Conference.new
    # connects to localhost:27017 and ‘chastell’ db if needed
    # and saves a new document to the ‘Conference’ collection

    wrocloverb.location = 'Wrocław'   # method_missing resaves



     

!SLIDE
## Candy: transparent persistence in MongoDB
    @@@Ruby
    require 'candy'

    class Conference
      include Candy::Piece
    end

    wrocloverb = Conference.new
    # connects to localhost:27017 and ‘chastell’ db if needed
    # and saves a new document to the ‘Conference’ collection

    wrocloverb.location = 'Wrocław'   # method_missing resaves

    wrocloverb.events = { parties: { saturday: 'Cynamon Bar' } }
    wrocloverb.events.parties.saturday    #=> 'Cynamon Bar'
     

!SLIDE transition=scrollLeft
## Ambition: persistence queries in Ruby
    @@@Ruby
    require 'ambition/adapters/active_record'













     

!SLIDE
## Ambition: persistence queries in Ruby
    @@@Ruby
    require 'ambition/adapters/active_record'

    class Person < ActiveRecord::Base
    end










     

!SLIDE
## Ambition: persistence queries in Ruby
    @@@Ruby
    require 'ambition/adapters/active_record'

    class Person < ActiveRecord::Base
    end

    Person.select do |p|
      (p.country == 'USA' && p.age >= 21) ||
      (p.country != 'USA' && p.age >= 18)
    end





     

!SLIDE
## Ambition: persistence queries in Ruby
    @@@Ruby
    require 'ambition/adapters/active_record'

    class Person < ActiveRecord::Base
    end

    Person.select do |p|
      (p.country == 'USA' && p.age >= 21) ||
      (p.country != 'USA' && p.age >= 18)
    end

    # SELECT * FROM people
    # WHERE (
    #   (people.country =  'USA' AND people.age >= 21) OR
    #   (people.country <> 'USA' AND people.age >= 18)
    # )

!SLIDE
## Ambition: persistence queries in Ruby
    @@@Ruby
    require 'ambition/adapters/active_ldap'

    class Person < ActiveLdap::Base
    end

    Person.select do |p|
      (p.country == 'USA' && p.age >= 21) ||
      (p.country != 'USA' && p.age >= 18)
    end

    # (|
    #   (& (country=USA)    (age>=21) )
    #   (& (!(country=USA)) (age>=18) )
    # )
     

!SLIDE center transition=scrollRight
![giraffe](giraffe.jpg)
[giraffes of iwo jima](http://www.johnnycheeseburger.com/post/1528439687)
