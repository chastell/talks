#[macro_use]
extern crate helix;

ruby! {
    class Popcount {
        def count(int: u64) -> u32 {
            int.count_ones()
        }
    }

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
