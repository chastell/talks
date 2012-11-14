!SLIDE bullets incremental transition=scrollLeft
# CLI
* there are tonnes of commands<br />useful on an everyday basis
* this is just a crash course<br />through some of them
* …and through some example pipe chaining
* <div class='quote'>Mistyped find-awk-xargs-rm pipeline backfires killing Ted Dziuba.<br />— Fake Hacker News</div>

!SLIDE bullets incremental small
# building blocks
* `diff`, `find`, `grep`, `head`, `tail`, `sort -nr`
* `uniq -c` – count repeats (input must be sorted)
* `cut` – leave only some parts of every line
* `xargs` – turn lines into a command’s arguments
* `tr` – translate: replace or delete (`-d`) characters
* `bc` – command-line calculator
* `wc` – count words, chars (`-c`) or lines (`-l`)

!SLIDE commandline incremental
    $ find app/models -name '*.rb'
    app/models/foo.rb
    app/models/bar.rb
    app/models/baz.rb
    …

    $ find app/models -name '*.rb' | xargs echo wc -l
    wc -l app/models/foo.rb app/models/bar.rb app/models/baz.rb …

    $ find app/models -name '*.rb' | xargs wc -l
        43 app/models/foo.rb
         2 app/models/bar.rb
        83 app/models/baz.rb
    …

    $ find app/models -name '*.rb' | xargs wc -l | sort -nr
     17124 total
      3663 app/models/qux.rb
      1426 app/models/quux.rb
      1240 app/models/corge.rb
       953 app/models/grault.rb
    …                             # via Sam Livingston-Gray

!SLIDE commandline incremental
    $ git log --oneline --name-only
    badf00d some commit message
    app/models/foo.rb
    cafeb01 another commit message
    app/controllers/bar_controller.rb
    app/views/users/_baz.html.erb
    …
    $ git log --oneline --name-only | grep '^[^ ]*\.rb$'
    app/models/foo.rb
    app/models/bar.rb
    app/controllers/bazs_controller.rb
    app/models/bar.rb
    …
    $ git log --oneline --name-only | grep '^[^ ]*\.rb$' | sort | uniq -c
          4 app/controllers/quxs_controller.rb
        183 app/controllers/quuxs_controller.rb
         63 app/controllers/corges_controller.rb
    …
    $ git log --oneline --name-only | grep '^[^ ]*\.rb$' | sort | uniq -c | sort -nr
       1096 app/models/foo.rb
        325 app/controllers/foos_controller.rb
        257 app/models/bar.rb
        251 config/routes.rb
        248 app/controllers/baz_controller.rb
        224 db/schema.rb
    …                                         # via Samson Ootoovak/Michael Feathers

!SLIDE commandline incremental
    $ head mig.log
    ==  AddFooToBar: migrating ===========================
    -- add_column(:bars, :foo, :integer)
      -> 0.1044s
    -- add_column(:bars, :baz, :integer)
      -> 0.1144s
    …
    $ grep ' -> [0-9.]*s' mig.log
       -> 0.1044s
       -> 0.1144s
    …
    $ grep ' -> [0-9.]*s' mig.log | cut -d' ' -f5
    0.1044s
    0.1144s
    …
    $ grep ' -> [0-9.]*s' mig.log | cut -d' ' -f5 | tr -d s
    0.1044
    0.1144
    …
    $ grep ' -> [0-9.]*s' mig.log | cut -d' ' -f5 | tr -d s | xargs
    0.1044 0.1144 …
    $ grep ' -> [0-9.]*s' mig.log | cut -d' ' -f5 | tr -d s | xargs | tr ' ' +
    0.1044+0.1144+…
    $ grep ' -> [0-9.]*s' mig.log | cut -d' ' -f5 | tr -d s | xargs | tr ' ' + | bc
    4.0230

!SLIDE commandline incremental
    $ cat db_name.sql | pv | psql db_name
    97MB 0:00:12 [28.3MB/s] [        <=>                                               ]
    ^C

    $ pv db_name.sql | psql db_name
    97MB 0:00:12 [28.3MB/s] [============>                             ] 32% ETA 0:00:24
    ^C

    $ pg_dump db_name | pv -s 600m | gzip > db_name.sql.gz
    592MB 0:05:09 [1.92MB/s] [=======================================> ] 98%

!SLIDE commandline incremental
    $ pbpaste | pygmentize -l ruby -f rtf -O style=presentation | pbcopy
    * pastes the system clipboard to the command line
    * colours it: Ruby syntax, RTF format and presentation-style output
    * copies it back to the system clipboard
                                       # via Katrina Owen/Gary Bernhardt

    $ diff <(grep -r foo some_dir) <(grep -r foo other_dir)

!SLIDE bullets incremental small
# (mostly) standalone CLI apps
* `pgrep` + `pkill` – find and kill processes
* `watch` – refresh output refreshing every X seconds
* `timeout` – kill a program after X time
* `parallel` – parallel program execution
* `rmadison` – Debian and Ubuntu versions of a given package
* `ncdu` – check what takes so much space
* `proxylocal` – expose a local port to the public
