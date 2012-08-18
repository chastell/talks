!SLIDE transition=scrollLeft
# popcount
## ile dana liczba ma jedynek
## w reprezentacji binarnej

!SLIDE transition=scrollLeft
    @@@ Ruby
    class Integer
      def popcount_to_s
        to_s(2).count '1'
      end
    end

!SLIDE
    @@@ Ruby
    require 'inline'

    class Integer
      inline do |builder|
        builder.c '
          int popcount_builtin() {
            return __builtin_popcountl(NUM2LONG(self));
          }
        '
      end
    end

!SLIDE transition=scrollLeft
    @@@ Ruby
    require 'benchmark'
    require 'inline'

    class Integer
      # …
    end

    range = 0...2**22

    Benchmark.bmbm do |bench|
      bench.report('to_s:')    { range.each &:popcount_to_s    }
      bench.report('builtin:') { range.each &:popcount_builtin }
    end

!SLIDE commandline incremental
    $ ruby bench-popcount.rb
    Rehearsal --------------------------------------------
    to_s:      5.870000   0.000000   5.870000 (  5.886263)
    builtin:   0.520000   0.000000   0.520000 (  0.515771)
    ----------------------------------- total: 6.390000sec

                  user     system      total        real
    to_s:      5.860000   0.010000   5.870000 (  5.883422)
    builtin:   0.510000   0.010000   0.520000 (  0.520176)
