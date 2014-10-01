## can we choose a cowfile<br />based on user’s group?

```ruby
text = '‘Please choose another password to create your account. ' \
       'The password you attempted is already used by user JENKINS.’'
                                                     # Mikko Hypponen
```
<!-- .element: class="fragment" -->

```ruby
require 'etc'          # (1998)
require 'shellwords'

user = Etc.getlogin          # there’s no way to get user’s groups…
adm  = Etc.getgrnam('adm')   # but is a way to get a group’s users!
cow  = adm.mem.include?(user) ? 'tux' : 'www'
puts `cowsay -f #{cow} -W 60 #{text.shellescape}`   # stdlib ♥ core
```
<!-- .element: class="fragment" -->

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
