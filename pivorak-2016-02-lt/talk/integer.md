## but how do we query it?

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


## `Integer#[]`

```ruby
29 == 0b11101   #=> true
29[0]           #=> 1
29[1]           #=> 0
29[2]           #=> 1
```
<!-- .element: class="fragment" -->

* return the n-th least significant bit
<!-- .element: class="fragment" -->

```ruby
confs  = %w(eurucamp JRubyConf ROSSConf BaRuCo EuRuKo)
names  = %w(Tate Isom Genevieve Ola Arielle).reverse
matrix = [0b11101, 0b10000, 0b00011, 0b01101, 0b10101]
matrix[confs.index('eurucamp')][names.index('Tate')]        #=> 1
matrix[confs.index('ROSSConf')][names.index('Genevieve')]   #=> 0
```
<!-- .element: class="fragment" -->
