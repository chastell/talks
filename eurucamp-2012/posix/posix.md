!SLIDE bullets incremental transition=scrollLeft
# be nice to processes
* `$PROGRAM_NAME = 'fantastic'                   `
* `$PROGRAM_NAME = "dump (#{progress}% complete)"`<br />
  `$PROGRAM_NAME = "dump (#{time}s left)"        `
* `exit                                          `<br />
  `exit 1                                        `
* `Errs = { foo: 1, bar: 2, baz: 4, qux: 64 }    `<br />
  `exit Errs[:foo] | Errs[:baz] | Errs[:qux]     `
* `abort 'bad user!'                             `

!SLIDE bullets incremental transition=scrollLeft
# it’s a trap!
* `Signal.list`
* `trap :EXIT { puts 'so exiting!' }`
* `:TERM` vs `:KILL`
* `:INT    # ctrl-c`<br />
  `:HUP    # config`<br />
  `:USR1   # debug?`

!SLIDE transition=scrollLeft
# Resque
<table>
  <tr><th>QUIT</th><td>wait for child to finish then exit</td></tr>
  <tr><th>TERM, INT</th><td>immediately kill child then exit</td></tr>
  <tr><th>USR1</th><td>immediately kill child but don’t exit</td></tr>
  <tr><th>USR2</th><td>don’t start to process any new jobs</td></tr>
  <tr><th>CONT</th><td>process new jobs again after a USR2</td></tr>
</table>

!SLIDE transition=scrollLeft
# Unicorn
<table>
  <tr><th>HUP</th><td>reloads config and restart workers</td></tr>
  <tr><th>INT, TERM</th><td>quick shutdown, kills all workers</td></tr>
  <tr><th>QUIT</th><td>graceful shutdown master</td></tr>
  <tr><th>USR1</th><td>reopen all logs</td></tr>
  <tr><th>USR2</th><td>reexecute the running binary</td></tr>
  <tr><th>WINCH</th><td>gracefully stops workers</td></tr>
  <tr><th>TTIN</th><td>increment number of workers by one</td></tr>
  <tr><th>TTOU</th><td>decrement number of workers by one</td></tr>
</table>

!SLIDE commandline incremental transition=scrollLeft
# `trap :PIPE, :EXIT`
    $ ruby -e '$stdout.sync = true; loop { puts "."; sleep 1 }' | head -3
    .
    .
    .
    -e:1:in `write': Broken pipe - <STDOUT> (Errno::EPIPE)
      from -e:1:in `puts'
      from -e:1:in `puts'
      from -e:1:in `block in <main>'
      from -e:1:in `loop'
      from -e:1:in `<main>'

    $ ruby -e '…; trap(:PIPE, :EXIT); loop { puts "."; sleep 1 }' | head -3
    .
    .
    .

    $ # next command
