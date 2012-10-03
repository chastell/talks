!SLIDE bullets incremental transition=scrollLeft
# PostgreSQL
* relational
* HStore, JSON, PostGIS, XML
* wonderful built-in types
* like MAC, IPv4, IPv6, UUID…
* like **arrays**

!SLIDE
    @@@Ruby
    require 'active_record'
    require 'logger'
    require 'postgres_ext'















     

!SLIDE
    @@@Ruby
    require 'active_record'
    require 'logger'
    require 'postgres_ext'

    ActiveRecord::Base.logger = Logger.new $stdout













     

!SLIDE
    @@@Ruby
    require 'active_record'
    require 'logger'
    require 'postgres_ext'

    ActiveRecord::Base.logger = Logger.new $stdout
    ActiveRecord::Base.establish_connection adapter: 'postgresql',
                                            database: 'arrrrcamp'











     

!SLIDE
    @@@Ruby
    require 'active_record'
    require 'logger'
    require 'postgres_ext'

    ActiveRecord::Base.logger = Logger.new $stdout
    ActiveRecord::Base.establish_connection adapter: 'postgresql',
                                            database: 'arrrrcamp'
    Class.new ActiveRecord::Migration do







    end


     

!SLIDE
    @@@Ruby
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
    end


     

!SLIDE
    @@@Ruby
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


     

!SLIDE
    @@@Ruby
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

    # CREATE TABLE "sigs" ("id" serial primary key,
    # "author" text, "text" text, "tags" text[])

!SLIDE
    @@@Ruby
    Sig = Class.new ActiveRecord::Base














     

!SLIDE
    @@@Ruby
    Sig = Class.new ActiveRecord::Base

    Sig.create author: 'Tim Pope',












     

!SLIDE
    @@@Ruby
    Sig = Class.new ActiveRecord::Base

    Sig.create author: 'Tim Pope', tags: ['Ruby', 'BigDecimal'],












     

!SLIDE
    @@@Ruby
    Sig = Class.new ActiveRecord::Base

    Sig.create author: 'Tim Pope', tags: ['Ruby', 'BigDecimal'],
      text: 'I wonder if the guy that wrote BigDecimal#inspect has ' +
      'a tragic backstory that explains why he hates humanity.'










     

!SLIDE
    @@@Ruby
    Sig = Class.new ActiveRecord::Base

    Sig.create author: 'Tim Pope', tags: ['Ruby', 'BigDecimal'],
      text: 'I wonder if the guy that wrote BigDecimal#inspect has ' +
      'a tragic backstory that explains why he hates humanity.'
    # INSERT INTO "sigs" ("author", "tags", "text") VALUES ($1, $2, $3)
    # RETURNING "id" [["author", "Tim Pope"], ["tags", ["Ruby", "BigDecimal"]],
    # ["text", "I wonder if the guy that wrote BigDecimal#inspect has…"]]







     

!SLIDE
    @@@Ruby
    Sig = Class.new ActiveRecord::Base

    Sig.create author: 'Tim Pope', tags: ['Ruby', 'BigDecimal'],
      text: 'I wonder if the guy that wrote BigDecimal#inspect has ' +
      'a tragic backstory that explains why he hates humanity.'
    # INSERT INTO "sigs" ("author", "tags", "text") VALUES ($1, $2, $3)
    # RETURNING "id" [["author", "Tim Pope"], ["tags", ["Ruby", "BigDecimal"]],
    # ["text", "I wonder if the guy that wrote BigDecimal#inspect has…"]]

    Sig.create author: 'Pаul Bаttley', tags: ['Ruby', 'Bundler'],
      text: 'I’d love to see an honest Ruby job ad. ‘You will spend half ' +
      'your time running bundle install & the other half facepalming.’'



     

!SLIDE
    @@@Ruby
    Sig = Class.new ActiveRecord::Base

    Sig.create author: 'Tim Pope', tags: ['Ruby', 'BigDecimal'],
      text: 'I wonder if the guy that wrote BigDecimal#inspect has ' +
      'a tragic backstory that explains why he hates humanity.'
    # INSERT INTO "sigs" ("author", "tags", "text") VALUES ($1, $2, $3)
    # RETURNING "id" [["author", "Tim Pope"], ["tags", ["Ruby", "BigDecimal"]],
    # ["text", "I wonder if the guy that wrote BigDecimal#inspect has…"]]

    Sig.create author: 'Pаul Bаttley', tags: ['Ruby', 'Bundler'],
      text: 'I’d love to see an honest Ruby job ad. ‘You will spend half ' +
      'your time running bundle install & the other half facepalming.’'

    Sig.create author: 'Tom Stuart', tags: ['Git'],
      text: 'Just discovered git rebase --interactive --autosquash. ' +
      'Holy shit. Will never again need to do any work.'

!SLIDE commandline incremental
    $ psql arrrrcamp

    # SELECT * FROM sigs;
     id |    author    |              text               |       tags
    ----+--------------+---------------------------------+-------------------
      1 | Tim Pope     | I wonder if the guy that wrote… | {Ruby,BigDecimal}
      2 | Pаul Bаttley | I’d love to see an honest Ruby… | {Ruby,Bundler}
      3 | Tom Stuart   | Just discovered git rebase --i… | {Git}
    (3 rows)

    # SELECT * FROM sigs WHERE 'Ruby' = ANY(tags);
     id |    author    |              text               |       tags
    ----+--------------+---------------------------------+-------------------
      1 | Tim Pope     | I wonder if the guy that wrote… | {Ruby,BigDecimal}
      2 | Pаul Bаttley | I’d love to see an honest Ruby… | {Ruby,Bundler}
    (2 rows)

!SLIDE
    @@@Ruby
    sig = Sig.where(':tag = ANY(tags)', tag: 'Ruby')








     

!SLIDE
    @@@Ruby
    sig = Sig.where(':tag = ANY(tags)', tag: 'Ruby').order('random()').first








     

!SLIDE
    @@@Ruby
    sig = Sig.where(':tag = ANY(tags)', tag: 'Ruby').order('random()').first
    # SELECT "sigs".* FROM "sigs"
    # WHERE ('Ruby' = ANY(tags)) ORDER BY random() LIMIT 1






     

!SLIDE
    @@@Ruby
    sig = Sig.where(':tag = ANY(tags)', tag: 'Ruby').order('random()').first
    # SELECT "sigs".* FROM "sigs"
    # WHERE ('Ruby' = ANY(tags)) ORDER BY random() LIMIT 1

    puts sig.text
    puts '— ' + sig.author



     

!SLIDE
    @@@Ruby
    sig = Sig.where(':tag = ANY(tags)', tag: 'Ruby').order('random()').first
    # SELECT "sigs".* FROM "sigs"
    # WHERE ('Ruby' = ANY(tags)) ORDER BY random() LIMIT 1

    puts sig.text
    puts '— ' + sig.author

    # I wonder if the guy that wrote BigDecimal#inspect has
    # a tragic backstory that explains why he hates humanity.
    # — Tim Pope
