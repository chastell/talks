# encoding: UTF-8
require 'redis-roc'

Sig = Struct.new :author, :text

store = ROC::Store::RedisStore.new Redis.new

brian = Marshal.dump Sig.new 'Brian P. Hogan',
  'There are so many things in Rails that make people go ‘AWESOME’ ' +
  'and then two years later, make them go ‘I should not have used that’.'
store.init_set('tag:Ruby').add brian

reg = Marshal.dump Sig.new 'Reg Braithwaite',
  'The ‘Ruby Community’ is the Woody Allen of programming languages, ' +
  'all neuroses and internal monologues, but loveable and means well.'
store.init_set('tag:Ruby').add reg
store.init_set('tag:movies').add reg

adam = Marshal.dump Sig.new 'Adam Keys',
  'I want to see a hacker movie where the protagonist just stares in ' +
  'confusion at a stack trace for a few minutes. No typing, no chatter.'
store.init_set('tag:movies').add adam

ruby   = store.init_set 'tag:Ruby'
movies = store.init_set 'tag:movies'

sig = Marshal.load (ruby & movies).sample
puts sig.text
puts '— ' + sig.author
