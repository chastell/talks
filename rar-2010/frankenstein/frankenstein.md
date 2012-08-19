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



!SLIDE commandline incremental

    $ time ruby euler.rb 200_000 simple_prime?
    sum(primes < 200000) = 1709600813

    real    0m3.121s
    user    0m3.070s
    sys     0m0.030s

    $ time ruby euler.rb 200_000 inline_simple
    sum(primes < 200000) = 1709600813

    real    0m0.446s
    user    0m0.410s
    sys     0m0.030s

    $ time ruby euler.rb 200_000 inline_clever
    sum(primes < 200000) = 1709600813

    real    0m0.305s
    user    0m0.270s
    sys     0m0.030s



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
            long i = 3;
            while (i <= floor(sqrt(number))) {
              if (number % i == 0) return Qfalse;
              i = i + 2;
            }
            return Qtrue;
          }
        '
      end

    end




!SLIDE commandline incremental

    $ time ruby euler.rb 2_000_000 inline_clever
    sum(primes < 2000000) = 142913828922

    real    0m3.815s
    user    0m3.770s
    sys     0m0.030s

    $ time ruby -r perftools euler.rb 2_000_000 inline_clever
    sum(primes < 2000000) = 142913828922
    PROFILE: interrupts/evictions/bytes = 378/0/792

    real    0m3.843s
    user    0m3.770s
    sys     0m0.060s

    $ pprof.rb --pdf euler > euler.pdf
    Dropping nodes with <= 1 samples; edges with <= 0 abs(samples)



!SLIDE

![perftools inline](perftools-inline.png)



!SLIDE

    @@@ Ruby

    require 'benchmark'
    require 'integer'
    require 'prime'

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
    simple:   1.170000   0.010000   1.180000 (  1.187729)
    clever:   0.700000   0.000000   0.700000 (  0.702421)
    stdlib:   2.560000   0.000000   2.560000 (  2.569368)
    inline:   0.070000   0.000000   0.070000 (  0.075160)
    ---------------------------------- total: 4.510000sec

                  user     system      total        real
    simple:   1.170000   0.000000   1.170000 (  1.184051)
    clever:   0.700000   0.000000   0.700000 (  0.697912)
    stdlib:   2.570000   0.000000   2.570000 (  2.574813)
    inline:   0.070000   0.000000   0.070000 (  0.075140)



!SLIDE bullets incremental

# Frankenstein problems

* from Rob Pike’s _Public Static Void_<br />talk on Go at OSCON 2010
* `foo::Foo *myFoo = new foo::Foo(foo::FOO_INIT)`
* `public static <I, O> ListenableFuture<O> chain (ListenableFuture<I> input, Function<? super I, ? extends ListenableFuture<? extends O>> function)`



!SLIDE

# Frankenstein problems

## from Rob Pike’s _Public Static Void_<br />talk on Go at OSCON 2010

    @@@ Java
    static {
        defaultPorts.put("http",       new Integer(80));
        defaultPorts.put("shttp",      new Integer(80));
        defaultPorts.put("https",      new Integer(443));
        usesGenericSyntax.put("http",  Boolean.TRUE);
        usesGenericSyntax.put("https", Boolean.TRUE);
        usesGenericSyntax.put("shttp", Boolean.TRUE);
    }

    private static final boolean pathsEqual(String p1, String p2)



!SLIDE

# the right solution?



!SLIDE

# the right solution?

    @@@ Ruby

    require 'prime'

    puts Prime.take_while { |p| p < 2_000_000 }.inject :+



!SLIDE commandline incremental

    $ time ruby euler.rb 2_000_000 inline_clever
    sum(primes < 2000000) = 142913828922

    real    0m3.815s
    user    0m3.770s
    sys     0m0.030s

    $ time ruby take_while.rb 
    142913828922

    real    0m3.553s
    user    0m3.530s
    sys     0m0.000s
