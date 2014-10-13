# metaprogramming

# &nbsp;

[![Metaprogramming Ruby 2](img/metaprogramming_ruby_2.jpg)](https://pragprog.com/book/ppmetr2/metaprogramming-ruby-2)


# `BasicObject#method_missing`

# &nbsp;

# (no, I won’t show you<br />an example of `method_missing`)
<!-- .element: class="fragment" -->


# new! new! new!

```cpp
VALUE rb_class_new_instance(int argc, VALUE *argv, VALUE klass) {
    VALUE obj;
    obj = rb_obj_alloc(klass);
    rb_obj_call_init(obj, argc, argv);
    return obj;
}
```
<!-- .element: class="fragment" -->

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

```no-highlight
$ ruby new.rb
:new
[1, 2]
#<Proc:0x007effdf366b50@new.rb:15>
```
<!-- .element: class="fragment" -->


```no-highlight
$ irb -f --prompt simple
>> class Class
>>   def new(*args, &block)
>>     p :new
>>     allocate.tap { |instance| instance.__send__ :initialize, *args, &block }
>>   end
>> end
=> :new
>> 
:new
?> class Foo
:new
:new
:new
:new
>>   def initialize(*args, &block)
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

```no-highlight
>>     p args
:new
:new
:new
:new
:new
>>     p block
:new
:new
:new
:new
:new
>>   end
:new
:new
:new
>> end
:new
:new
=> :initialize
>> 
:new
```

…


…

```no-highlight
?> Foo.new(1, 2) { :block }
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
#<Proc:0x007fac348f3030@(irb):15>
=> #<Foo:0x007fac348f2f90>
```

# never play with<br />object lifecycles in `irb`


# copy constructor

```ruby
class Foo
  def initialize(name)
    p __method__
    p name
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

```no-highlight
:initialize
"a"
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

GC.start

puts "temp alive? → #{!!temp.weakref_alive?}"
puts "#{path} exists? → #{File.exist?(path)}"
```
<!-- .element: class="fragment" -->

```no-highlight
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

```no-highlight
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

```no-highlight
initializing 70060097535620
before GC
after GC
initializing 70060095217580
finalizing 70060095217580
finalizing 70060097535620
```
<!-- .element: class="fragment" -->

## hey, why did the first one<br />live so long?
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

## the truth behind Rails’ `Concern` + `ClassMethods` ಠ_ರೃ
<!-- .element: class="fragment" -->


## there’s a madness<br />in this method

* <span class='fragment'>`Module.method_added(method_symbol)`<br />called when an instance method is added to us</span>

* <span class='fragment'>`Module.singleton_method_added(method_symbol)`<br />called when a singleton (module/class-level) method is added to us</span>

* <span class='fragment'>you won’t believe what `Module.method_removed(method_symbol)`, `Module.singleton_method_removed(method_symbol)`, `Module.method_undefined(method_symbol)` and `Module.singleton_method_undefined(method_symbol)` do</span>


## there’s a madness<br />in this method

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
