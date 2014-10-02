## can we call cowsay from Ruby?

```ruby
system 'cowsay -f duck [attack surface intensifies]'   # @sorenmacbeth
```
<!-- .element: class="fragment" -->

```no-highlight
 ______________________________
< [attack surface intensifies] >
 ------------------------------
 \
  \
   \ >()_
      (__)__ _
```
<!-- .element: class="fragment" -->

```ruby
text = '[attack surface intensifies]'
system "cowsay -f duck #{text}"
```
<!-- .element: class="fragment" -->

```no-highlight
 ______________________________
< [attack surface intensifies] >
 ------------------------------
 \
  \
   \ >()_
      (__)__ _
```
<!-- .element: class="fragment" -->


## let’s make the text even funnier

```ruby
text = '[attack surface intensifies]; rm -rf /'
system "cowsay -f duck #{text}"
```
<!-- .element: class="fragment" -->

```no-highlight
…
```
<!-- .element: class="fragment" -->

```ruby
text = '[attack surface intensifies]; rm -rf /'
system 'cowsay', '-f', 'duck', text
```
<!-- .element: class="fragment" -->

```ruby
system 'cowsay', '-f', 'duck', '[attack surface intensifies]; rm -rf /'
```
<!-- .element: class="fragment" -->

```no-highlight
 ________________________________________
< [attack surface intensifies]; rm -rf / >
 ----------------------------------------
 \
  \
   \ >()_
      (__)__ _
```
<!-- .element: class="fragment" -->

```ruby
result = system('echo', '[attack surface intensifies]')   # outputs regardless
p result
```
<!-- .element: class="fragment" -->

```no-highlight
[attack surface intensifies]
true
```
<!-- .element: class="fragment" -->

## can we capture the output?
<!-- .element: class="fragment" -->
