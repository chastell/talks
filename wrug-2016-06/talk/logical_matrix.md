## oh of course! (what’s that…?)

* a rectangular table of Boolean values
<!-- .element: class="fragment" -->

*  `true` / `false` relationship representation
<!-- .element: class="fragment" -->

```ruby
confs  = %w(eurucamp JRubyConf ROSSConf BaRuCo EuRuKo)
names  = %w(Tate Isom Genevieve Ola Arielle)
matrix = [
  [true,  true,  true,  false, true],
  [true,  false, false, false, false],
  [false, false, false, true,  true],
  [false, true,  true,  false, true],
  [true,  false, true,  false, true],
]
matrix[confs.index('eurucamp')][names.index('Tate')]        #=> true
matrix[confs.index('ROSSConf')][names.index('Genevieve')]   #=> false
```
<!-- .element: class="fragment" -->


## but that’s not _very_ efficient

* every conference adds a row
<!-- .element: class="fragment" -->

* every participant adds a column
<!-- .element: class="fragment" -->

* `confs.size × (names.size Bools + 1 Array) + 1 Array`
<!-- .element: class="fragment" -->

* how about using zeroes and ones instead?
<!-- .element: class="fragment" -->


## logical matrix

```ruby
matrix = [
  [true,  true,  true,  false, true],
  [true,  false, false, false, false],
  [false, false, false, true,  true],
  [false, true,  true,  false, true],
  [true,  false, true,  false, true],
]
```


## bit matrix

```ruby
matrix = [
  [1, 1, 1, 0, 1],
  [1, 0, 0, 0, 0],
  [0, 0, 0, 1, 1],
  [0, 1, 1, 0, 1],
  [1, 0, 1, 0, 1],
]
```


## bit matrix

```ruby
matrix = [
  0b11101,
  0b10000,
  0b00011,
  0b01101,
  0b10101,
]
```

```ruby
matrix = [29, 16, 3, 13, 21]
```
<!-- .element: class="fragment" -->


## how much better?

* `names.size Fixnums + 1 Array` &nbsp; → &nbsp; `1 Fixnum`
<!-- .element: class="fragment" -->

* `Fixnums` go up to `2E62-1`
<!-- .element: class="fragment" -->

* …that’s `4611686018427387903`
<!-- .element: class="fragment" -->

* …that’s `4_611_686_018_427_387_903`
<!-- .element: class="fragment" -->

* I’m better at estimating things<br />than probably 40 or 50 billion people.<br />— Randy Tayler
<!-- .element: class="fragment quote" -->

* …that’s over _four quintillion_
<!-- .element: class="fragment" -->
