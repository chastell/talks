## I like big cowws

```ruby
require 'shellwords'

text = 'The real meaning of Halloween gets lost in all ' \
       'the costumes and marketing. Most people don’t  ' \
       'even know Jesus fought a dragon, let alone why.'
safe = Shellwords.escape(text)                    # Keri
puts `cowsay -f dragon #{safe}`
```

```no-highlight
$ ruby dragon.rb 
 _________________________________________
/ The real meaning of Halloween gets lost \
| in all the costumes and marketing. Most |
| people don’t even know Jesus fought a   |
\ dragon, let alone why.                  /
 -----------------------------------------
      \                    / \  //\
       \    |\___/|      /   \//  \\
            /0  0  \__  /    //  | \ \    
           /     /  \/_/    //   |  \  \  
           @_^_@'/   \/_   //    |   \   \ 
           //_^_/     \/_ //     |    \    \
        ( //) |        \///      |     \     \
      ( / /) _|_ /   )  //       |      \     _\
    ( // /) '/,_ _ _/  ( ; -.    |    _ _\.-~        .-~~~^-.
  (( / / )) ,-{        _      `-.|.-~-.           .~         `.
 (( // / ))  '/\      /                 ~-. _ .-~      .-~^-.  \
 (( /// ))      `.   {            }                   /      \  \
  (( / ))     .----~-.\        \-'                 .~         \  `. \^-.
             ///.----..>        \             _ -~             `.  ^-`  ^-_
               ///-._ _ _ _ _ _ _}^ - - - - ~                     ~-- ,.-~
                                                                  /.-~
```
<!-- .element: class="fragment" -->


## and I cannot wide
```ruby
require 'io/console'
require 'shellwords'

text = 'The real meaning of Halloween gets lost in all ' \
       'the costumes and marketing. Most people don’t  ' \
       'even know Jesus fought a dragon, let alone why.'
safe = Shellwords.escape(text)
size = IO.console.winsize    #=> [24, 80] (height × width)
puts `cowsay -f dragon -W #{size.last - 4} #{safe}`
```

```no-highlight
$ ruby dragon.rb 
 ____________________________________________________________________________
/ The real meaning of Halloween gets lost in all the costumes and marketing. \
\ Most people don’t even know Jesus fought a dragon, let alone why.          /
 ----------------------------------------------------------------------------
      \                    / \  //\
       \    |\___/|      /   \//  \\
            /0  0  \__  /    //  | \ \    
           /     /  \/_/    //   |  \  \  
           @_^_@'/   \/_   //    |   \   \ 
           //_^_/     \/_ //     |    \    \
        ( //) |        \///      |     \     \
      ( / /) _|_ /   )  //       |      \     _\
    ( // /) '/,_ _ _/  ( ; -.    |    _ _\.-~        .-~~~^-.
  (( / / )) ,-{        _      `-.|.-~-.           .~         `.
 (( // / ))  '/\      /                 ~-. _ .-~      .-~^-.  \
 (( /// ))      `.   {            }                   /      \  \
  (( / ))     .----~-.\        \-'                 .~         \  `. \^-.
             ///.----..>        \             _ -~             `.  ^-`  ^-_
               ///-._ _ _ _ _ _ _}^ - - - - ~                     ~-- ,.-~
                                                                  /.-~
```
<!-- .element: class="fragment" -->
