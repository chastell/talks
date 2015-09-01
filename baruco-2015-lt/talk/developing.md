## s-expressions

```Ruby
class Conference
  def snake_cased?(strictly = true)
    if strictly
      @name.match(/\A([A-Z][a-z])+\z/) unless @name.nil?
    else
      @name.match(/\A([A-Z][a-z]+)+\z/) unless @name.nil?
    end
  end
end
```


```
(class
  (const nil :Conference) nil
  (def :snake_cased?
    (args
      (optarg :strictly
        (true)))
    (if
      (lvar :strictly)
      (if
        (send
          (ivar :@name) :nil?) nil
        (send
          (ivar :@name) :match
          (regexp
            (str "\\A([A-Z][a-z])+\\z")
            (regopt))))
      (if
        (send
          (ivar :@name) :nil?) nil
        (send
          (ivar :@name) :match
          (regexp
            (str "\\A([A-Z][a-z]+)+\\z")
            (regopt)))))))
```


### (One thing I won’t mention<br />is the profusion of parentheses<br />(which annoy some people).<br />(What the world needs (I think)<br />is not (a Lisp (with fewer parentheses))<br />but (an English (with more.))))<br /><br />— Brian Hayes, [_The Semicolon Wars_](http://www.americanscientist.org/issues/id.3489,y.0,no.,content.true,page.1,css.print/issue.aspx)
<!-- .element: class="quote" -->


[![stacktrace](img/stacktrace.png)](https://twitter.com/therealadam/status/13338687140003841)
