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
Ruby 2.4:
           rust_push:   172442.3 i/s
                 cgi:   135027.6 i/s - 1.28x  slower
                gsub:    13083.3 i/s - 13.18x  slower
            rust_map:     8884.4 i/s - 19.41x  slower
           each_char:     4417.7 i/s - 39.03x  slower
```

```nohighlight

JRuby 9.1:
                 cgi:   115620.6 i/s
                gsub:    16650.9 i/s - 6.94x  slower
           each_char:     5561.7 i/s - 20.79x  slower
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
Crystal 0.23:
  io   67.4k ( 14.84µs) (± 1.32%)       fastest
gsub  61.11k ( 16.36µs) (± 2.65%)  1.10× slower
html   56.4k ( 17.73µs) (± 2.33%)  1.20× slower
```

```nohighlight

Ruby 2.4:
           rust_push:   172442.3 i/s
                 cgi:   135027.6 i/s - 1.28x  slower
                gsub:    13083.3 i/s - 13.18x  slower
            rust_map:     8884.4 i/s - 19.41x  slower
           each_char:     4417.7 i/s - 39.03x  slower
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
