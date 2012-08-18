!SLIDE commandline incremental transition=scrollLeft
# `ARGV` & `ARGF`
    $ cat confs.2012.1
    wroc_love.rb
    SRC

    $ cat confs.2012.2
    eurucamp
    Arrrrcamp
    RuPy

    $ ruby -e 'p ARGV' confs.2012.*
    ["confs.2012.1", "confs.2012.2"]

    $ ruby -e 'p ARGF.to_a' confs.2012.*
    ["wroc_love.rb\n", "SRC\n", "eurucamp\n", "Arrrrcamp\n", "RuPy\n"]

    $ ruby -e 'p ARGF.path; ARGF.skip; p ARGF.to_a' confs.2012.*
    "confs.2012.1"
    ["eurucamp\n", "Arrrrcamp\n", "RuPy\n"]

!SLIDE bullets incremental transition=scrollLeft
# streams
* output → `$stdout`
* errors → `$stderr`
* input ← `$stdin`
* `$stdout`   `$stderr`   `$stdin`
* ↑ variables ↑   vs   ↓ constants ↓
* `STDOUT`   `STDERR`   `STDIN`

!SLIDE bullets incremental transition=scrollLeft
# `FileUtils` & `tempfile`
* `FileUtils.mkdir_p '/tmp/foo/bar/baz'    `
* `FileUtils.rm_rf '/tmp/foo'              `
* `let(:file) { Tempfile.new 'foo' }       `<br />
  `# #<File:/tmp/foo20120818-21526-12fjarq>`<br />
  `# no need to remove afterwards          `
* `let(:path) { Dir.mktmpdir }             `<br />
  `# "/tmp/d20120818-21526-11xj17r"        `<br />
  `after      { FileUtils.rmtree path }    `

!SLIDE bullets incremental transition=scrollLeft
## XDG Base Directory Standard
* `~/.config/fantastic`
* `~/.cache/fantastic`
* `~/.local/shared/fantastic`
* `gem install xdg`
* `XDG['CONFIG']  # '/home/chastell/.config'     `<br />
  `XDG['CACHE']   # '/home/chastell/.cache'      `<br />
  `XDG['DATA']    # '/home/chastell/.local/share'`

!SLIDE bullets incremental transition=scrollLeft
# system calls
* `path = '/etc/passwd'                  `<br />
  `out  = system "cat #{path}"   # UNSAFE`
* `path = '/etc/passwd; rm -rf /etc'     `<br />
  `out  = system "cat #{path}"   # UNSAFE`
* `path = '/etc/passwd; rm -rf /etc'     `<br />
  `out  = system 'cat', path             `
* `path = '/etc/passwd; rm -rf /etc'     `<br />
  `out  = system *%W[cat #{path}]        `
