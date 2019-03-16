![tryftong](img/tryftong.png)


![Micky](img/micky.png)
<!-- .element: style="width: 50%" -->


* tekst<br />(ciągły)
* ↓
<!-- .element: class="fragment" -->
* zdania<br />(pełne)
<!-- .element: class="fragment" -->
* ↓
<!-- .element: class="fragment" -->
* 13 sylab<br />(średniówka?)
<!-- .element: class="fragment" -->
* ↓
<!-- .element: class="fragment" -->
* rymy<br />(częstochowskie?)
<!-- .element: class="fragment" -->


<p class="quote">
  Wiesz, co mi się teraz zda, Wacławie cnotliwy?<br />
  Płyń do swojej Elektry, gdy chcesz być szczęśliwy!<br />
  Straciłam się; szatańska ręka mnie zawiodła.<br />
  Upamiętaj się, bracie; do czego ta jodła?
</p>

<p class="fragment quote">
  (_Do Wacława Ostroroga_,
  _Podróż_,
  _Balladyna_,
  _Dziady_)
</p>


# tekst

![wolne](img/wolne.png)
<!-- .element: class="fragment" -->


# zdania

![srx-polish](img/srx-polish.png)
<!-- .element: class="fragment" style="width: 50%" -->


<p class="quote">
  Łowić myszy — pan rzecze — przysługi to znaczne.<br />
  Wokulskiemu wydało się to wprost niesmaczne.<br />
  I głową potrząsając patrzał na jezioro.<br />
  Prowadź mnie… już bez ciebie w tym wieku niesporo.
<p>

<p class="fragment quote">
  (_Pan i kotka_, _Lalka_, _Stara baśń_,<br />_Wspomnienia niebieskiego mundurka_)
</p>


# sylaby

![pan](img/pan.jpg)
<!-- .element: class="fragment" style="width: 30%" -->


```ruby
NonEIVovel = /a|ä|à|ą|æ|ë|é|ę|o|ö|ó|ô|u|ü|y/

SyllableVowel = Regexp.union [
  /ae(?=q|re)/, /ae$/,
  /(?<=et)a(?=i)/, /(?<=t)ai(?=n)/,
  /(?<!^[nz])au(?!cz|ł|k)/, /(?<=k)au(?=cz|k)/,
  /(?<!el|ni)eau/,
  /e(?=usz)/, /^e(?=unu)/, /(?<=f|z)e(?=um)/, /(?<=n)e(?=utr)/,
  /(?<=ni)e(?=u)/, /e(?=ucz)/, /(?<=s)e(?=ul)/, /eu/,
  /ey/, /e/,
  /(?<=^m)ię$/,
  /(?<=^m)i(?=(#{NonEIVovel}|e|i)$)/,
  /ii$/, /ille/,
  /i(?!e(?!nt)|#{NonEIVovel})/,
  /foi$/,
  /(?<=n)ou(?=v)/, /(?<=v)ou(?=s)/,
  /oyce$/, /oy/,
  /(?<=q)uo/,
  /uille/,
  /qui(?!lle)/,
  NonEIVovel,
]
```


# rymy

* ostatnia sylaba<br />taka sama
<!-- .element: class="fragment" -->
* przedostatnia samogłoska<br />taka sama
<!-- .element: class="fragment" -->
* ostatnie słowo<br />różne (i nie tylko)
<!-- .element: class="fragment" -->


```ruby
def rhyme_pattern
  all = words.join
  all[all.rindex(SyllableVowel, all.rindex(SyllableVowel) - 1)..-1]
end

def rhymes_with?(other)
  return false if rhyme_pattern != other.rhyme_pattern
  return false if words.last == other.words.last
  return false if words.last.end_with?(other.words.last)
  return false if other.words.last.end_with?(words.last)
  true
end
```


<p class="quote">
  Czyliż by inne zamiary powzięto?<br />
  Czy waść uwierzy, za co ich porżnięto?…<br />
  Pomiędzy niemi główeczka anielska,<br />
  Czy chińska miała być albo angielska?
</p>

<p class="fragment quote">
  (_Świętoszek_, _Potop_, _Beniowski_, _Hekuba_)
</p>


# Railsberry

[![julek-i-micky](img/julek-i-micky.png)](https://julek-i-micky.herokuapp.com)
<!-- .element: class="fragment" -->
