## duck the system

```ruby
system 'cowsay', '-f', 'duck', '[attack surface intensifies]'   # @sorenmacbeth
```

```no-highlight
$ ruby attack.rb
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
system 'cowsay', '-f', 'duck', '[attack surface intensifies]; rm -rf /'
```
<!-- .element: class="fragment" -->

```no-highlight
$ ruby rm.rb
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
$ ruby echo.rb
[attack surface intensifies]
true
```
<!-- .element: class="fragment" -->
