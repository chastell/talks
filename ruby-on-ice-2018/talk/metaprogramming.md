[![Metaprogramming Ruby 2](img/metaprogramming_ruby_2.jpg)](https://pragprog.com/book/ppmetr2/metaprogramming-ruby-2)


# `BasicObject#method_missing`

# &nbsp;

# (no, I won’t show you<br />an example of `method_missing`)
<!-- .element: class="fragment" -->


# new! new! new!

* how does object initialisation work?
<!-- .element: class="fragment" -->

```ruby
class Foo
  def initialize(*args, &block)
    p args
    p block
  end
end

Foo.new(1, 2) { :block }
```
<!-- .element: class="fragment" -->

```shell
[1, 2]
#<Proc:0x00005602cf0d2118@new.rb:8>
```
<!-- .element: class="fragment" -->

* <span class="fragment">we call `Foo.new` but `Foo#initialize` gets called…</span>
* <span class="fragment">`Foo` is an instance of `Class`, so `Foo.new` calls `Class#new`…</span>


# Ruby 2.5

```c
/**
 * Allocates and initializes an instance of \a klass.
 *
 * Equivalent to \c Class\#new in Ruby
 *
 * \param[in] argc  the number of arguments to \c #initialize
 * \param[in] argv  a pointer to an array of arguments to \c #initialize
 * \param[in] klass a Class object
 * \return the new instance of \a klass
 * \sa rb_obj_call_init
 * \sa rb_obj_alloc
 */
VALUE
rb_class_new_instance(int argc, const VALUE *argv, VALUE klass)
{
    Check_Type(klass, T_CLASS);
    return rb_class_s_new(argc, argv, klass);
}
```


# Ruby 2.5

```c
/*
 *  call-seq:
 *     class.new(args, ...)    ->  obj
 *
 *  Calls <code>allocate</code> to create a new object of
 *  <i>class</i>'s class, then invokes that object's
 *  <code>initialize</code> method, passing it <i>args</i>.
 *  This is the method that ends up getting called whenever
 *  an object is constructed using .new.
 *
 */

static VALUE
rb_class_s_new(int argc, const VALUE *argv, VALUE klass)
{
    VALUE obj;

    obj = rb_class_alloc(klass);
    rb_obj_call_init(obj, argc, argv);

    return obj;
}
```


# Ruby 1.7-2.4 (same, just simpler)

```c
VALUE rb_class_new_instance(int argc, VALUE *argv, VALUE klass) {
    VALUE obj;
    obj = rb_obj_alloc(klass);
    rb_obj_call_init(obj, argc, argv);
    return obj;
}
```

```ruby
class Class
  def new(*args, &block)
    instance = allocate
    instance.__send__ :initialize, *args, &block
    instance
  end
end
```
<!-- .element: class="fragment" -->

```ruby
class Class
  def new(*args, &block)
    allocate.tap { |instance| instance.__send__ :initialize, *args, &block }
  end
end
```
<!-- .element: class="fragment" -->


# that’s not really true:<br />`rb_obj_alloc` ≠ `allocate`

```ruby
class Foo
  def self.allocate
    p :allocate
    super
  end

  def initialize
    p :initialize
  end
end

Foo.allocate   #=> prints ‘:allocate’, returns a Foo instance
Foo.new        #=> prints ‘:initialize’, returns a Foo instance
               #   *doesn’t* print ‘:allocate’
```
<!-- .element: class="fragment" -->


# let’s have some new fun
# (or how `irb` ≠ `ruby`)

```ruby
class Class
  def new(*args, &block)
    p :new
    allocate.tap { |instance| instance.__send__ :initialize, *args, &block }
  end
end

class Foo
  def initialize(*args, &block)
    p args
    p block
  end
end

Foo.new(1, 2) { :block }
```
<!-- .element: class="fragment" -->

```shell
$ ruby new.rb
:new
[1, 2]
#<Proc:0x00000001ec0288@new.rb:15>
```
<!-- .element: class="fragment" -->


```shell
$ irb -f
irb(main):001:0> class Class
irb(main):002:1>   def new(*args, &block)
irb(main):003:2>     p :new
irb(main):004:2>     allocate.tap { |instance| instance.__send__ :initialize, *args, &block }
irb(main):005:2>   end
irb(main):006:1> end
=> :new
irb(main):007:0> 
:new
irb(main):008:0> class Foo
:new
:new
:new
:new
irb(main):009:1>   def initialize(*args, &block)
:new
:new
:new
:new
:new
:new
:new
:new
:new
:new
:new
:new
:new
```

…


…

```shell
irb(main):010:2>     p args
:new
:new
:new
:new
:new
irb(main):011:2>     p block
:new
:new
:new
:new
:new
irb(main):012:2>   end
:new
:new
:new
irb(main):013:1> end
:new
:new
=> :initialize
irb(main):014:0> 
:new
```

…


…

```shell
irb(main):015:0> Foo.new(1, 2) { :block }
:new
:new
:new
:new
:new
:new
:new
:new
:new
:new
:new
:new
:new
:new
:new
:new
:new
:new
[1, 2]
#<Proc:0x000055592c146ec0@(irb):15>
=> #<Foo:0x000055592c1471e0>
irb(main):016:0> █
```

## never play with object lifecycles in `irb`
<!-- .element: class="fragment" -->


# copy constructor

```ruby
class Foo
  def initialize(name)
    p __method__
    @name = name
  end

  def initialize_copy(other)
    p __method__
    p other
    super
  end
end

a = Foo.new('a')
b = a
c = a.dup
```
<!-- .element: class="fragment" -->

```shell
:initialize
:initialize_copy
#<Foo:0x007f2f3673efd0 @name="a">
```
<!-- .element: class="fragment" -->

## and here I was implementing `Foo#dup`<br />as `Marshal.load(Marshal.dump(self))`
<!-- .element: class="fragment" -->

## #TEAMNOIDEA
<!-- .element: class="fragment" -->


# so very `Tempfile`

```ruby
require 'tempfile'
require 'weakref'

temp = WeakRef.new(Tempfile.new(''))
path = temp.path

puts "temp alive? → #{!!temp.weakref_alive?}"
puts "#{path} exists? → #{File.exist?(path)}"

2.times { GC.start }

puts "temp alive? → #{!!temp.weakref_alive?}"
puts "#{path} exists? → #{File.exist?(path)}"
```
<!-- .element: class="fragment" -->

```shell
temp alive? → true
/tmp/20141012-11183-etjwza exists? → true
temp alive? → false
/tmp/20141012-11183-etjwza exists? → false
```
<!-- .element: class="fragment" -->

# how does `Tempfile`<br />show itself out?
<!-- .element: class="fragment" -->


# now I am become `def`<br />the destroyer of codes

```ruby
class Foo
  def self.finalize(object_id)
    puts "finalizing #{object_id}"
  end

  def initialize
    puts "initializing #{object_id}"
    ObjectSpace.define_finalizer self, self.class.method(:finalize)
  end
end

require 'weakref'
WeakRef.new(Foo.new)
puts 'before GC'
GC.start
puts 'after GC'
Foo.new
```
<!-- .element: class="fragment" -->

```shell
initializing 70216017649280
before GC
finalizing 70216017649280
after GC
initializing 70216015331020
finalizing 70216015331020
```
<!-- .element: class="fragment" -->


# now I am become `def`<br />the destroyer of codes

```ruby
class Foo
  def initialize
    puts "initializing #{object_id}"
    ObjectSpace.define_finalizer self, -> (id) { puts "finalizing #{id}" }
  end
end

require 'weakref'

WeakRef.new(Foo.new)
puts 'before GC'
GC.start
puts 'after GC'
Foo.new
```
<!-- .element: class="fragment" -->

```shell
initializing 70060097535620
before GC
after GC
initializing 70060095217580
finalizing 70060095217580
finalizing 70060097535620
```
<!-- .element: class="fragment" -->

## hey, why did the first one live so long?
<!-- .element: class="fragment" -->


# classy hooks

* <span class='fragment'>`Module.const_missing(const_symbol)`<br />`BasicObject#method_missing` for constants</span>

* <span class='fragment'>`Module.autoload(const_symbol, file_path)`<br />autoloads the file on first const access<br />(please could you not; hopefully gone soon)</span>

* <span class='fragment'>`Class.inherited(child_class)`<br />called when a subclass inherits us<br />(`child_class` can be anonymous!)</span>


# classy hooks

* <span class='fragment'>`Module.included(including_module)`<br />called when another module includes us</span>

* <span class='fragment'>`Module.append_features(including_module)`<br />called when another module includes us<br />(before `included`, to append our features)</span>

* <span class='fragment'>`Module.extended(object)`<br />called when another object is extended with us</span>

* <span class='fragment'>`Module.extend_object(object)`<br />called when another object is extended with us<br />(before `extended`, to extend with our features)</span>

## the truth behind Rails’ `Concern` + `ClassMethods`<br />🔥🔥🔥
<!-- .element: class="fragment" -->


# me•thod•i•cal

* <span class='fragment'>`Module.method_added(method_symbol)`<br />called when an instance method is added</span>

* <span class='fragment'>`Module.singleton_method_added(method_symbol)`<br />called when a singleton (module/class-level) method is added</span>

* <span class='fragment'>you won’t believe what `Module.method_removed(method_symbol)`, `Module.singleton_method_removed(method_symbol)`, `Module.method_undefined(method_symbol)` and `Module.singleton_method_undefined(method_symbol)` do</span>


# me•thod•i•cal

```ruby
module Foo
  def self.method_added(name)
    p __method__
    p name
  end

  def bar
  end
end
```
<!-- .element: class="fragment" -->

```
:method_added
:bar
```
<!-- .element: class="fragment" -->

```ruby
module Foo
  def self.singleton_method_added(name)
    p __method__
    p name
  end

  def self.bar
  end
end
```
<!-- .element: class="fragment" -->

```
:singleton_method_added
:singleton_method_added
:singleton_method_added
:bar
```
<!-- .element: class="fragment" -->


# please don’t use<br />metaprogramming in anger

## <span class='fragment'>`ActiveSupport::Rescuable`<br />`::ClassMethods#rescue_from`</span>

## class-level handling of the given exception,<br />regardless of which method raised it
<!-- .element: class="fragment" -->

* it’s like INTERCAL’s `COMEFROM`<br />— but for real
<!-- .element: class="fragment" -->

* the exceptions are coming<br />FROM OUTSIDE THE CALL STACK
<!-- .element: class="fragment" -->
