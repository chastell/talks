!SLIDE bullets center incremental transition=scrollLeft
# current status
* install Ruby
* install Rails
* install MySQL
* install The Ruby Racer
* (probably don’t need to)<br />install Vim

!SLIDE center incremental transition=scrollRight
![Vimsanity Wolf](vimsanity-wolf.jpg)
[Insanity Wolf \[by sgharms\]](http://www.quickmeme.com/meme/36hy2h/)

!SLIDE commandline incremental transition=scrollLeft
# current status
    $ rails new the-truth
    $ cd the-truth
    $ vim config/database.yml
    $ vim Gemfile
    $ rails generate model journalist name
    $ rails generate model article title body:text journalist:references
    $ rake db:migrate
    $ vim test/unit/{journalist,article}_test.rb

!SLIDE bullets transition=scrollLeft
* <div class='quote'>If the first thing you type, when writing a Ruby app,<br />is: ‘rails’, you’ve already lost the architecture game.<br />— Uncle Bob Martin</div>

!SLIDE center transition=scrollRight
![prof. Farnsworth](farnsworth.jpg)
[Meme… fusion!](http://imgur.com/NMuzY)
