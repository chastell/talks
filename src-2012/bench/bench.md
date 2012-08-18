!SLIDE transition=scrollLeft
    @@@ Ruby



    class Integer
      def simple_prime?
        (2..Math.sqrt(self).floor).all? { |i| (self % i).nonzero? }
      end






    end







     

!SLIDE
    @@@ Ruby



    class Integer
      def simple_prime?
        (2..Math.sqrt(self).floor).all? { |i| (self % i).nonzero? }
      end

      def clever_prime?
        return true  if self == 2
        return false if self.even?
        3.step(Math.sqrt(self).floor, 2).all? { |i| (self % i).nonzero? }
      end
    end







     

!SLIDE
    @@@ Ruby

    require 'prime'

    class Integer
      def simple_prime?
        (2..Math.sqrt(self).floor).all? { |i| (self % i).nonzero? }
      end

      def clever_prime?
        return true  if self == 2
        return false if self.even?
        3.step(Math.sqrt(self).floor, 2).all? { |i| (self % i).nonzero? }
      end
    end







     

!SLIDE
    @@@ Ruby
    require 'benchmark'
    require 'prime'

    class Integer
      def simple_prime?
        (2..Math.sqrt(self).floor).all? { |i| (self % i).nonzero? }
      end

      def clever_prime?
        return true  if self == 2
        return false if self.even?
        3.step(Math.sqrt(self).floor, 2).all? { |i| (self % i).nonzero? }
      end
    end

    range = 2..1_000_000

    Benchmark.bmbm do |bench|
      bench.report('simple:') { range.each &:simple_prime? }
      bench.report('clever:') { range.each &:clever_prime? }
      bench.report('stdlib:') { range.each &:prime?        }
    end

!SLIDE commandline incremental transition=scrollLeft
    $ ruby prime_bench.rb
    Rehearsal -------------------------------------------
    simple:  24.690000   0.000000  24.690000 ( 24.709989)
    clever:  13.120000   0.000000  13.120000 ( 13.130319)
    stdlib:  33.480000   0.000000  33.480000 ( 33.500611)
    --------------------------------- total: 71.290000sec

                  user     system      total        real
    simple:  24.780000   0.000000  24.780000 ( 24.804631)
    clever:  13.180000   0.000000  13.180000 ( 13.194177)
    stdlib:  33.120000   0.000000  33.120000 ( 33.158172)

!SLIDE center transition=scrollRight
![measuring](measuring.png)
[Ballard Street](http://www.gocomics.com/ballardstreet/2011/11/23)
