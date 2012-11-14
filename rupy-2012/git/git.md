!SLIDE bullets incremental transition=scrollLeft
# Git
* <div class='quote'>Git gets easier once you get the basic idea<br />that branches are homeomorphic endofunctors<br />mapping submanifolds of a Hilbert space.<br />— Isaac Wolkerstorfer</div>

!SLIDE bullets incremental
* <div class='quote'>Want to make a Git repository behave strangely every now and then? Have a coworker that creates a remote branch called HEAD.<br />— Patrick Hüsler</div>
* <div class='quote'>`git checkout -b noʎ_ʞɔnɟ`<br />— William Morgan</div>
* <div class='quote'>`git svn rebase` and `git svn dcommit`<br />– that’s all I want to know about Subversion.<br />— Michael Dvorkin</div>
* <div class='quote'>Just discovered `git rebase --interactive --autosquash`.<br />Holy shit. Will never again need to do any work.<br />— Tom Stuart</div>

!SLIDE commandline incremental
    $ git init
    Initialized empty Git repository in /tmp/world_domination/.git/

    $ git commit --message 'git init' --allow-empty
    [master (root-commit) a9e1e55] git init

    $ cat > README
    README-driven development ftw!
    ^D

    $ git add README
    $ git commit --message 'I think this is the beginning of a beautiful README'
    [master cabba9e] I think this is the beginning of a beautiful README
    1 file changed, 1 insertion(+)
    create mode 100644 README

!SLIDE commandline incremental
    $ cat > plans.rb
    puts 'Hello, world domination!'
    ^D

    $ git add plans.rb
    $ git commit --message 'first working code!'
    [master c0def00] first working code!
    1 file changed, 1 insertion(+)
    create mode 100644 plans.rb

    $ git log --oneline --decorate
    c0def00 (HEAD, master) first working code!
    cabba9e I think this is the beginning of a beautiful README
    a9e1e55 git init

    $ tr a-z A-Z < README | sponge README
    $ cat README
    README-DRIVEN DEVELOPMENT FTW!

    $ git add README
    $ git commit --message 'fixup! cabba9e'
    [master 5eaf00d] fixup! cabba9e
    1 file changed, 1 insertion(+), 1 deletion(-)

!SLIDE commandline incremental
    $ git log --decorate --oneline
    5eaf00d (HEAD, master) fixup! cabba9e
    c0def00 first working code!
    cabba9e I think this is the beginning of a beautiful README
    a9e1e55 git init

    $ git rebase --interactive --autosquash cabba9e^
    pick cabba9e I think this is the beginning of a beautiful README
    fixup 5eaf00d fixup! cabba9ea1fa1fabaff1edba99a9eba11ad5faded
    pick c0def00 first working code!

    [detached HEAD badf00d] I think this is the beginning of a beautiful README
    1 file changed, 1 insertion(+)
    create mode 100644 README
    Successfully rebased and updated refs/heads/master.

    $ git log --oneline --decorate
    bea91e5 (HEAD, master) first working code!
    badf00d I think this is the beginning of a beautiful README
    a9e1e55 git init

!SLIDE commandline incremental
    $ cat > .rvmrc
    rvm use 1.9.3@world_domination
    ^D

    $ git add .rvmrc
    $ git commit --message 'we’re getting serious now'
    [master c0ffee5] we’re getting serious now
    1 file changed, 1 insertion(+)
    create mode 100644 .rvmrc

    $ cat >> .rvmrc
    bundle
    ^D

    $ git status --short --branch
    ​## master
    M .rvmrc

    $ git update-index --assume-unchanged .rvmrc
    $ git status --short --branch
    ​## master

!SLIDE commandline incremental
    $ git checkout -b pinky
    Switched to a new branch 'pinky'

    $ cat > plans.rb
    if ENV['USER'] == 'brain'
      puts 'Hello, world domination!'
    else
      puts 'Nice try. You must be Pinky.'
    end
    ^D

    $ git diff
    diff --git a/plans.rb b/plans.rb
    index beefbad..feedba9 100644
    --- a/plans.rb
    +++ b/plans.rb
    @@ -1 +1,5 @@
    -puts 'Hello, world domination!'
    +if ENV['USER'] == 'brain'
    +  puts 'Hello, world domination!'
    +else
    +  puts 'Nice try. You must be Pinky.'
    +end

!SLIDE commandline incremental
    $ git diff --ignore-all-space
    diff --git a/plans.rb b/plans.rb
    index beefbad..feedba9 100644
    --- a/plans.rb
    +++ b/plans.rb
    @@ -1 +1,5 @@
    +if ENV['USER'] == 'brain'
      puts 'Hello, world domination!'
    +else
    +  puts 'Nice try. You must be Pinky.'
    +end

    $ git add plans.rb
    $ git commit --message 'Pinky-proofing'
    [pinky defaced] Pinky-proofing
    1 file changed, 5 insertions(+), 1 deletion(-)

    $ git checkout -
    Switched to branch 'master'

    $ git checkout -
    Switched to branch 'pinky'

!SLIDE bullets incremental small
# Git
* `git commit --allow-empty`
* `git rebase -i --autosquash`
* `git update-index --assume-unchanged`
* `git diff -w`
* `git checkout -`
* `git add|checkout|stash -p`
