## _do_ pave the cow path

```ruby
require 'pathname'   # (2003)

path = Pathname.glob('/usr/share/cowsay/cows/*.cow').first
puts path.read
```
<!-- .element: class="fragment" -->

```no-highlight
##
## Do we need to explain this?
##
## Reversal patch from "D. Joe Anderson" <deejoe@raccoon.com>
##  in Bug #190455
##
$the_cow = <<EOC;
       $thoughts
        $thoughts  ....
          .    ........
          .            .
          .             .
    .......              .........
    ..............................
Elephant inside ASCII snake
EOC
```
<!-- .element: class="fragment" -->

## can we drop the $variables?
<!-- .element: class="fragment" -->


## let’s hope for no $urprises on the cow path

```ruby
require 'pathname'

path = Pathname.glob('/usr/share/cowsay/cows/*.cow').first
puts path.readlines.map { |line| line.gsub(/\$[a-z_]+/, '') }
```
<!-- .element: class="fragment" -->

```no-highlight
##
## Do we need to explain this?
##
## Reversal patch from "D. Joe Anderson" <deejoe@raccoon.com>
##  in Bug #190455
##
 = <<EOC;
       
          ....
          .    ........
          .            .
          .             .
    .......              .........
    ..............................
Elephant inside ASCII snake
EOC
```
<!-- .element: class="fragment" -->

## can we keep only the heredoc?
<!-- .element: class="fragment" -->


## 🍸 a sensible use of the flip-flop operator 🍹

```ruby
require 'pathname'

path = Pathname.glob('/usr/share/cowsay/cows/*.cow').first
path.each_line do |line|
  puts line.gsub(/\$[a-z_]+/, '') if line['EO'] .. line[/^EO.$/]
end
```
<!-- .element: class="fragment" -->

```no-highlight
 = <<EOC;
       
          ....
          .    ........
          .            .
          .             .
    .......              .........
    ..............................
Elephant inside ASCII snake
EOC
```
<!-- .element: class="fragment" -->

## can we find the best cow for narrow terminals?
<!-- .element: class="fragment" -->

## …but keep mangling Perl files with Ruby?
<!-- .element: class="fragment" -->


```ruby
heredoc = lambda do |line|
  if line['EO'] .. line[/^EO.$/]
    line.gsub(/\$[a-z_]+/, '').gsub('\\\\', '\\')
  end
end
```

```ruby
require 'pathname'

puts Pathname.glob('/usr/share/cowsay/cows/*.cow')
       .map(&:readlines)
       .map { |lines| lines.map(&heredoc).compact }
       .min_by { |lines| lines.max_by(&:size).size }
```
<!-- .element: class="fragment" -->

```no-highlight
 = <<EOC;
    ____  
   /# /_\_
  |  |/o\o\
  |  \\_/_/
 / |_   |  
|  ||\_ ~| 
|  ||| \/  
|  |||_    
 \//  |    
  ||  |    
  ||_  \   
  \_|  o|  
  /\___/   
 /  ||||__ 
    (___)_)
EOC
```
<!-- .element: class="fragment" -->


```ruby
heredoc = lambda do |line|
  if line['EO'] .. line[/^EO.$/]
    line.gsub(/\$[a-z_]+/, '').gsub('\\\\', '\\')
  end
end
```

```ruby
require 'pathname'

puts Pathname.glob('/usr/share/cowsay/cows/*.cow')
       .map(&:readlines)
       .map { |lines| lines.map(&heredoc).compact }
       .max_by { |lines| lines.max_by(&:size).size }
```

```no-highlight
 = <<EOC;
                                      ___-------___
                                  _-~~             ~~-_
                               _-~                    /~-_
             /^\__/^\         /~  \                   /    \
           /|  O|| O|        /      \_______________/        \
          | |___||__|      /       /                \          \
          |          \    /      /                    \          \
          |   (_______) /______/                        \_________ \
          |         / /         \                      /            \
           \         \^\\         \                  /               \     /
             \         ||           \______________/      _-_       //\__//
               \       ||------_-~~-_ ------------- \ --/~   ~\    || __/
                 ~-----||====/~     |==================|       |/~~~~~
                  (_(__/  ./     /                    \_\      \.
                         (_(___/                         \_____)_)
EOC
```
<!-- .element: class="fragment" -->
