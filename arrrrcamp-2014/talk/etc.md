## make your users happy

```ruby
require 'etc'          # (1998)
require 'shellwords'

text = '‘Please choose another password to create your account. ' \
       'The password you attempted is already used by user JENKINS.’'
                                                     # Mikko Hypponen
user = Etc.getlogin
adm  = Etc.getgrnam('adm')
cow  = adm.mem.include?(user) ? 'tux' : 'www'
puts `cowsay -f #{cow} -W 60 #{text.shellescape}`
```

```no-highlight
 _____________________________________________________________
/ ‘Please choose another password to create your account. The \
\ password you attempted is already used by user JENKINS.’    /
 -------------------------------------------------------------
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
