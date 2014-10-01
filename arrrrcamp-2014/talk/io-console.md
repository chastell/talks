## not all consoles are created equal

```ruby
require 'shellwords'

text = 'The real meaning of Halloween gets lost in all ' \
       'the costumes and marketing. Most people don’t  ' \
       'even know Jesus fought a dragon, let alone why.'
safe = Shellwords.escape(text)                    # Keri
puts `cowsay -f dragon #{safe}`
```
<!-- .element: class="fragment" -->

```no-highlight
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


## some io/consoles are wider than others
```ruby
require 'io/console'   # (4? yo)
require 'shellwords'

text = 'The real meaning of Halloween gets lost in all ' \
       'the costumes and marketing. Most people don’t  ' \
       'even know Jesus fought a dragon, let alone why.'
safe = Shellwords.escape(text)
size = IO.console.winsize    #=> [24, 80] (height × width)
puts `cowsay -f dragon -W #{size.last - 4} #{safe}`
```
<!-- .element: class="fragment" -->

```no-highlight
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
