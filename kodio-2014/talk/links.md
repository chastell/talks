# world domination plans

<ul>
  <li class='fragment'>`alias computer,='sudo'`</li>
  <li class='fragment'>`computer, apt-get install postgresql`</li>
  <li class='fragment'>[Git tips from the trenches](https://ochronus.com/git-tips-from-the-trenches/)</li>
  <li class='fragment'>[Five Things You Didn’t Know<br />About PostgreSQL](http://vimeo.com/43536445)</li>
  <li class='fragment'>[PostgreSQL awesomeness for Rails developers](http://www.amberbit.com/blog/2014/2/4/postgresql-awesomeness-for-rails-developers/)</li>
  <li class='fragment'>[Today I Learned](http://justincampbell.me/til) + [@CLIMagic](https://twitter.com/CLIMagic)</li>
  <li class='fragment'>`man $(ls /bin /usr/bin | shuf -n 1)`</li>
</ul>


<pre>
<span class='command'>$ alias such=git
$ alias very=git
$ alias wow='git status --branch --short'</span>
</pre>

<pre>
<span class='command fragment'>$ wow</span>
<span class='fragment'>## master
M  plans.rb</span>
</pre>

<pre>
<span class='command fragment'>$ such commit</span>
<span class='fragment'>…
[master b1acadd] Baldrick, you wouldn’t see a subtle plan if it painted itself purple
and danced naked on top of a harpsichord, singing ‘subtle plans are here again!’
 1 file changed, 1 insertion(+), 5 deletions(-)</span>
</pre>

<pre>
<span class='command fragment'>$ very push</span>
<span class='fragment'>Counting objects: 11, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (3/3), done.
Writing objects: 100% (6/6), 566 bytes | 0 bytes/s, done.
Total 6 (delta 2), reused 0 (delta 0)
To git@github.com:blackadder/plans.git
   a9e1e55..b1acadd  master -> master
                                       # via Chris Martin</span>
</pre>



![chastell](img/chastell.png)

# thanks!

* [@chastell](http://chastell.net)
* [talks.chastell.net](http://talks.chastell.net)
