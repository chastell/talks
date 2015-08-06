## s-expressions

```Ruby
class RUG
  def valid_module_name?(namespaced = true)
    unless namespaced
      @name.match(/\A[A-Z]\p{Letter}*\z/) unless @name.nil?
    else
      @name.match(/\A((::)?[A-Z]\p{Letter}*)+\z/) unless @name.nil?
    end
  end
end
```


```
(class
  (const nil :RUG) nil
  (def :valid_module_name?
    (args
      (optarg :namespaced
        (true)))
    (if
      (lvar :namespaced)
      (if
        (send
          (ivar :@name) :nil?) nil
        (send
          (ivar :@name) :match
          (regexp
            (str "A((::)?[A-Z]p{Letter}*)+z")
            (regopt))))
      (if
        (send
          (ivar :@name) :nil?) nil
        (send
          (ivar :@name) :match
          (regexp
            (str "A[A-Z]p{Letter}*z")
            (regopt)))))))
```


### (One thing I won’t mention<br />is the profusion of parentheses<br />(which annoy some people).<br />(What the world needs (I think)<br />is not (a Lisp (with fewer parentheses))<br />but (an English (with more.))))<br /><br />— Brian Hayes, [_The Semicolon Wars_](http://www.americanscientist.org/issues/id.3489,y.0,no.,content.true,page.1,css.print/issue.aspx)
<!-- .element: class="quote" -->


[![stacktrace](img/stacktrace.png)](https://twitter.com/therealadam/status/13338687140003841)
