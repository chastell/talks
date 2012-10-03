# encoding: UTF-8

require 'yaml/store'
store = YAML::Store.new 'sigs.yml'

Sig = Struct.new :author, :tags, :text

store.transaction do
  store['db'] ||= []

  store['db'].push Sig.new 'Mike Perham', ['Ruby', 'Rails'],
    '‘Never wrestle with a pig – you get dirty and the ' +
    'pig likes it.’ NOW REPLACE PIG WITH ASSET PIPELINE.'

  store['db'].push Sig.new 'Solomon White', ['Ruby', 'RubyGems'],
    'If you’re ever tempted to add a post-install message' +
    'to a gem, stop and back slowly away from the keyboard.'
end

sig = store.transaction true do
  store['db'].select { |sig| sig.tags.include? 'Ruby' }.shuffle.first
end

puts sig.text
puts '— ' + sig.author
