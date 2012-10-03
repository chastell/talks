# encoding: UTF-8

require 'bson'
BSON::ObjectID = BSON::ObjectId

require 'candy'

class Sig
  include Candy::Piece
end

class Sigs
  include Candy::Collection
  collects Sig
end

# fogus = Sig.new
# # connects to localhost:27017 and ‘chastell’ db if needed
# # and saves a new document to the ‘Sig’ collection
# 
# fogus.author = 'fogus'   # method_missing resaves
# fogus.tags   = ['Ruby', 'Java']
# fogus.text   = 'How many lines of Java would it take to do this? ' +
#   'obj.class.superclass.public_instance_methods(false).sort'
# 
# michael = Sig.new author: 'Michael Feathers', tags: ['Ruby', 'coding'],
#   text: 'At the dentist’s thinking about whether hints of method size can ' +
#   'be seen in intra-class dependency diagrams. Oh no, here comes the drill.'
# 
# zach = Sig.new author: 'Zach Holman', tags: ['coding', 'work'],
#   text: 'I think programming riddles, games, and brain teasers are a great ' +
#   'way to hire. First one to say ‘fuck this!’ and walk out gets the job.'

sig = Sigs.tags('coding').to_a.shuffle.first.refresh
puts sig.text
puts '— ' + sig.author
