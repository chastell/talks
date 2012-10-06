# encoding: UTF-8

Sig = Struct.new :author, :tags, :text

db = []

db.push Sig.new 'Tim Pope', ['Ruby', 'BigDecimal'],
  'I wonder if the guy that wrote BigDecimal#inspect has ' +
  'a tragic backstory that explains why he hates humanity.'

db.push Sig.new 'Pаul Bаttley', ['Ruby', 'Bundler'],
  'I’d love to see an honest Ruby job ad. ‘You will spend half ' +
  'your time running bundle install & the other half facepalming.’'

sig = db.select { |sig| sig.tags.include? 'Ruby' }.sample
puts sig.text
puts '— ' + sig.author
