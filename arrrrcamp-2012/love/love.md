!SLIDE center transition=scrollLeft
![Rails Girls](rg.jpg)

!SLIDE bullets incremental
# ♥
* ⚬⚬
* ⚯
* ⚭
* honeymoon
* [signore](https://github.com/chastell/signore)

!SLIDE commandline incremental
    $ signore prego
    // sometimes I believe compiler ignores all my comments

    $ signore prego Lisp
    Lisp: from the people who didn’t bring you AI.

    $ signore prego Perl
    /* obligatory Perl joke (omitted for brevity) */
                                  [Tomasz Dubrownik]

    $ signore prego Ruby
    Cloud is to datacenter what Ruby is to assembler.
                                       [DevOps Borat]

    $ signore prego Python Ruby
    ‘I swear, Ruby has more syntax for creating strings than Python has total.’
    ‘"what" + %[are] + <<STR you STR + %q(talking) + 'about?'’
                                                 [Gary Bernhardt, Jeff Forcier]

    $ signore prego Lisp ~Python Ruby
    I love Ruby’s optional parentheses. Lisp doesn’t have optional parentheses.
                                                                   [Jamis Buck]

!SLIDE commandline incremental
    $ signore pronto Lisp
    text?
    (What the world needs (I think) is not (a Lisp (with fewer parentheses))
    but (an English (with more.)))

    author?
    Brian Hayes

    source?
    The Semicolon Wars

    subject?


    (What the world needs (I think) is not (a Lisp (with
    fewer parentheses)) but (an English (with more.)))
                       [Brian Hayes, The Semicolon Wars]

!SLIDE
 

!SLIDE
    @@@Ruby
    # encoding: UTF-8


















     

!SLIDE
    @@@Ruby
    # encoding: UTF-8
    Sig = Struct.new :author, :tags, :text

















     

!SLIDE
    @@@Ruby
    # encoding: UTF-8
    Sig = Struct.new :author, :tags, :text

    db = []















     

!SLIDE
    @@@Ruby
    # encoding: UTF-8
    Sig = Struct.new :author, :tags, :text

    db = []

    db.push Sig.new 'Patrick Huesler',













     

!SLIDE
    @@@Ruby
    # encoding: UTF-8
    Sig = Struct.new :author, :tags, :text

    db = []

    db.push Sig.new 'Patrick Huesler', ['Ruby', 'Unicorn'],













     

!SLIDE
    @@@Ruby
    # encoding: UTF-8
    Sig = Struct.new :author, :tags, :text

    db = []

    db.push Sig.new 'Patrick Huesler', ['Ruby', 'Unicorn'],
      'My deploy log message of the day: ‘sleeping ' +
      'for 3 seconds until all old unicorns are dead’.'











     

!SLIDE
    @@@Ruby
    # encoding: UTF-8
    Sig = Struct.new :author, :tags, :text

    db = []

    db.push Sig.new 'Patrick Huesler', ['Ruby', 'Unicorn'],
      'My deploy log message of the day: ‘sleeping ' +
      'for 3 seconds until all old unicorns are dead’.'

    db.push Sig.new 'Chris Wanstrath', ['Ruby', 'Enumerable'],
      'Every time I use Ruby’s Enumerable#partition ' +
      'I want to give matz a high five.'







     

!SLIDE
    @@@Ruby
    # encoding: UTF-8
    Sig = Struct.new :author, :tags, :text

    db = []

    db.push Sig.new 'Patrick Huesler', ['Ruby', 'Unicorn'],
      'My deploy log message of the day: ‘sleeping ' +
      'for 3 seconds until all old unicorns are dead’.'

    db.push Sig.new 'Chris Wanstrath', ['Ruby', 'Enumerable'],
      'Every time I use Ruby’s Enumerable#partition ' +
      'I want to give matz a high five.'

    sig = db.select { |sig| sig.tags.include? 'Ruby' }.shuffle.first





     

!SLIDE
    @@@Ruby
    # encoding: UTF-8
    Sig = Struct.new :author, :tags, :text

    db = []

    db.push Sig.new 'Patrick Huesler', ['Ruby', 'Unicorn'],
      'My deploy log message of the day: ‘sleeping ' +
      'for 3 seconds until all old unicorns are dead’.'

    db.push Sig.new 'Chris Wanstrath', ['Ruby', 'Enumerable'],
      'Every time I use Ruby’s Enumerable#partition ' +
      'I want to give matz a high five.'

    sig = db.select { |sig| sig.tags.include? 'Ruby' }.shuffle.first
    puts sig.text
    puts '— ' + sig.author



     

!SLIDE
    @@@Ruby
    # encoding: UTF-8
    Sig = Struct.new :author, :tags, :text

    db = []

    db.push Sig.new 'Patrick Huesler', ['Ruby', 'Unicorn'],
      'My deploy log message of the day: ‘sleeping ' +
      'for 3 seconds until all old unicorns are dead’.'

    db.push Sig.new 'Chris Wanstrath', ['Ruby', 'Enumerable'],
      'Every time I use Ruby’s Enumerable#partition ' +
      'I want to give matz a high five.'

    sig = db.select { |sig| sig.tags.include? 'Ruby' }.shuffle.first
    puts sig.text
    puts '— ' + sig.author

    # My deploy log message of the day: ‘sleeping
    # for 3 seconds until all old unicorns are dead’.
    # — Patrick Huesler
