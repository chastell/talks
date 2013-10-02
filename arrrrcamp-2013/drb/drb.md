!SLIDE

## DRb server

```ruby
module TypoFinder
  module_function

  def most_similar_pair_among pairs

  end
end
```

!SLIDE

## DRb server

```ruby
module TypoFinder
  module_function

  def most_similar_pair_among pairs
    pairs.min_by { |a1, a2| Levenshtein.distance a1, a2 }
  end
end
```

!SLIDE

## DRb server

```ruby
module TypoFinder
  module_function

  def most_similar_pair_among pairs
    pairs.min_by { |a1, a2| Levenshtein.distance a1, a2 }
  end
end

require 'drb/drb'

DRb.start_service 'druby://localhost:2009', TypoFinder
```

!SLIDE

## DRb server

```ruby
module TypoFinder
  module_function

  def most_similar_pair_among pairs
    pairs.min_by { |a1, a2| Levenshtein.distance a1, a2 }
  end
end

require 'drb/drb'

DRb.start_service 'druby://localhost:2009', TypoFinder
DRb.thread.join
```

!SLIDE

## DRb server

```ruby
module TypoFinder
  module_function

  def most_similar_pair_among pairs
    pairs.min_by { |a1, a2| Levenshtein.distance a1, a2 }
  end
end

require 'drb/drb'

DRb.start_service 'druby://localhost:2009', TypoFinder
DRb.thread.join

# …aaand we run it on each of the servers
```

!SLIDE

```ruby
require 'drb/drb'















    typo_finder = DRbObject.new_with_uri "druby://#{ip}:2009"
    typo_finder.most_similar_pair_among pairs
```

!SLIDE

```ruby
require 'drb/drb'
require 'ipaddr'


ips = IPAddr.new('4.3.2.1/26').to_range











    typo_finder = DRbObject.new_with_uri "druby://#{ip}:2009"
    typo_finder.most_similar_pair_among pairs
```

!SLIDE

```ruby
require 'drb/drb'
require 'ipaddr'


ips = IPAddr.new('4.3.2.1/26').to_range
ips.first                #=> 4.3.2.0
ips.last                 #=> 4.3.2.63









    typo_finder = DRbObject.new_with_uri "druby://#{ip}:2009"
    typo_finder.most_similar_pair_among pairs
```

!SLIDE

```ruby
require 'drb/drb'
require 'ipaddr'


ips = IPAddr.new('4.3.2.1/26').to_range
ips.first                #=> 4.3.2.0
ips.last                 #=> 4.3.2.63
ips = ips.to_a[1...-1]   #=> 4.3.2.1 to 4.3.2.62








    typo_finder = DRbObject.new_with_uri "druby://#{ip}:2009"
    typo_finder.most_similar_pair_among pairs
```

!SLIDE

```ruby
require 'drb/drb'
require 'ipaddr'


ips = IPAddr.new('4.3.2.1/26').to_range
ips.first                #=> 4.3.2.0
ips.last                 #=> 4.3.2.63
ips = ips.to_a[1...-1]   #=> 4.3.2.1 to 4.3.2.62

batch_size = authors.size * (authors.size - 1) / 2.0 / ips.size






    typo_finder = DRbObject.new_with_uri "druby://#{ip}:2009"
    typo_finder.most_similar_pair_among pairs
```

!SLIDE

```ruby
require 'drb/drb'
require 'ipaddr'


ips = IPAddr.new('4.3.2.1/26').to_range
ips.first                #=> 4.3.2.0
ips.last                 #=> 4.3.2.63
ips = ips.to_a[1...-1]   #=> 4.3.2.1 to 4.3.2.62

batch_size = authors.size * (authors.size - 1) / 2.0 / ips.size

# we need no more than ips.size slices:
slices = authors.combination(2).each_slice batch_size.ceil



    typo_finder = DRbObject.new_with_uri "druby://#{ip}:2009"
    typo_finder.most_similar_pair_among pairs
```

!SLIDE

