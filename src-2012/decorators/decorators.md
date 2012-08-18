!SLIDE bullets incremental transition=scrollLeft
# decorators
* e.g., objects for views
* better than per-class helpers
* [Draper](https://github.com/jcasimir/draper)
* SimpleDelegator

!SLIDE transition=scrollLeft
    @@@ Ruby


    class Address
      # extend with your favourite persistence solution





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





     

!SLIDE
    @@@ Ruby


    class Address
      # extend with your favourite persistence solution or:
      attr_accessor :street, :postcode, :city, :country

      def initialize args = {}
        args.each { |key, value| send "#{key}=", value }
      end
    end



    # 9 Queen Street
    # Edinburgh EH2 1JQ
    # Scotland

!SLIDE
    @@@ Ruby


    class Address
      # extend with your favourite persistence solution or:
      attr_accessor :street, :postcode, :city, :country

      def initialize args = {}
        args.each { |key, value| send "#{key}=", value }
      end
    end

    class ScottishAddress
      def formatted
        [street, "#{city} #{postcode}", country].join "\n"
      end
    end

!SLIDE
    @@@ Ruby
    require 'delegate'

    class Address
      # extend with your favourite persistence solution or:
      attr_accessor :street, :postcode, :city, :country

      def initialize args = {}
        args.each { |key, value| send "#{key}=", value }
      end
    end

    class ScottishAddress < SimpleDelegator
      def formatted
        [street, "#{city} #{postcode}", country].join "\n"
      end
    end

!SLIDE transition=scrollLeft
    @@@ Ruby
    address = Address.new street: '9 Queen Street',
        postcode: 'EH2 1JQ', city: 'Edinburgh', country: 'Scotland'









     

!SLIDE
    @@@ Ruby
    address = Address.new street: '9 Queen Street',
        postcode: 'EH2 1JQ', city: 'Edinburgh', country: 'Scotland'

    scottish_address = ScottishAddress.new address







     

!SLIDE
    @@@ Ruby
    address = Address.new street: '9 Queen Street',
        postcode: 'EH2 1JQ', city: 'Edinburgh', country: 'Scotland'

    scottish_address = ScottishAddress.new address

    scottish_address.country   # => Scotland





     

!SLIDE
    @@@ Ruby
    address = Address.new street: '9 Queen Street',
        postcode: 'EH2 1JQ', city: 'Edinburgh', country: 'Scotland'

    scottish_address = ScottishAddress.new address

    scottish_address.country   # => Scotland

    puts scottish_address.formatted

    # 9 Queen Street
    # Edinburgh EH2 1JQ
    # Scotland

!SLIDE bullets incremental transition=scrollLeft
# decorators
* let your data objects be data objects
* logic in bussiness? behaviour? objects
* bonus: ease of testing + reuse

!SLIDE center transition=scrollRight
![swan](swan.jpg)
[Funny: Best photos of the week 17, 2012](http://www.aaanything.net/41048/pictorial/funny/best-photos-of-the-week-17-2012/)
