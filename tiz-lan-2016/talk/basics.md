# definicja i&nbsp;rys historyczny

Note: krótkie omówienie planu wykładów


## sieć lokalna

> Sieć lokalna (local area network, LAN) to sieć komputerowa
> łącząca komputery na niewielkim obszarze – takim jak dom,
> szkoła, laboratorium czy biuro – za pomocą mediów sieciowych.
>
> — Gary A. Donahue, _Network Warrior_

Note:

Pojęcie sieci lokalnej (LAN, z ang. _local area network_) jest jednym
z pojęć bez bardzo ścisłej definicji, a jego znaczenie zmieniało się
w czasie. Książka Gary’ego A. Donahue _Network Warrior_ opisująca
zarządzanie sieciami i będąca klasyką swego gatunku definiuje
sieć lokalną w kontekście obszaru i dowolnych mediów sieciowych.

W dzisiejszych czasach sieć lokalna może łączyć z innymi zarówno
komputer biurkowy na uczelni/w biurze/w domu, ale też np.
laptop wpięty do WiFi w kawiarni czy do stworzonego na
telefonie podczas jazdy pociągiem lokalnego hotspota.


## początki

* 1970: Octopus (Lawrence Berkeley National Laboratory)
* 1971: ALOHAnet (Uniwersytet Hawajski)
* 1974: Cambridge Ring (Uniwersytet Cambridge)
* 1976: Ethernet (Palo Alto Research Center)
* 1977: ARCNET (Chase Manhattan Bank, Nowy Jork)
* 1980: model OSI

Note:

Pierwsze sieci lokalne powstawały w późnych latach 50. XX wieku –
były to głównie sieci wojskowe. W 1960 powstał pierwszy sieciowy
system rezerwacji samolotów, w 1962 w Pentagonie powstał
pomysł Intergalactic Computer Network, a w 1969 powstała
sieć ARPANET, która jako pierwsza wykorzystywała stos TCP/IP.

Z czasem powstawały kolejne istotne (z historycznego punktu widzenia)
sieci. Octopus jako pierwsza próbowała rozwiązać problemy związane
z rozrostem sieci i potrzebą szybkich połączeń lokalnych. ALOHAnet była
pierwszą siecią bezprzewodową i pierwszą siecią ze współdzielonym medium
(ARPANET miała topologię host-host). Cambridge Ring była (nigdy nie
uruchomioną) lokalną siecią eksperymentalną o topologii pierścienia.

W latach 1973-4 w Palo Alto rozpoczęła się budowa Ethernetu,
a w 1976 Robert Metcalfe i David Boggs opublikowali _Ethernet:
Distributed Packet-Switching for Local Computer Networks_
– fundamentalny artykuł opisujący jej działanie.

Z istotnych kamieni milowych warto wspomnieć też
o sieci ARCNET, wspierającej automatykę biurową
i jako pierwszej nie zakładającej typu komputerów.

Warto też zauważyć, że powszechnie dziś znany model OSI
(Open Systems Interconnection) – modelujący warstwy sieci
komunikujące się ze sobą i traktujące warstwy niższe
jako nieprzezroczyste – powstał dopiero w roku 1980.


### zmiany mocy obliczeniowej<br />i&nbsp;położenia danych

centralizacja mocy obliczeniowej<br />centralizacja danych

↓

rozproszenie mocy obliczeniowej<br />rozproszenie danych

↓

rozproszenie mocy obliczeniowej<br />centralizacja danych

↓

systemy mobilne vs komputery stacjonarne<br />centralizacja danych/usług vs self-hosting

Note:

Z czasem sposób wykorzystania komputerów (i, co za tym idzie, sieci
lokalnych) ulegał zmianom. Początkowo wielkie (gabarytowo) komputery
przechowywały dane w lokalnej pamięci i na dyskach; następnie
powszechne stały się komputery biur(k)owe i dane przechowywane w plikach
przenoszonych na dyskietkach (później: napędach USB) lub współdzielonych
na lokalnych udziałach sieciowych. Z czasem spora część tych komputerów
została wyparta przez laptopy i smartfony korzystające z usług
sieciowych udostępnianych przez strony trzecie (np. Gmail czy usługi
wykorzystujące Amazon AWS), a aktualnie coraz popularniejsze są
systemy mobilne w których istotna jest dbałość o dane (prywatne VPN-y,
korzystanie z prywantych rozwiązań typu BTSync zamiast niezależnych
usług typu Dropbox, idea [_unhosted web apps_](https://unhosted.org)).


## zmiany ruchu

mała szybkość<br />ruch w impulsach<br />wspólne medium

↓

duża szybkość<br />ruch ciągły o różnym natężeniu<br />medium indywidualne

Note:

Podobnie do zmian wykorzystywania komputerów zmieniało się
wykorzystywanie sieci oraz przepływający w niej ruch. Jeszcze
kilka-kilkanaście lat temu sieć lokalna w dużej mierze
służyła do wysyłania i odbierania poczty czy przeglądania
„klasycznych” stron WWW i była wspólna dla całego biura.

W dzisiejszych czasach sieć lokalna służy często do streamingu
multimediów, rozmów głosowych, gier on-line (w tym MMORPG).
Komputery domowe często podłączane są do modemów/routerów/AP,
a w biurach do mostków i switchy, by lepiej sterować ruchem
i indywidualizować medium na potrzeby poszczególnych urządzeń.