```ruby
require 'drb/drb'
require 'ipaddr'


ips = IPAddr.new('4.3.2.1/26').to_range
ips.first                #=> 4.3.2.0
ips.last                 #=> 4.3.2.63
ips = ips.to_a[1...-1]   #=> 4.3.2.1 to 4.3.2.62

batch_size = authors.size * (authors.size - 1) / 2.0 / ips.size

# we need no more than ips.size slices:
slices = authors.combination(2).each_slice batch_size.ceil

          ips.zip(slices).map do |ip, pairs|

    typo_finder = DRbObject.new_with_uri "druby://#{ip}:2009"
    typo_finder.most_similar_pair_among pairs

end
```

!SLIDE

```ruby
require 'drb/drb'
require 'ipaddr'
require 'thread'

ips = IPAddr.new('4.3.2.1/26').to_range
ips.first                #=> 4.3.2.0
ips.last                 #=> 4.3.2.63
ips = ips.to_a[1...-1]   #=> 4.3.2.1 to 4.3.2.62

batch_size = authors.size * (authors.size - 1) / 2.0 / ips.size

# we need no more than ips.size slices:
slices = authors.combination(2).each_slice batch_size.ceil

threads = ips.zip(slices).map do |ip, pairs|
  Thread.new do
    typo_finder = DRbObject.new_with_uri "druby://#{ip}:2009"
    typo_finder.most_similar_pair_among pairs
  end
end
```

!SLIDE

```ruby
require 'drb/drb'
require 'ipaddr'
require 'thread'

ips = IPAddr.new('4.3.2.1/26').to_range
ips.first                #=> 4.3.2.0
ips.last                 #=> 4.3.2.63
ips = ips.to_a[1...-1]   #=> 4.3.2.1 to 4.3.2.62

batch_size = authors.size * (authors.size - 1) / 2.0 / ips.size

# we need no more than ips.size slices:
slices = authors.combination(2).each_slice batch_size.ceil

threads = ips.zip(slices).map do |ip, pairs|
  Thread.new do
    typo_finder = DRbObject.new_with_uri "druby://#{ip}:2009"
    typo_finder.most_similar_pair_among pairs
  end
end

selected_pairs = threads.map(&:value)
```

!SLIDE

```ruby
require 'drb/drb'
require 'ipaddr'
require 'thread'

ips = IPAddr.new('4.3.2.1/26').to_range
ips.first                #=> 4.3.2.0
ips.last                 #=> 4.3.2.63
ips = ips.to_a[1...-1]   #=> 4.3.2.1 to 4.3.2.62

batch_size = authors.size * (authors.size - 1) / 2.0 / ips.size

# we need no more than ips.size slices:
slices = authors.combination(2).each_slice batch_size.ceil

threads = ips.zip(slices).map do |ip, pairs|
  Thread.new do
    typo_finder = DRbObject.new_with_uri "druby://#{ip}:2009"
    typo_finder.most_similar_pair_among pairs
  end
end

selected_pairs = threads.map(&:value)

TypoFinder.most_similar_pair_among selected_pairs
```

!SLIDE

```ruby
require 'drb/drb'
require 'ipaddr'
require 'thread'

ips = IPAddr.new('4.3.2.1/26').to_range
ips.first                #=> 4.3.2.0
ips.last                 #=> 4.3.2.63
ips = ips.to_a[1...-1]   #=> 4.3.2.1 to 4.3.2.62

batch_size = authors.size * (authors.size - 1) / 2.0 / ips.size

# we need no more than ips.size slices:
slices = authors.combination(2).each_slice batch_size.ceil

threads = ips.zip(slices).map do |ip, pairs|
  Thread.new do
    typo_finder = DRbObject.new_with_uri "druby://#{ip}:2009"
    typo_finder.most_similar_pair_among pairs
  end
end

selected_pairs = threads.map(&:value)

TypoFinder.most_similar_pair_among selected_pairs
# in actual db: ['I Am Developer', 'I Am Devloper']
```
