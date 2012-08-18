!SLIDE bullets incremental transition=scrollLeft
# AOP
* <div class='quote'>In Smalltalk, everything happens somewhere else.<br />— Adele Goldberg</div>
* making things happen elsewhere
* persisting objects<br />when things happen to them
* logging with [RCapture](https://code.google.com/p/rcapture/)

!SLIDE transition=scrollLeft
    @@@ Ruby
    class PrimeSelector













    end

!SLIDE
    @@@ Ruby
    class PrimeSelector
      def initialize numbers
        @numbers = numbers
      end










    end

!SLIDE
    @@@ Ruby
    class PrimeSelector
      def initialize numbers
        @numbers = numbers
      end

      def primes
        @numbers.select { |number| prime? number }
      end






    end

!SLIDE
    @@@ Ruby
    class PrimeSelector
      def initialize numbers
        @numbers = numbers
      end

      def primes
        @numbers.select { |number| prime? number }
      end

      private

      def prime? number
        (2..Math.sqrt(number).floor).all? { |i| (number % i).nonzero? }
      end
    end

!SLIDE transition=scrollLeft
    @@@ Ruby
    require 'logger'
    require 'rcapture'

    class Logging
















    end

!SLIDE
    @@@ Ruby
    require 'logger'
    require 'rcapture'

    class Logging
      def initialize log
        @log = Logger.new log
        add_logging
      end












    end

!SLIDE
    @@@ Ruby
    require 'logger'
    require 'rcapture'

    class Logging
      def initialize log
        @log = Logger.new log
        add_logging
      end

      private

      def add_logging
        PrimeSelector.class_eval { include RCapture::Interceptable }






      end
    end

!SLIDE
    @@@ Ruby
    require 'logger'
    require 'rcapture'

    class Logging
      def initialize log
        @log = Logger.new log
        add_logging
      end

      private

      def add_logging
        PrimeSelector.class_eval { include RCapture::Interceptable }
        PrimeSelector.capture_pre methods: :prime? do |point|
          @log.debug "prime? #{point.args.first}"
        end



      end
    end

!SLIDE
    @@@ Ruby
    require 'logger'
    require 'rcapture'

    class Logging
      def initialize log
        @log = Logger.new log
        add_logging
      end

      private

      def add_logging
        PrimeSelector.class_eval { include RCapture::Interceptable }
        PrimeSelector.capture_pre methods: :prime? do |point|
          @log.debug "prime? #{point.args.first}"
        end
        PrimeSelector.capture_post methods: :prime? do |point|
          @log.debug "prime? → #{point.return}"
        end
      end
    end

!SLIDE transition=scrollLeft
    @@@ Ruby
    Logging.new $stdout
    PrimeSelector.new(2..10).primes


















     

!SLIDE
    @@@ Ruby
    Logging.new $stdout
    PrimeSelector.new(2..10).primes

    # D, [2012-06-29T00:25:21.746960 #31892] DEBUG -- : prime? 2
    # D, [2012-06-29T00:25:21.747180 #31892] DEBUG -- : prime? → true
    # D, [2012-06-29T00:25:21.747265 #31892] DEBUG -- : prime? 3
    # D, [2012-06-29T00:25:21.747347 #31892] DEBUG -- : prime? → true
    # D, [2012-06-29T00:25:21.747460 #31892] DEBUG -- : prime? 4
    # D, [2012-06-29T00:25:21.747550 #31892] DEBUG -- : prime? → false
    # D, [2012-06-29T00:25:21.747629 #31892] DEBUG -- : prime? 5
    # D, [2012-06-29T00:25:21.747740 #31892] DEBUG -- : prime? → true
    # D, [2012-06-29T00:25:21.747818 #31892] DEBUG -- : prime? 6
    # D, [2012-06-29T00:25:21.747900 #31892] DEBUG -- : prime? → false
    # D, [2012-06-29T00:25:21.747977 #31892] DEBUG -- : prime? 7
    # D, [2012-06-29T00:25:21.748072 #31892] DEBUG -- : prime? → true
    # D, [2012-06-29T00:25:21.748149 #31892] DEBUG -- : prime? 8
    # D, [2012-06-29T00:25:21.748232 #31892] DEBUG -- : prime? → false
    # D, [2012-06-29T00:25:21.748309 #31892] DEBUG -- : prime? 9
    # D, [2012-06-29T00:25:21.748406 #31892] DEBUG -- : prime? → false
    # D, [2012-06-29T00:25:21.748482 #31892] DEBUG -- : prime? 10
    # D, [2012-06-29T00:25:21.748563 #31892] DEBUG -- : prime? → false

!SLIDE bullets incremental transition=scrollLeft
# AOP
* work with you objects<br />as if the memory was forever
* make a separate presistence layer<br />that hooks into state-changing methods
* …or explicitly route through that layer<br />and make it persist the changes afterwards

!SLIDE center transition=scrollRight
![snake](snake.jpg)
[AMAZING NATURE PHOTOS!](http://sassystreak.com/2011/09/28/amazing-nature-photos/)
