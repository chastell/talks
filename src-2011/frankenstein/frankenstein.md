!SLIDE

# Frankenstein<br />programming



!SLIDE bullets incremental

# what about *embedding*<br />foreign language?

* (after all, you can do Assembler in C…)

* Yes We Can:

* RubyInline
* JavaInline
* Hubris



!SLIDE

    @@@ Ruby
    require 'inline'

    class Integer

      def simple_prime?
        (2..Math.sqrt(self).floor).all? { |i| (self % i).nonzero? }
      end














    end



!SLIDE

    @@@ Ruby
    require 'inline'

    class Integer

      def simple_prime?
        (2..Math.sqrt(self).floor).all? { |i| (self % i).nonzero? }
      end

      inline do |builder|
        builder.c '
          VALUE inline_simple() {
            long number = NUM2LONG(self);
            long i;
            for (i = 2; i <= floor(sqrt(number)); i++) {
              if (number % i == 0) return Qfalse;
            }
            return Qtrue;
          }
        '
      end

    end



!SLIDE

    @@@ Ruby
    require 'inline'

    class Integer

      inline do |builder|
        builder.c '
          VALUE inline_clever() {
            long number = NUM2LONG(self);
            if (number == 2)     return Qtrue;
            if (number % 2 == 0) return Qfalse;
            long i;
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
    require 'benchmark'
    require 'prime'
    require './euler-primes'

    Benchmark.bmbm do |bench|
      bench.report 'simple:' do
        (2..100_000).each { |i| i.simple_prime? }
      end
      bench.report 'clever:' do
        (2..100_000).each { |i| i.clever_prime? }
      end
      bench.report 'stdlib:' do
        (2..100_000).each { |i| i.prime? }
      end
      bench.report 'inline:' do
        (2..100_000).each { |i| i.inline_clever }
      end
    end



!SLIDE commandline incremental

    $ ruby benchmark-inline.rb
    Rehearsal -------------------------------------------
    simple:   1.180000   0.000000   1.180000 (  1.187370)
    clever:   0.670000   0.000000   0.670000 (  0.668914)
    stdlib:   2.300000   0.000000   2.300000 (  2.306439)
    inline:   0.070000   0.000000   0.070000 (  0.075871)
    ---------------------------------- total: 4.220000sec

                  user     system      total        real
    simple:   1.170000   0.000000   1.170000 (  1.177349)
    clever:   0.680000   0.000000   0.680000 (  0.673092)
    stdlib:   2.290000   0.010000   2.300000 (  2.303018)
    inline:   0.070000   0.000000   0.070000 (  0.077858)



!SLIDE

# the right solution?



!SLIDE

# the right solution?

    @@@ Ruby
    require 'prime'

    puts Prime.take_while { |p| p < 2_000_000 }.inject :+
