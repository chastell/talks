!SLIDE bullets incremental transition=scrollLeft
# DCI
* data + context + interaction
* data objects (1:1 persistence?)
* per-role behaviour: mixins extending data

!SLIDE transition=scrollLeft
    @@@ Ruby
    module Data
      class Person
        # …
      end

      class Address
        # …
      end
    end

!SLIDE transition=scrollLeft
    @@@ Ruby
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
    @@@ Ruby
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
    @@@ Ruby
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
![giraffe](giraffe.jpg)
[giraffes of iwo jima](http://www.johnnycheeseburger.com/post/1528439687)
