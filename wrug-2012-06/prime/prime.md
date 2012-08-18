!SLIDE transition=scrollLeft
    @@@ Ruby
    class Integer
      def sqrt_prime?
        (2..Math.sqrt(self).floor).all? { |i| (self % i).nonzero? }
      end
    end

    (2..100_000).each &:sqrt_prime?   #=> 1.1 s

!SLIDE
    @@@ Ruby
    class Integer
      def skipping_prime?
        return true  if self == 2
        return false if self.even?
        3.step(Math.sqrt(self).floor, 2).all? { |i| (self % i).nonzero? }
      end
    end

    (2..100_000).each &:skipping_prime?   #=> 0.6 s

!SLIDE transition=scrollLeft
    @@@ Ruby
    require 'inline'

    class Integer
      inline do |builder|
        builder.include '<math.h>'
        builder.c '
          VALUE inline_prime() {
            long i, number = NUM2LONG(self);
            if (number == 2)     return Qtrue;
            if (number % 2 == 0) return Qfalse;
            for (i = 3; i <= floor(sqrt(number)); i = i + 2) {
              if (number % i == 0) return Qfalse;
            }
            return Qtrue;
          }
        '
      end
    end

!SLIDE
    @@@ Ruby
    require 'prime'

    (2..100_000).each &:prime?

!SLIDE transition=scrollLeft
    @@@ Ruby
    require 'benchmark'
    require 'inline'
    require 'prime'

    class Integer
      # …
    end

    range = 2..100_000

    Benchmark.bmbm do |bench|
      bench.report('sqrt:')     { range.each &:sqrt_prime?     }
      bench.report('skipping:') { range.each &:skipping_prime? }
      bench.report('inline:')   { range.each &:inline_prime    }
      bench.report('stdlib:')   { range.each &:prime?          }
    end

!SLIDE commandline incremental
    $ ruby bench-prime.rb
    Rehearsal ---------------------------------------------
    sqrt:       1.150000   0.000000   1.150000 (  1.149098)
    skipping:   0.640000   0.000000   0.640000 (  0.645695)
    inline:     0.050000   0.000000   0.050000 (  0.048040)
    stdlib:     1.850000   0.000000   1.850000 (  1.854002)
    ------------------------------------ total: 3.690000sec

                    user     system      total        real
    sqrt:       1.140000   0.000000   1.140000 (  1.135499)
    skipping:   0.640000   0.000000   0.640000 (  0.642145)
    inline:     0.050000   0.000000   0.050000 (  0.047625)
    stdlib:     1.890000   0.000000   1.890000 (  1.885808)
