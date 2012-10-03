# encoding: UTF-8
require 'active_record'
require 'logger'
require 'postgres_ext'

ActiveRecord::Base.logger = Logger.new $stdout
ActiveRecord::Base.establish_connection adapter: 'postgresql',
                                        database: 'arrrrcamp'

Class.new ActiveRecord::Migration do
  def change
    create_table :sigs do |table|
      table.text :author
      table.text :text
      table.text :tags, array: true
    end
  end
end.new.migrate :up

Sig = Class.new ActiveRecord::Base

Sig.create author: 'Tim Pope', tags: ['Ruby', 'BigDecimal'],
  text: 'I wonder if the guy that wrote BigDecimal#inspect has ' +
  'a tragic backstory that explains why he hates humanity.'

Sig.create author: 'Pаul Bаttley', tags: ['Ruby', 'Bundler'],
  text: 'I’d love to see an honest Ruby job ad. ‘You will spend half ' +
  'your time running bundle install & the other half facepalming.’'

Sig.create author: 'Tom Stuart', tags: ['Git'],
  text: 'Just discovered git rebase --interactive --autosquash.' +
    'Holy shit. Will never again need to do any work.'

sig = Sig.where(':tag = ANY(tags)', :tag => 'Ruby').order('random()').first
puts sig.text
puts '— ' + sig.author
