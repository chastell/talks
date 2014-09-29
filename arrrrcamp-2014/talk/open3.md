## what if we need all three streams + result?

```ruby
require 'open3'

text = 'In security startup we are heavy use of RoR as honeypot.'   # DevOps
out, err, status = Open3.capture3('cowsay', '-f', 'koala', text)    # Borat
puts out
puts status.success?
```

```no-highlight
$ ruby honeypot.rb
 _________________________________________
/ In security startup we are heavy use of \
\ RoR as honeypot.                        /
 -----------------------------------------
  \
   \
       ___  
     {~._.~}
      ( Y )
     ()~*~()   
     (_)-(_)   
true
```
<!-- .element: class="fragment" -->


## what if we need all three streams + result?

```ruby
require 'open3'

text = 'In security startup we are heavy use of RoR as honeypot.'
text += '; cat /etc/passwd'
out, err, status = Open3.capture3('cowsay', '-f', 'koala', text)
puts out, status.success?
```

```no-highlight
$ ruby honeypot.rb 
 _________________________________________
/ In security startup we are heavy use of \
\ RoR as honeypot.; cat /etc/passwd       /
 -----------------------------------------
  \
   \
       ___  
     {~._.~}
      ( Y )
     ()~*~()   
     (_)-(_)   
true
```
<!-- .element: class="fragment" -->


## but… but… _streams…_

```ruby
require 'open3'

Open3.popen3('cowsay', '-f', 'vader-koala') do |sin, sout, serr, thread|
  sin.puts '‘It can be a little bit difficult to secure the connection’'
  sin.puts 'says this site using JSON-P + MD5.'           # James Coglan
  sin.close
  puts sout.read
  status = thread.value
  puts status.success?
end
```

```no-highlight
$ ruby secure.rb 
 _______________________________________
/ ‘It can be a little bit difficult to  \
| secure the connection’ says this site |
\ using JSON-P + MD5.                   /
 ---------------------------------------
   \
    \        .
     .---.  //
    Y|o o|Y// 
   /_(i=i)K/ 
   ~()~*~()~  
    (_)-(_)   

     Darth 
     Vader    
     koala        
true
```
<!-- .element: class="fragment" -->
