# współczesne<br />problemy<br />sieci


## brak adresów IPv4

<img src='img/map_of_the_internet.jpg' style='width: 40%' />

[xkcd: Map of the Internet](http://xkcd.com/195/)


## brak adresów IPv4

<img src='img/ipv4.svg' style='width: 60%' />

[IPv4 address exhaustion](http://en.wikipedia.org/wiki/IPv4_address_exhaustion)

NAT? IPv6?

Note:

IPv4: adresy 32-bitowe (4,3×10⁹: 4 miliardy)

IPv6: adresy 128-bitowe (3,4×10³⁸: 340 sekstylionów)

IANA: Internet Assigned Numbers Authority

NIC: Network Information Centre

RIR: Regional Internet Registry: AfriNIC, APNIC
(Asia-Pacific), ARIN (American Registry for Internet
Numbers), LACNIC (Latin America and Caribbean), RIPENIC
(Réseaux IP Européens – Europa, Rosja, Bliski Wschód)

ipcalc 10.22.18.16/28

prywatne: 10.0.0.0-10.255.255.255 (10.0.0.0/8, 1×A, 16 777 216),
172.16.0.0-172.31.255.255 (172.16.0.0/12, 16×B, 1 048 576),
192.168.0.0-192.168.255.255 (192.168.0.0/16, 256×C, 65 536)


## szybkość i opóźnienia

* szybkość przestaje być problemem,<br />wąskim gardłem zaczyna być opóźnienie

* szybkość światła w światłowodzie:<br />56 ms RTT Londyn – Nowy Jork

* problem „ostatniej mili”

* FTTH: 18 ms, DSL: 43 ms,<br />4G: 150 ms, 3G: 400 ms

Note:

RTT: round-trip time, sygnał + potwierdzenie

47% of HTML resources are served without gzip or deflate

36% of CSS resources are served without gzip or deflate

26% of JS resources are served without gzip or deflate

In total, ~37% of resources are served as uncompressed


## sesje TCP a opóźnienia

* do zestawienia TCP potrzeba<br />SYN + SYN-ACK + ACK

* do przesłania danych wielopakietowych<br />musi urosnąć okno przeciążenia

* szersze okno startowe<br />utrzymywanie połączeń TCP

Note:

okno rośnie o tyle, ile potwierdzeń dostaliśmy (od początku),
czyli wykładniczo; gdy zgubimy pakiet, okno rośnie po jednym

początkowe okno: 1, 2 lub 4 pakiety; 2010: Google udowodniło,
że 10 to dobra liczba; 2011: kernel 2.6.38 podnosi do 10


### opóźnienia coraz istotniejsze

![latency](img/latency.png)

[High Performance Browser Networking](https://docs.google.com/presentation/d/1f2J_HrzMNvVHhsB3f7DKJFPl2N0Q_QR2ZEECWQu6oV8/present#slide=id.gc03305a_0132)

Note:

DNS!

załadowane są najpopularniejsze strony w Internecie


## prywatność

* ciasteczka

* odcisk przeglądarki: [Panopticlick](https://panopticlick.eff.org)

* śledzenie za pomocą HTTP ETag

* wycinanie zapytań z poziomu przeglądarki

* prywatność odwiedzających (widżety, statystyki, czcionki…)

&nbsp;

_OH: Let’s replace Alice & Bob with<br />Angela & Barack for our security examples._<br />— Benjamin Erb

<aside class='notes'>

<p>Ghostery</p>

<p>śledzenie / rozpoznawanie użytkowników na podstawie
ruchów myszki i sposobu pisania na klawiaturze</p>

<p>wysyłanie prywatnej fotki do drugiej
osoby: na zawsze zostanie w NSA</p>

<p>„nie mam nic do ukrycia”: ale oddajesz informacje
na temat innych; profilowanie na podstawie znajomych
(preferencje seksualne, wiarygodność kredytowa)</p>

<p>co i gdzie państwo robili dnia X o Y? bo my wiemy</p>

<p>każdy łamie dwa prawa dziennie; jeśli jest tego ślad, można
każdego wyłuskać (przekraczanie prędkości: grupa nam się nie
podoba, zabieramy im – i tylko im – prawa jazdy i nagle chodzą)</p>

<p>obsadzanie przycisku „Like” na stronie: prywatność innych osób</p>

<p>przechowywanie haseł</p>

<p>LinkedIn Intro</p>

<p>forward secrecy: jeśli dzisiejszy ruch zostanie nagrany,
a później klucze wykradzione, to nie będzie mógł odszyfrować
nagranego ruchu; Diffie-Hellman zamiast wymiany wspólnego
sekretu; Twitter wprowadził w poprzedni piątek</p>

<p>
slurm
mtr
iftop
ipcalc
telnet towel.blinkenlights.nl
</p>

</aside>
