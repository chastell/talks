!SLIDE

```ruby
store.push Sig.new('Jamie Gaskins', %w(REST),
  'The word ‘RESTful’, when talking about web APIs, is a portmanteau ' +
  'of the acronyms ‘REST’ and ‘STFU’. The L stands for ‘LOL’.')
```

!SLIDE

```ruby
store.push Sig.new('Jamie Gaskins', %w(REST),
  'The word ‘RESTful’, when talking about web APIs, is a portmanteau ' +
  'of the acronyms ‘REST’ and ‘STFU’. The L stands for ‘LOL’.')

store.push Sig.new('Tom Dale', %w(Rails Node Perl Lisp),
  'Rails is omakase. Node is street food. Perl is teenage angst. ' +
  'Lisp is a doorknob. I am an orange scorpion. This acid is amazing.')
```

!SLIDE

```ruby
store.push Sig.new('Jamie Gaskins', %w(REST),
  'The word ‘RESTful’, when talking about web APIs, is a portmanteau ' +
  'of the acronyms ‘REST’ and ‘STFU’. The L stands for ‘LOL’.')

store.push Sig.new('Tom Dale', %w(Rails Node Perl Lisp),
  'Rails is omakase. Node is street food. Perl is teenage angst. ' +
  'Lisp is a doorknob. I am an orange scorpion. This acid is amazing.')

tags = store.flat_map(&:tags).uniq   # ['REST', 'Rails', 'Node', 'Perl', 'Lisp']
```

!SLIDE

```ruby
store.push Sig.new('Jamie Gaskins', %w(REST),
  'The word ‘RESTful’, when talking about web APIs, is a portmanteau ' +
  'of the acronyms ‘REST’ and ‘STFU’. The L stands for ‘LOL’.')

store.push Sig.new('Tom Dale', %w(Rails Node Perl Lisp),
  'Rails is omakase. Node is street food. Perl is teenage angst. ' +
  'Lisp is a doorknob. I am an orange scorpion. This acid is amazing.')

tags = store.flat_map(&:tags).uniq   # ['REST', 'Rails', 'Node', 'Perl', 'Lisp']

require 'abbrev'
```

!SLIDE

```ruby
store.push Sig.new('Jamie Gaskins', %w(REST),
  'The word ‘RESTful’, when talking about web APIs, is a portmanteau ' +
  'of the acronyms ‘REST’ and ‘STFU’. The L stands for ‘LOL’.')

store.push Sig.new('Tom Dale', %w(Rails Node Perl Lisp),
  'Rails is omakase. Node is street food. Perl is teenage angst. ' +
  'Lisp is a doorknob. I am an orange scorpion. This acid is amazing.')

tags = store.flat_map(&:tags).uniq   # ['REST', 'Rails', 'Node', 'Perl', 'Lisp']

require 'abbrev'

tags.abbrev
# { 'REST' => 'REST', 'RES' => 'REST', 'RE' => 'REST', 'Rails' => 'Rails',
# 'Rail' => 'Rails', 'Rai' => 'Rails', 'Ra' => 'Rails', 'Node' => 'Node',
# 'Nod' => 'Node', 'No' => 'Node', 'N' => 'Node', 'Perl' => 'Perl',
# 'Per' => 'Perl', 'Pe' => 'Perl', 'P' => 'Perl', 'Lisp' => 'Lisp',
# 'Lis' => 'Lisp', 'Li' => 'Lisp', 'L' => 'Lisp' }
```

!SLIDE

```ruby
tags.abbrev('R')
# { 'REST' => 'REST', 'RES' => 'REST', 'RE' => 'REST', 'Rails' => 'Rails',
# 'Rail' => 'Rails', 'Rai' => 'Rails', 'Ra' => 'Rails' }

tags.abbrev('R')['R']   # nil
```

!SLIDE

```ruby
tags.abbrev('R')
# { 'REST' => 'REST', 'RES' => 'REST', 'RE' => 'REST', 'Rails' => 'Rails',
# 'Rail' => 'Rails', 'Rai' => 'Rails', 'Ra' => 'Rails' }

tags.abbrev('R')['R']   # nil

keys = tags.abbrev('R').keys.sort_by(&:size)
# ['Ra', 'RE', 'RES', 'Rai', 'Rail', 'REST', 'Rails']
```

!SLIDE

```ruby
tags.abbrev('R')
# { 'REST' => 'REST', 'RES' => 'REST', 'RE' => 'REST', 'Rails' => 'Rails',
# 'Rail' => 'Rails', 'Rai' => 'Rails', 'Ra' => 'Rails' }

tags.abbrev('R')['R']   # nil

keys = tags.abbrev('R').keys.sort_by(&:size)
# ['Ra', 'RE', 'RES', 'Rai', 'Rail', 'REST', 'Rails']

keys.take_while { |key| key.size == keys.first.size }
# ['Ra', 'RE']
```

!SLIDE

```ruby
tags.abbrev('R')
# { 'REST' => 'REST', 'RES' => 'REST', 'RE' => 'REST', 'Rails' => 'Rails',
# 'Rail' => 'Rails', 'Rai' => 'Rails', 'Ra' => 'Rails' }

tags.abbrev('R')['R']   # nil

keys = tags.abbrev('R').keys.sort_by(&:size)
# ['Ra', 'RE', 'RES', 'Rai', 'Rail', 'REST', 'Rails']

keys.take_while { |key| key.size == keys.first.size }
# ['Ra', 'RE']

tags.abbrev('RE')
# { 'REST' => 'REST', 'RES' => 'REST', 'RE' => 'REST' }

tags.abbrev('RE')['RE']   # 'REST'
```

!SLIDE

```ruby
tags.abbrev('R')
# { 'REST' => 'REST', 'RES' => 'REST', 'RE' => 'REST', 'Rails' => 'Rails',
# 'Rail' => 'Rails', 'Rai' => 'Rails', 'Ra' => 'Rails' }

tags.abbrev('R')['R']   # nil

keys = tags.abbrev('R').keys.sort_by(&:size)
# ['Ra', 'RE', 'RES', 'Rai', 'Rail', 'REST', 'Rails']

keys.take_while { |key| key.size == keys.first.size }
# ['Ra', 'RE']

tags.abbrev('RE')
# { 'REST' => 'REST', 'RES' => 'REST', 'RE' => 'REST' }

tags.abbrev('RE')['RE']   # 'REST'

tags.abbrev(/e/)
# { 'Node' => 'Node', 'Perl' => 'Perl', 'Per' => 'Perl', 'Pe' => 'Perl' }
```

!SLIDE

```ruby
tags.abbrev('R')
# { 'REST' => 'REST', 'RES' => 'REST', 'RE' => 'REST', 'Rails' => 'Rails',
# 'Rail' => 'Rails', 'Rai' => 'Rails', 'Ra' => 'Rails' }

tags.abbrev('R')['R']   # nil

keys = tags.abbrev('R').keys.sort_by(&:size)
# ['Ra', 'RE', 'RES', 'Rai', 'Rail', 'REST', 'Rails']

keys.take_while { |key| key.size == keys.first.size }
# ['Ra', 'RE']

tags.abbrev('RE')
# { 'REST' => 'REST', 'RES' => 'REST', 'RE' => 'REST' }

tags.abbrev('RE')['RE']   # 'REST'

tags.abbrev(/e/)
# { 'Node' => 'Node', 'Perl' => 'Perl', 'Per' => 'Perl', 'Pe' => 'Perl' }

tags.abbrev(/p/)
# { 'Lisp' => 'Lisp' }
```
