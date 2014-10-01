## there are more than two streams

```ruby
require 'open3'   # (1999)

text = 'In security startup we are heavy use of RoR as honeypot.'
                                                   # DevOps Borat

out, err, status = Open3.capture3('cowsay', '-f', 'koala', text)
puts out
```
<!-- .element: class="fragment" -->

```no-highlight
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
```
<!-- .element: class="fragment" -->


## is it secret? is it safe?

```ruby
require 'open3'

text = 'In security startup we are heavy use of RoR as honeypot.'
text += '; cat /etc/passwd'
out, err, status = Open3.capture3('cowsay', '-f', 'koala', text)
puts out, status.success?
```
<!-- .element: class="fragment" -->

```no-highlight
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
<!-- .element: class="fragment" -->

```no-highlight
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
