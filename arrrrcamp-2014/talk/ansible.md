## Ansible

```no-highlight
$ ansible-playbook asterix.yml 

PLAY [asterix] **************************************************************** 

GATHERING FACTS *************************************************************** 
ok: [asterix]

TASK: [refresh package cache] ************************************************* 
ok: [asterix]

TASK: [upgrade packages] ****************************************************** 
ok: [asterix]

TASK: [install base packages] ************************************************* 
ok: [asterix] => (item=build-essential,discus,gdb,htop,mc,ncdu,nmap,tree)

TASK: [install wakeonlan] ***************************************************** 
ok: [asterix]

PLAY RECAP ******************************************************************** 
asterix                    : ok=5    changed=0    unreachable=0    failed=0   

```


## Ansible + cowsay

```no-highlight
$ ansible-playbook asterix.yml 
 ________________
< PLAY [asterix] >
 ----------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

 _________________
< GATHERING FACTS >
 -----------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

ok: [asterix]

…
```


## Ansible + cowsay + `ANSIBLE_COW_SELECTION=random`

```no-highlight
$ ansible-playbook asterix.yml 
 ________________
< PLAY [asterix] >
 ----------------
        \    ,-^-.
         \   !oYo!
          \ /./=\.\______
               ##        )\/\
                ||-----w||
                ||      ||

               Cowth Vader

 _________________
< GATHERING FACTS >
 -----------------
        \    ,-^-.
         \   !oYo!
          \ /./=\.\______
               ##        )\/\
                ||-----w||
                ||      ||

               Cowth Vader

ok: [asterix]

…
```


## cowsay

```no-highlight
$ cowsay 'Internet of things that should not be.'   # cms the chaos wizard
 ________________________________________
< Internet of things that should not be. >
 ----------------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
```

```no-highlight
$ cowsay -f bunny '<div id="class" class="id" />'   # ʇlɐɟɟ ‮tlaff.‮
 _______________________________
< <div id="class" class="id" /> >
 -------------------------------
  \
   \   \
        \ /\
        ( )
      .( o ).
```
<!-- .element: class="fragment" -->
