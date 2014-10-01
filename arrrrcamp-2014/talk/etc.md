## make your users happy

```ruby
require 'etc'          # (16 yo)
require 'shellwords'

text = 'Behold the guy who removed the executable bit ' \
       'from /usr on his laptop on a Monday morning.'
                                        # Mislav Marohnić
user = Etc.getlogin
adm  = Etc.getgrnam('adm')
cow  = adm.mem.include?(user) ? 'tux' : 'www'
puts `cowsay -f #{cow} #{text.shellescape}`
```

```no-highlight
 ________________________________________
/ Behold the guy who removed the         \
| executable bit from /usr on his laptop |
\ on a Monday morning.                   /
 ----------------------------------------
   \
    \
        .--.
       |o_o |
       |:_/ |
      //   \ \
     (|     | )
    /'\_   _/`\
    \___)=(___/
```
<!-- .element: class="fragment" -->
