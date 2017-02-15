# implementations

* Ruby the Language<br />has many implementations
<!-- .element: class="fragment" -->

* `RUBY_PLATFORM`<br />`#=> 'x86_64-linux'`
<!-- .element: class="fragment" -->

* `RUBY_ENGINE`<br />`#=> 'ruby'`
<!-- .element: class="fragment" -->

* we’ve already seen `GC.start` examples
<!-- .element: class="fragment" -->

* `GC.stop` + do-some-work + `GC.start` allow<br />out-of-band GC runs (see Unicorn)
<!-- .element: class="fragment" -->


# `ObjectSpace`

* not the same on all Ruby implementations
<!-- .element: class="fragment" -->

* home of `_id2ref` and `WeakMap`
<!-- .element: class="fragment" -->

* `ObjectSpace.count_objects` to get allocation stats
<!-- .element: class="fragment" -->

* `ObjectSpace.count_objects(existing_hash)`<br />to not skew counts
<!-- .element: class="fragment" -->

* `ObjectSpace.each_object`<br />to iterate over all the objects
<!-- .element: class="fragment" -->

* `ObjectSpace.define_finalizer`<br />for per-object destructors
<!-- .element: class="fragment" -->

* watch Aaron Patterson’s talks
<!-- .element: class="fragment" -->


# WeakRef

* ephemeral objects<br />that might not be there later
<!-- .element: class="fragment" -->

* MRI 2.0+:<br />based on `ObjectSpace::WeakMap` in C
<!-- .element: class="fragment" -->

* MRI 1.3-1.9:<br />~pure Ruby (how is it even possible?)
<!-- .element: class="fragment" -->

* [Mustermann!](https://github.com/rkh/mustermann)
<!-- .element: class="fragment" -->
