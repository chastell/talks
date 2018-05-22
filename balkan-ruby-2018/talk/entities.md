# boundary crossing

* not passing anything
<!-- .element: class="fragment" -->
* booleans
<!-- .element: class="fragment" -->
* <span class="fragment">numbers (> 2⁶²? `BigDecimal`s?)</span>
* strings (longer than 23 bytes?)
<!-- .element: class="fragment" -->
* <span class="fragment">arrays (…of what? containing `self`?)</span>
* <span class="fragment">hashes (…of what → what? with `self` key?)</span>
* structs | objects
<!-- .element: class="fragment" -->


# escape entities

* make text ‘HTML safe’
<!-- .element: class="fragment" -->
* <code class="fragment">&lt; → &amp;lt;&nbsp;&nbsp;<br />&gt; → &amp;gt;&nbsp;&nbsp;<br />&amp; → &amp;amp;&nbsp;<br />&apos; → &amp;apos;<br />&quot; → &amp;quot;</code>


```ruby
class String
```

```ruby
  ENTITIES = { '<' => '&lt;', '>' => '&gt;', '&' => '&amp;',
               "'" => '&apos;', '"' => '&quot;' }

  def escape_each_char
    ''.tap do |result|
      each_char { |char| result << ENTITIES.fetch(char, char) }
    end
  end
```

```ruby
  def escape_gsub
    gsub(/[<>&'"]/, ENTITIES)
  end
```
<!-- .element: class="fragment" -->

```ruby
  def escape_cgi
    CGI.escape_html(self)
  end
```
<!-- .element: class="fragment" -->

```ruby
end
```


## zero-cost abstractions… 😉

```rust
#[macro_use]
extern crate helix;

ruby! {
    class HTML {
        def map_escape(input: String) -> String {
            input.chars().map(|chr| {
                match chr {
                    '<'  => String::from("&lt;"),
                    '>'  => String::from("&gt;"),
                    '&'  => String::from("&amp;"),
                    '\'' => String::from("&apos;"),
                    '"'  => String::from("&quot;"),
                    _    => chr.to_string(),
                }
            }).collect()
        }
    }
}
```


```rust
#[macro_use]
extern crate helix;

ruby! {
    class HTML {
        def push_escape(input: String) -> String {
            let mut result = String::with_capacity(2 * input.len());
            for chr in input.chars() {
                match chr {
                    '<'  => result.push_str("&lt;"),
                    '>'  => result.push_str("&gt;"),
                    '&'  => result.push_str("&amp;"),
                    '\'' => result.push_str("&apos;"),
                    '"'  => result.push_str("&quot;"),
                    _    => result.push(chr),
                }
            }
            result
        }
    }
}
```


```nohighlight
Ruby 2.5:
           rust_push:   286450.1 i/s
                 cgi:   128455.5 i/s - 2.23x  slower
                gsub:    13743.6 i/s - 20.84x  slower
            rust_map:     7878.5 i/s - 36.36x  slower
           each_char:     4540.9 i/s - 63.08x  slower
```

```nohighlight

JRuby 9.1:
                 cgi:   122654.7 i/s
                gsub:    18363.9 i/s - 6.68x  slower
           each_char:     5596.8 i/s - 21.92x  slower
```
<!-- .element: class="fragment" -->

```nohighlight

JRuby 9.1 + 30 s warm-up + invoke dynamic:
                 cgi:   121956.6 i/s
                gsub:    17826.9 i/s - 6.84x  slower
           each_char:     6063.1 i/s - 20.11x  slower
```
<!-- .element: class="fragment" -->


## meanwhile in Crystal…

```crystal
class String
```

```crystal
  ENTITIES = { '<' => "&lt;", '>' => "&gt;", '&' => "&amp;",
               '\'' => "&apos;", '"' => "&quot;" }

  def escape_gsub
    gsub(ENTITIES)
  end
```

```crystal
  def escape_html
    HTML.escape(self)
  end
```
<!-- .element: class="fragment" -->

```crystal
  def escape_io
    io = IO::Memory.new
    HTML.escape(self, io)
    io.to_s
  end
```
<!-- .element: class="fragment" -->

```crystal
end
```


```nohighlight
Crystal 0.23 (2017):
  io  67.56k (  14.8µs) (± 1.38%)       fastest
gsub  60.62k (  16.5µs) (± 2.13%)  1.11× slower
html  57.82k ( 17.29µs) (± 1.58%)  1.17× slower
```

```nohighlight

Crystal 0.24 (2018):
  io  35.84k (  27.9µs) (± 2.84%)  1.18× slower
gsub  42.28k ( 23.65µs) (± 1.05%)  1.00× slower
html  42.36k ( 23.61µs) (± 1.34%)       fastest
```
<!-- .element: class="fragment" -->

```nohighlight

Ruby 2.4:
           rust_push:   172999.1 i/s
                 cgi:   134036.8 i/s - 1.29x  slower
                gsub:    13141.5 i/s - 13.16x  slower
            rust_map:     9163.8 i/s - 18.88x  slower
           each_char:     4440.7 i/s - 38.96x  slower
```
<!-- .element: class="fragment" -->

* <span class="fragment">for sub-µs times: [Optimising string processing in Rust](https://lise-henry.github.io/articles/optimising_strings.html)</span>


## how does Crystal `HTML.escape`?

```crystal
module HTML
```

```crystal
  SUBSTITUTIONS = {
    # …many more than in ENTITIES…
  }
```

```crystal
  def self.escape(string : String) : String
    string.gsub(SUBSTITUTIONS)
  end
```
<!-- .element: class="fragment" -->

```crystal
  def self.escape(string : String, io : IO)
    string.each_char do |char|
      io << SUBSTITUTIONS.fetch(char, char)
    end
  end
```
<!-- .element: class="fragment" -->

```crystal
end
```


[![einstein](img/einstein.png)](https://twitter.com/mustlovedongs/status/867854830106234880)
