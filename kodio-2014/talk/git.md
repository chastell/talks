# Git

What you must understand is that Git is a sharp knife<br />and the handle
is also a knife,<br />and each side contains more knives, fractally.<br
/>— Brandon Hays <!-- .element: class="quote fragment" -->

Git gets easier once you get the basic idea<br />that branches are
homeomorphic endofunctors<br />mapping submanifolds of a Hilbert
space.<br />— Isaac Wolkerstorfer <!-- .element: class="quote fragment" -->


Want to make a Git repository behave strangely<br />every now
and then? Have a coworker that<br />creates a remote branch called
HEAD.<br />— Patrick Hüsler <!-- .element: class="quote" -->

<p class='fragment quote'>git checkout
-b noʎ_ʞɔnɟ<br />— William Morgan</p>

<p class='fragment quote'>I didn’t expect <code>git commit --amen</code>
to work,<br />but to quote Leonard Cohen, hallelujah.<br />— chromatic</p>

<p class='fragment quote'>Just discovered <code>git
rebase --interactive --autosquash</code>. Holy shit.
Will never again need to do any work.<br />— Tom Stuart</p>


<pre>
<span class='command'>$ git init</span>
<span class='fragment'>Initialized empty Git repository in /tmp/world_domination/.git/</span>
</pre>

<pre>
<span class='command fragment'>$ git commit --message 'git init' --allow-empty</span>
<span class='fragment'>[master (root-commit) a9e1e55] git init</span>
</pre>

<pre>
<span class='command fragment'>$ cat > README</span>
<span class='fragment'>README-driven development ftw!
^D</span>
</pre>

<pre>
<span class='command fragment'>$ git add README
$ git commit --message 'I think this is the beginning of a beautiful README'</span>
<span class='fragment'>[master cabba9e] I think this is the beginning of a beautiful README
1 file changed, 1 insertion(+)
create mode 100644 README</span>
</pre>


<pre>
<span class='command'>$ cat > plans.rb</span>
<span class='fragment'>puts 'Hello, world domination!'
^D</span>
</pre>

<pre>
<span class='command fragment'>$ git add plans.rb
$ git commit --message 'first working code!'</span>
<span class='fragment'>[master c0def00] first working code!
1 file changed, 1 insertion(+)
create mode 100644 plans.rb</span>
</pre>

<pre>
<span class='command fragment'>$ git log --oneline --decorate</span>
<span class='fragment'>c0def00 (HEAD, master) first working code!
cabba9e I think this is the beginning of a beautiful README
a9e1e55 git init</span>
</pre>

<pre>
<span class='command fragment'>$ tr a-z A-Z < README</span> <span class='command fragment'>| sponge README</span>
<span class='fragment'><span class='command'>$ cat README</span>
README-DRIVEN DEVELOPMENT FTW!</span>
</pre>

<pre>
<span class='command fragment'>$ git add README
$ git commit --message 'fixup! cabba9e'</span>
<span class='fragment'>[master 5eaf00d] fixup! cabba9e
1 file changed, 1 insertion(+), 1 deletion(-)</span>
</pre>


<pre>
<span class='command'>$ git log --decorate --oneline</span>
<span class='fragment'>5eaf00d (HEAD, master) fixup! cabba9e
c0def00 first working code!
cabba9e I think this is the beginning of a beautiful README
a9e1e55 git init</span>
</pre>

<pre>
<span class='command fragment'>$ git rebase --interactive --autosquash cabba9e^</span>
<span class='fragment'>pick cabba9e I think this is the beginning of a beautiful README
fixup 5eaf00d fixup! cabba9ea1fa1fabaff1edba99a9eba11ad5faded
pick c0def00 first working code!</span>
</pre>

<pre>
<span class='fragment'>[detached HEAD badf00d] I think this is the beginning of a beautiful README
1 file changed, 1 insertion(+)
create mode 100644 README
Successfully rebased and updated refs/heads/master.</span>
</pre>

<pre>
<span class='command fragment'>$ git log --oneline --decorate</span>
<span class='fragment'>bea91e5 (HEAD, master) first working code!
badf00d I think this is the beginning of a beautiful README
a9e1e55 git init</span>
</pre>


<pre>
<span class='command'>$ cat > .ruby-version</span>
<span class='fragment'>2.0
^D</span>
</pre>

<pre>
<span class='command fragment'>$ git add .ruby-version
$ git commit --message 'we’re getting serious now'</span>
<span class='fragment'>[master c0ffee5] we’re getting serious now
1 file changed, 1 insertion(+)
create mode 100644 .ruby-version</span>
</pre>

<pre>
<span class='command fragment'>$ cat > .ruby-version</span>
<span class='fragment'>2.1
^D</span>
</pre>

<pre>
<span class='command fragment'>$ git status --short --branch</span>
<span class='fragment'>## master
 M .ruby-version</span>
</pre>

<pre>
<span class='command fragment'>$ git update-index --assume-unchanged .ruby-version</span>
<span class='command fragment'>$ git status --short --branch</span>
<span class='fragment'>## master</span>
</pre>


<pre>
<span class='command'>$ git checkout -b pinky</span>
<span class='fragment'>Switched to a new branch 'pinky'</span>
</pre>

<pre>
<span class='command fragment'>$ cat > plans.rb</span>
<span class='fragment'>if ENV['USER'] == 'brain'
  puts 'Hello, world domination!'
else
  puts 'Nice try. You must be Pinky.'
end
^D</span>
</pre>

<pre>
<span class='command fragment'>$ git diff</span>
<span class='fragment'>diff --git a/plans.rb b/plans.rb
index beefbad..feedba9 100644
--- a/plans.rb
+++ b/plans.rb
@@ -1 +1,5 @@
-puts 'Hello, world domination!'
+if ENV['USER'] == 'brain'
+  puts 'Hello, world domination!'
+else
+  puts 'Nice try. You must be Pinky.'
+end</span>
</pre>


<pre>
<span class='command'>$ git diff --ignore-all-space</span>
<span class='fragment'>diff --git a/plans.rb b/plans.rb
index beefbad..feedba9 100644
--- a/plans.rb
+++ b/plans.rb
@@ -1 +1,5 @@
+if ENV['USER'] == 'brain'
  puts 'Hello, world domination!'
+else
+  puts 'Nice try. You must be Pinky.'
+end</span>
</pre>

<pre>
<span class='command fragment'>$ git add plans.rb
$ git commit --message 'Pinky-proofing'</span>
<span class='fragment'>[pinky defaced] Pinky-proofing
1 file changed, 5 insertions(+), 1 deletion(-)</span>
</pre>

<pre>
<span class='command fragment'>$ git checkout -</span>
<span class='fragment'>Switched to branch 'master'</span>
</pre>

<pre>
<span class='command fragment'>$ git checkout -</span>
<span class='fragment'>Switched to branch 'pinky'</span>
</pre>


# Git

* `git commit --allow-empty` <!-- .element: class="fragment" -->

* `git rebase -i --autosquash` <!-- .element: class="fragment" -->

* `git update-index --assume-unchanged` <!-- .element: class="fragment" -->

* `git diff -w` <!-- .element: class="fragment" -->

* `git checkout -` <!-- .element: class="fragment" -->

* `git add|checkout|stash -p` <!-- .element: class="fragment" -->
