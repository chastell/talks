## hell… oh, kitty!

```ruby
text = 'OH: Every time I do `source ~/.bash_profile` I’m reminded ' \
       'of that time you accidentally did `source ~/.bash_history`.'
out  = `cowsay -f hellokitty #{text}`        # backticks will return!
puts out
```

```no-highlight
$ ruby backticks.rb
sh: 1: source: not found
sh: 1: source: not found
 _____________________________________
/ OH: Every time I do I’m reminded of \
\ that time you accidentally did .    /
 -------------------------------------
  \
   \
      /\_)o<
     |      \
     | O . O|
      \_____/
```
<!-- .element: class="fragment" -->

* lucky: where did half of the text go?<br />unlucky: what happend to my system?
<!-- .element: class="fragment" -->


## she sells shellwords

```ruby
require 'shellwords'

text = 'OH: Every time I do `source ~/.bash_profile` I’m reminded ' \
       'of that time you accidentally did `source ~/.bash_history`.'
safe = Shellwords.escape(text)
out  = `cowsay -f hellokitty -W 45 #{safe}`
puts out
```

```no-highlight
$ ruby shellwords.rb 
 ______________________________________________
/ OH: Every time I do `source ~/.bash_profile` \
| I’m reminded of that time you accidentally   |
\ did `source ~/.bash_history`.                /
 ----------------------------------------------
  \
   \
      /\_)o<
     |      \
     | O . O|
      \_____/
```
<!-- .element: class="fragment" -->
