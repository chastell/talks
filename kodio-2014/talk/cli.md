# CLI
* there are tonnes of commands<br />useful on an everyday basis <!-- .element class="fragment" -->
* this is just a crash course<br />through some of them <!-- .element class="fragment" -->
* …and through some<br />example pipe chaining <!-- .element class="fragment" -->

<div class='fragment quote'>Mistyped find-awk-xargs-rm pipeline<br />backfires killing Ted Dziuba.<br />— Fake Hacker News</div>


<pre>
<span class='command'>$ find app/models -name '*.rb'</span>
<span class='fragment'>app/models/foo.rb
app/models/bar.rb
app/models/baz.rb
…</span>
</pre>

<pre>
<span class='command fragment'>$ find app/models -name '*.rb' | xargs wc -l</span>
<span class='fragment'>    43 app/models/foo.rb
     2 app/models/bar.rb
    83 app/models/baz.rb
…</span>
</pre>

<pre>
<span class='command fragment'>$ find app/models -name '*.rb' | xargs wc -l | sort -nr</span>
<span class='fragment'>  17124 total
  3663 app/models/qux.rb
  1426 app/models/quux.rb
  1240 app/models/corge.rb
   953 app/models/grault.rb
…                             # via Sam Livingston-Gray</span>
</pre>


<pre>
<span class='command command'>$ git log --oneline --name-only</span>
<span class='fragment'>badf00d some commit message
app/models/foo.rb
cafeb01 another commit message
…</span>
<span class='command fragment'>$ git log --oneline --name-only | grep '^[^ ]*\.rb$'</span>
<span class='fragment'>app/models/foo.rb
app/controllers/bars_controller.rb
app/views/users/_baz.html.erb
…</span>
<span class='command fragment'>$ git log --oneline --name-only | grep '^[^ ]*\.rb$' | sort | uniq -c</span>
<span class='fragment'>     63 app/controllers/corges_controller.rb
    183 app/controllers/quuxs_controller.rb
      4 app/controllers/quxs_controller.rb
…</span>
<span class='command fragment'>$ git log --oneline --name-only | grep '^[^ ]*\.rb$' | sort | uniq -c | sort -nr</span>
<span class='fragment'>   1096 app/models/foo.rb
    325 app/controllers/foos_controller.rb
    257 app/models/bar.rb
    251 config/routes.rb
    248 app/controllers/baz_controller.rb
…                                         # via Samson Ootoovak/Michael Feathers</span>
</pre>


<pre>
<span class='command'>$ head mig.log</span>
<span class='fragment'>==  AddFooToBar: migrating ===========================
-- add_column(:bars, :foo, :integer)
   -> 0.1044s
-- add_column(:bars, :baz, :integer)
   -> 0.1144s
…</span>
</pre>

<pre>
<span class='command fragment'>$ grep ' -> [0-9.]*s' mig.log</span>
<span class='fragment'>    -> 0.1044s
    -> 0.1144s
…</span>
</pre>

<pre>
<span class='command fragment'>$ grep ' -> [0-9.]*s' mig.log | cut -d' ' -f5</span>
<span class='fragment'>0.1044s
0.1144s
…</span>
</pre>

<pre>
<span class='command fragment'>$ grep ' -> [0-9.]*s' mig.log | cut -d' ' -f5 | tr -d s</span>
<span class='fragment'>0.1044
0.1144
…</span>
</pre>


<pre>
<span class='command command'>$ grep ' -> [0-9.]*s' mig.log | cut -d' ' -f5 | tr -d s | xargs</span>
<span class='fragment'>0.1044 0.1144 …</span>
</pre>

<pre>
<span class='command fragment'>$ grep ' -> [0-9.]*s' mig.log | cut -d' ' -f5 | tr -d s | xargs | tr ' ' +</span>
<span class='fragment'>0.1044+0.1144+…</span>
</pre>

<pre>
<span class='command fragment'>$ grep ' -> [0-9.]*s' mig.log | cut -d' ' -f5 | tr -d s | xargs | tr ' ' + | bc</span>
<span class='fragment'>4.0230</span>
</pre>

<pre>
<span class='command fragment'>$ grep -o '[0-9.]\+' mig.log | paste -sd+ | bc</span>
<span class='fragment'>4.0230</span>
</pre>

<pre>
<span class='command fragment'>$ diff <(grep -r foo some_dir) <(grep -r foo other_dir)</span>
<span class='fragment'>…</span>
</pre>

<pre>
<span class='command'><span class='fragment'>$ pbpaste</span> <span class='fragment'>| pygmentize -l ruby -f rtf -O style=presentation</span></span> <span class='fragment'><span class='command'>| pbcopy</span>
                                   # via Katrina Owen/Gary Bernhardt</span>
</pre>


## pipe viewer

<pre>
<span class='command'><span class='fragment'>$ cat db_name.sql</span> <span class='fragment'>| psql db_name</span></span>
<span class='fragment'># Time passes.</span>
<span class='fragment'># It is pitch black.</span>
<span class='fragment'># You are likely to be eaten by a grue.</span>
</pre>

<pre>
<span class='command'><span class='fragment'>$ cat db_name.sql</span> <span class='fragment'>| pv</span> <span class='fragment'>| psql db_name</span></span>
<span class='fragment'>97MB 0:00:12 [28.3MB/s] [        <=>                                               ]
^C</span>
</pre>

<pre>
<span class='command'><span class='fragment'>$ pv db_name.sql</span> <span class='fragment'>| psql db_name</span></span>
<span class='fragment'>97MB 0:00:12 [28.3MB/s] [============>                             ] 32% ETA 0:00:24
^C</span>
</pre>

<pre>
<span class='command'><span class='fragment'>$ pg_dump db_name</span> <span class='fragment'>| pv -s 600m | gzip > db_name.sql.gz</span></span>
<span class='fragment'>592MB 0:05:09 [1.92MB/s] [=======================================> ] 98%</span>
</pre>


# notable CLI tools
<ul>
  <li class='fragment'>`pgrep` + `pkill` – find and kill processes</li>
  <li class='fragment'>`watch` – refresh output every X seconds</li>
  <li class='fragment'>`timeout` – kill a program after X time</li>
  <li class='fragment'>[GNU `parallel`](https://www.gnu.org/software/parallel/man.html) – just… read about it</li>
  <li class='fragment'>`ncdu` – check what takes so much space</li>
  <li class='fragment'>`proxylocal` – expose a local port to the public</li>
  <li class='fragment'>`rmadison` – Debian+Ubuntu versions of a package</li>
</ul>
