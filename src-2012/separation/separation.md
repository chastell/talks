!SLIDE bullets incremental transition=scrollLeft
# ← models | persistence →
* <div class='quote synced'>When I open up a Rails project and the models dir is full of 100% ActiveRecord classes I shudder. Model ≠ Persistence.<br />— Ben Mabey</div>
* <div class='quote synced'>We need something better. Persistance and logic are two separate responsibilities that every Rails app combines.<br />— Steve Klabnik</div>

!SLIDE bullets incremental
# ← models ! persistence →
* backend independence!
* no shortcuts! explicit shortcuts!
* easier modelling!
* future-proof(er) design!

!SLIDE bullets incremental
# ← models ! persistence →
* cleaner, simpler tests!
* **faster** tests!
* separate persistence driver testing!
* Rails is not your app – don’t unit-test it!

!SLIDE bullets incremental
# ← models ? persistence →
* performance?
* (perceived?) compexity?
* YAGNI?
* Just Use [NullDB](https://github.com/nulldb/nulldb)™?

!SLIDE bullets incremental transition=scrollLeft
# it’s object-oriented
* <div class='quote'>The biggest reason—scratch that, the _only_ reason—is to make our apps easier to change. The only constant in life is change, and that goes double for software projects. […] Rails is reaching a point at the time of writing where a lot of projects are starting to mature, and a lot of developers are realizing their projects aren’t nearly as easy to modify as they used to be.   — Avdi Grimm, _[Objects on Rails](http://objectsonrails.com)_</div>

!SLIDE bullets
# it’s object-oriented
* <div class='quote'>Attempts to predict _which_ parts of a codebase will need to change, and to structure it accordingly, have ended badly more often than not. Part of the nature of change is that you often don’t know beforehand _what_ is going to need change. […] Much like premature optimization, premature change management usually misses the mark.<br />— Avdi Grimm, _[Objects on Rails](http://objectsonrails.com)_</div>

!SLIDE center transition=scrollRight
![change](change.jpg)
[(Very Gradual) Change We Can Believe In](http://ncse.com/rncse/29/6/very-gradual-change-we-can-believe)

!SLIDE bullets incremental transition=scrollLeft
# please mister how do I do it
* move logic out of data objects
* decorators
* composition
* AOP: aspect-oriented programming
* DCI: data + context + interaction
