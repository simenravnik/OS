
# Skripta pri predmetu OS

```
Avtor: Šimen Ravnik
Datum: June, 2019
```

## Odgovori na vprašanja


1. ***Kaj je OS?***
> OS je program, ki deluje kot posrednik med uporabnikom in strojno opremo. Pri tem skuša:
> - zagotoviti učinkovitost uporabe strojne opreme
> - ustvariti prijazno okolje

2. ***Kaj sestavlja računalniški sistem?***
> - uporabniki
> - uporabniški programi
> - strojna oprema
> - operacijski sistem

3. ***Lastnosti/Naloge OS***
> - dodeljuje vire programom skladno s potrebami in zmožnostmi
> - rešuje konfliktne situacije
> - optimizira uporabo računalniških virov
> - nadzira delo nekaterih virov
> - nadzira izvajanje upor. programov
> - olajšuje delo uporabniku
> - povečuje učinkovitost računalniškega sistema

4. ***Rezidentni monitor***

> Uporablja se za avtomatizacijo delovanja poslov. Ob koncu vsakega posla kliče naslednjega. Ob zagonu se sam naloži v pomnilnik ter ostane tam celi čas. Za delovanje potrebuje kontrolne kartice, zato tudi interpreter kartic, nalagalnik ter gonilnike za V/I naprave.

5. ***Prekrivanje operacij***

> Realizirano je bili z ločenim V/I ali pa preko spoolinga. Ločeni V/I se je pojavil, ko se je pojavil magnetni trak, saj je trak bil vmesni člen men V/I in CPU. Tako so lahko hkrati potekalo V/I in računske operacije. Problem je bil, ker je trak imel zaporedni dostop. Spooling se je pojavil z diskom, saj imajo ti neposredni dostop, zato se uporabljajo kot vmensi mediji za začasno hranjenje V/I podatkov. Spooling uporablja branje vnaprej in tako omogoči, da je na disko lahko hkrati pripravljenih več poslov.

6. ***Razloži spooling!***

> Spooling je branje vnaprej – s tem omogoči, da je na disku več pripravljenih poslov hkrati. Omogoča, da se disk lahko uporabi kot velik vmesnik za začasno hranjenje vhodno/izhodnih podatkov. Omogoča prekrivanje V/I operacij ter računskih operacij.

7. ***Multiprogramska paketna obdelava***

> Smisel je, da ko se posel ustavi, OS izbere novega. S tem se pojavijo zahteve po razvrščanju poslov, po upravljanju s pomnilnikom, po dodeljevanju procesorja (razvrščanju na procesorju) ter zaščiti.

8. ***Časovno dodeljevanje – večopravilni OS***

> Multiprogramski sistem paketne obdelave, ki uporablja še timer. Hkrati lahko dela več uporabnikov, vsak s svojim poslom, toda vsak posel se sme neprekinjeno izvajati omejen čas. OS izbere posel, mu dodeli čas za izvajanje in ga požene, če mine dodeljeni čas, ali pa se posel ustavi (končal, čaka na človeka) prevzame nadzor OS, ki izbere drug posel, mu dodeli čas, in ga požene. Pri tem se pojavijo zahteve po upravljanju z zunanjim pomnilnikom, navideznim pomnilnikom, zahteve po datotečnem sistemu, po zaščiti, po dodeljevanju procesorja ter po sinhronizaciji in komunikaciji.

9. ***Krmilnik***
> Nadzoruje ustrezno napravo ali več naprav.

10. ***Bootstrap***

> Majhen, enostaven program, ki inicializira računalniški sistem (registre CPE, pomnilnike, krmilnike...), naloži jedro OS v pomnilnik in mu nato preda nadzor.

11. ***Vrste prekinitev***
> - **Strojna**, sproži strojna oprema: Npr. naprava pošlje po vodilu prekinitveno zahtevo in z njo prekine tekoče delo na CPE, konec V/I operacije, neveljaven poseg v pomnilnik.
> - **Programska**, če jo sproži tekoči program: Npr. sistemski klic, s katerim tekoči program zahteva pomoč OS, past (trap), ker je CPE zaznala izjemno situacijo (deljenje z 0).

> **Ko se pojavi prekinitvena zahteva:**
CPE prekine tekoče delo, izvede prekinitveno servisni program (v nadaljevanju PSP), s katerim se odzove na dogodek, nato nadaljuje prekinjeno delo.

12. ***Polling – programsko izpraševanje***
> Ko se pojavi prekinitev, CPE prekine delo, zažene PSP ki ugotovi kdo je zahteval prekinitev, zažene ustrezni PSP in nato nadaljuje z delom.

13. ***Vektorsko prekinjanje***

> Ko naprava zahteva prekinitev, v CPE pošlje tudi indeks i, s pomočjo katerega nato CPE v prekinitvenem vektorju (tabeli v pomnilniku) poišče ustrezen PSP ter ga zažene.

14. ***Vhodno izhodni sistem***

> Sestavljen je iz V/I naprav, krmilnikov ter programov za V/I operacije. Krmilnik skrbi za podrobnosti pri prenosu podatkov – na njih se izvajajo V/I programi.

15. ***Sinhroni V/I***

> Proces, ki je zahteval V/I operacijo, čaka da se ta konča. Lahko izvede kako zanko, ukaz wait ali pa sam spremlja statusni register.

16. ***Asinhroni V/I***

> Proces, ki je zahteval V/I operacijo, nadaljuje svoje izvajanje. Če ne more nadaljevati dela, ker čaka na podatke, sam sebe blokira. Je primeren za počasne naprave.

17. ***DMA krnilnik***

> Se uporablja pri hitrih napravah za prenos med pomnilnikom in V/I napravami, brez posredovanja CPU. CPU pošlje ukaz in podatke gonilniku, gonilnik podatke zapiše v registre DMA krmilnika in se blokira. Ko DMA konča prenos pošlje prekinitveno zahtevo CPE.

18. ***Kje se uporablja tabela stanj naprav?***

> Uporablja se pri asinhronem V/I, kjer omogoča več vzporednih V/I operacij. Tabela vsebuje osnovne podatke o napravi in kazalec na tabelo V/I zahtev, kamor se vpisujejo vse zahteve za to napravo.

19. ***Elementi strojne zaščite***

> Sistemski način delovanja in uporabniški način delovanja
> - **V/I naprave**: V/I ukaze sme izvajati le OS, saj le ta pozna stanje V/I naprav (npr. preko tabele stanj naprav) V/I ukazi morajo zato biti priviligirani.
> - **Gl. pomnilnik**: Nastavimo spodnjo in zgornjo mejo trenutno dovoljenih naslovov. Pred dostopom do pom nilnika se vsak naslov strojno preveri. Če je izven dovoljenega obsega, se program ujame v past (in nadzor prevzame OS).
> - **CPE**: CPE je treba zaščititi pred tem , da bi si jo upor.program prilastil –uvedemo timer.

20. ***Komponente/Naloge OS***
> - **Upravljanje procesov** - Ustvarjanje, uničenje, odložitev procesa, njegovo ponovno obuditev, usklajevanje med procesi, komunikacija med procesi , reševanje iz zastojev (mrtvih zank) , in še kaj.
> - **Upravljanje glavnega pomnilnika** - Nadzor – dodeljevanje in odvzemanje
> - **Upravljanje datotek** - Ustvarjanje in brisanje, premeščanje, kopiranje, stik, sprehajanje po dir., preslikavanje m ed datoteko in resničnim zunanjim pomnilnikom, skladiščenje (backup), t.j. varnostno shranjevanje.
> - **Upravljanje V/I sistema** - splošen vmesnik za komunikacijo z golilniki, vsebovati gonilnike za posamezne V/I naprave, upravljati z vmesnimi pomnilniki (buffer), predpomnilniki (cache), spoolingom in še kaj.
> - **Zaščita in varnost** - Nadzorovanje dostopa procesov do posameznih virov in zaščita pred okolico.
> - **Delo v omrežju**
> - **Interpretacija uporabnikovih ukazov**

21. ***Sistemski klic***

> Z njegovo pomočjo programer zaprosi OS, da ta v njegovem imenu izvede neko (zanj prepovedano) priviligirano akcijo. Nekateri višji programski jeziki pa te klice (read, load, store, create, open, execute ...) vseeno omogočajo.
V grobem jih razvrstimo v skupine: upravljanje procesov, upravljanje datotek, upravljanje naprav, vzdrževanje in dostavo informacij, komunikacijo

22. ***Zgradbe jedra?***
> - **Enostavna** – monolitna - Jedro je veliko, opravlja veliko funkcij in je 'neurejeno'. ranljivost, nezanesljivost, težavna razširjenost. MSDOS, začetni UN IX
> - **Razslojena** - spodnji sloj je strojna oprem a, vsak višji sloj pa temelji le na nižjih slojih.
Skrivanje podrobnosti, prinaša red., manjša učinkovitost zaradi režije pri prenašanju. THE (6 slojev), Venus (7)
> - **Mikrojedro** - ohrani le bistvene komponente. Jedro je majhno, razširljivo, obvladljivo, prenosljivo. Celoten
sistem pa enostavno razširljiv, zanesljiv, varen. Npr. če eden od servisov 'izpade', to ne prizadene celotnega sistema. UNIX, Apple MacOS, Windows NT.

23. ***Kaj je proces?***
> Proces je program v izvajanju. Je ustvarjen, teče in nato uničen. Za svoje delovanje potrebuje vire (CPE, pomnilnik, V/I, datoteke, čas, ...). Nekatere vire dobi ob nastanku, druge kasneje. Z okolico si lahko izmenjuje podatke. Hkrati lahko obstaja več procesov. Lahko so neodvisni, lahko pa se usklajujejo, komunicirajo. Običajno tekmujejo za omejene vire. Proces sam lahko ustvari nove procese. Program je pasivna entiteta - vsebina neke datoteke. Proces poleg program a zajema tudi trenutno stanje nekaterih drugih entitet, ki se spreminjajo med izvajanjem programa.

24. ***Naštej stanja procesa v CPU!***

> Stanja procesa so: ustvarjen (nov), pripravljen(čaka, da se mu dodeli procesna enota), teče (se izvaja), čaka (ustavljen), končan.

25. ***Kaj je PCB?***
> PCB (process control block) je nadzorni blok procesa v OS-u. Vsebuje podatke o procesu, med njimi tudi kazalce za povezovanje z drugimi PCB v razne vrste. (stanje, prioriteta, podatki za obnovo, sklad, spremenljivke, podatki o pomnilniku, V/I in datoteke, ostalo).


26. ***V katerih vrstah se nahajajo procesi?***
> - vrsta vseh procesov
> - vrsta pripravljenih procesov
> - vrsta procesov, ki čakajo na V/I napravo

27. ***Razloži razvrščanje – prekinitveno in neprekinitveno!***

> Ločimo tri vrste razvrščanja:
> * na procesorju (kratkoročno – teče, pripravljen),
> * razvrščanje poslov (dolgoročno - nov) in
> * menjavanje (srednjeročno - pripravljen).

> Razvrščanje opravlja razvrščevalnik, ki je del OS.
Na enoprocesorskem sistemu v nekem trenutku teče kvečjemu en proces. Ostali procesi bodisi čakajo (na nek dogodek) ali pa so pripravljeni (čakajo na CPE). Med pripravljenimi se slednjič enega izbere in sedaj se njemu dodeli CPE, temu se reče preklop. Pravimo, da je procesor zamenjal okolje svojega delovanja. Tak preklop imenujemo tudi menjava okolja (context switch). Pri menjavi okolja (preklopu) sta v resnici udeležena dva programa OS:
> - **razvrščevalnik (scheduler)**, ki izbere enega od pripravljenih procesov,
> - **dodeljevalnik (dispatcher)**, ki izbranemu procesu v resnici dodeli procesor, tj. izvede menjavo okolja.

>V katerih okoliščinah je možno/nujno pognati razvrščevalnik? Potem, ko je:
> - **tekoči proces postal onemogočen**
Proces ne more nadaljevati, zato bo šel med čakajoče in sprostil CPE. Kdo dobi naslednji
CPE?
> - **tekoči proces je prekinila ura**
Tekoči proces je rabil svojo časovno rezino. Kdo dobi naslednjo čas. rezino? On ali kdo drug?
> - **čakajoči proces dočakal izpolnitev pogojev za nadaljevanje**
Čakajoči proces je postal spet pripravljen. Ali si morda že takoj zasluži CPE?
> - **tekoči proces končal**
CPE je prosta. Kdo jo dobi naslednji?
> - **prispel nov proces**
Prispel nov proces, ki je pripravljen. Ali si morda zasluži CPE?

>Ločimo dva pristopa:
>- **razvrščanje povzročita le 1 in 4.**
Proces bo torej izgubil CPE le, če je bil onemogočen oz. se je končal, torej če ne more več teči. V nasprotnem pa bo nemoteno tekel.
Zato to imenujemo razvrščanje brez prekinjanja (nonpreemtive sch.)
(Pozor: Prekinitve, ki so posledica običajnih prekinitvenih zahtev, so seveda možne, saj ne sprožajo razvrščanja, temveč le začasno izvajanje prekinitvenih servisnih programov PSP - ti pa 'ne štejejo'. Zato bi bil ustreznejši prevod razvrščanje brez odvzemanja, saj se procesu ne da odvzeti CPE, lahko pa se ga še vseeno prekine v standardnem smislu.)
>- **poleg 1 in 4 razvrščanje sproži še vsaj ena od 2,3,5.**
(Za odvzem sedaj zadošča tudi iztek dodeljenega časa ali pa sprememba v vrsti pripravljenih procesov.) V tem primeru proces lahko izgubi CPE, četudi bi še lahko tekel.
Torej je lahko res prekinjen. To je razvrščanje s prekinjanjem (preemptive sch.)

28. ***Algoritmi za razvrščanje***
>- **Prvi pride, prvi melje (FIFO)** – proces, ki je prej zahteval procesor ga prvi dobi
>- **Krožno razvrščanje (round robin)** – vrsta pripravljenih procesov je krožni seznam in proces, ki pride na vrsto dobi neko časovno rezino. Ko ta poteče ali pa se proces ustavi, se proces postavi na konec vrste
>- **Razvrščanje po prioriteti** – vsak proces ima prioriteto, najvišji dobi CPE
>- **Najkrajši nemoteni čas (SJF - Shortest Job First)** – CPE se dodeli procesu, ki bo najmanj časa nemoteno tekel. Napovedujemo tako, da predpostavimo, da bo naslednji nemoteni tek trajal podobno časa, kot trenutni
>- **Najkrajši nemoteni tek + prekinjanje (SRTF - Shortest Remaining Time First)** - enak SJF, le da se lahko tekoči proces prekine, če drug pripravljen proces obljublja krajši nemoten tek od preostanka tekočega nemotenega teka
>- **Z zagotovilom** - s pomočjo formule izračuna kvocient k in proces, ki ima najmanjši k dobi CPE. Če vpeljemo še prekinjanje, se k tekom časa povečuje, in ko presega vrednost naslednjega najmanjšeg k-ja, se prekine
>- **Loterija** – Razvrščevalnik naključno izbere dovolilnico.

29. ***Na osnovi česa naj vrednotimo in primerjamo algoritme za razvrščanje?***
> - **Izkoriščenost CPE (CPU utilization)**... CPE naj bo čim bolj izkoriščen. V realnosti 40% - 90%
> - **Propustnost (troughput)**... število končanih procesov v nekem času
> - **Čas obdelave (turnaround time)**... čas od nastanka procesa do njegovega konca
> - **Čakalni čas (waiting time)**...
> - **Odzivni čas (response time)**... čas od nastanka procesa do prve izhodne operacije.
> - **Pravičnost (fairness)**... vsak proces naj dobi ustrezen čas CPE

30. ***Kaj pa vpliva na preklopni čas?***
> - Hitrost pomnilnika (kjer je shranjen PCB)
> - Število registov procesorja (ki se morajo shraniti v PCB oz. obnoviti iz njega)
> - (ne)obstoj ukazov za shranitev/obnovo vseh registrov naenkrat
> - Zgradba procesorja
> - Zapletenost komponent OS
> - kakšno je razvrščanje (tj. po katerem algoritmu deluje)
> - ostala morebitna občasna opravila
> - Menjavanje okolja je ozko grlo O S, saj se pri tem lahko izgubi veliko časa.

31. ***Nit***

> Je tok izvajanja programa do danega trenutka. Če je sistem enoprocesorski, procesor posveti vsaki niti nekaj časa, tako da vse napredujejo. Če pa je sistem večprocesorski, pa se lahko vsaka nit izvaja na svojem procesorju (to ni paralelno, ampak sočasno). En proces ima lahko več niti. Niti uporabljamo ker želimo sočasno izvajati več funkcij istega programa ali pa sočasno izvajati več klicev iste funkcije.

32. ***Podobnosti in razlike med nitmi in procesi***

> - **Podobnosti**: tudi nit je lahko v stanjih (nova, prekinjena, teče, čaka ,končana), tudi nit lahk oustvari nove niti (hčere) ter jih konča in uniči, na enoprocesorskem sistemu tudi niti tekmujejo za procesor.
> - **Razlike**: komunikacija med istorodnimi nitmi je hitrejša kot med procesi, istorodne niti niso zaščitene ena pred drugo tako kot procesi, ustvarjanje / končanje niti je hitrejše kot pri procesih.

33. ***Vrste komunikacije med procesi***

> - Za prenos podatkov skrbi `OS` (tj. njegova komponenta IPC). Ta način je počasnejši.
> - Za prenos podatkov skrbita `proizvajalec in porabnik` (preko skupnega pomnilnika)

34. ***IPC (Interprocess communication)***

> Je del OS, ki skrbi za komunikacijo in sinhronizacijo med procesi.
> - **Neposredna komunikacija**: procesi se pri komuniciranju ekslicitno imenujejo (navedejo).
>     - *Simetrična*: pošiljatelj in prejemnik drug drugega eksplicitno imenujeta
>     - *Asimetrična*: samo pošiljatelj eksplicitno navede prejemnika
send(Q,m) ...pošlji procesu Q sporočilo m
receive (x,m) ...prejmi od kogarkoli sporočilo m in potem vrni njegovo ime v spremenljivko v x
> - **Posredna komunikacija**: procesi imenujejo vmesni medij – nabiralnik. Nabiralnikov je lahko več, vsak im a enolični naslov. Pošiljatelj sporočilo vstavi v nek nabiralnik, od koder ga vzame prejemnik.
>     - *Nabiralnik je del procesa P, ki ga je ustvaril.* Bere samo P.
>     - *Nabiralnik je del OS.* Berejo isti katerim P podeli lastništvo. Nevarnost! (tekma za sporočilo, garbage collection)
send(N, m) ...vrzi v nabiralnik N sporočilo m
receive (N,m) ...vzem i iz nabiralnika N sporočilo m

> Sinhrono in asinhrono komuniciranje, brez kopičenja, z omejenim kopičenjem, z neomejenim kopičenjem. Prenašanje kopij sporočila ali reference (pomnilniške naslove).

35. ***Komunikacija preko skupnega pomnilnika – brez OS***

> Večja hitrost toda procesa morata sama poskrbeti za komunikacijo.
Proces lahko OS obvesti da drugemu procesu dovoljuje dostop do svojega pomnilnika.
Proces lahko zaprosi za pomnilnik dane velikosti, ki bo skupen. Vsak proces ki ga želi uporabljati si ga mora dodati.

36. ***Pojasni signale v UNIXu!***

> Signal je programska prekinitev s strani sistema, drugega programa ali samega sebe. Signal je možno poslati, prestreči, prezreti ali obravnavati. Nosijo malo informacije – predvsem za javljanje nenavadnih okoliščin ali napak.
Imenuj razlog, zakaj so signali lahko nezanesljivi.
Signali so lahko nezanesljivi, ker se lahko v izjemnih okoliščinah obnašajo drugače, kot je predvideno.

37. ***Naštej razlike med vtičnicami in cevmi!***

> Cevi so enosmerni kanali – za komunikacijo sta potrebni dve, na vtičnice pa se priklopijo dvosmerni kanali. Cevi (razen FIFO, t.j. poimenovane cevi) lahko obstajajo le med dvema procesoma v sorodstvu (otrok-otrok, roditelj-otrok), za vtičnice pa ta relacija ni potrebna.

38. ***Socketi***

> Vtičnice so enostaven programski vmesnik za komunikacijo med procesi na istem ali različnih računalnikih. Pred pričetkom komunikacije morata oba procesa P in Q ustvariti vsaj svojo vtičnico. Nato pove vsak svoji vtičnici kakšen naslov bo imela (v mreži je to IP). Sedaj se lahko pogovarjata – strežnik (listen, accept), odjemalec (connect), za oba (send, recv, read, write, close).

39. ***Razloži kritične odseke / sekcije / dele ! Katere kriterije bi morali upoštevati za splošno rešitev problema kritičnega dela?***

> Kritični odsek je del programa oz. procesa, ki dostopa do skupnega sredstva. Bistveni pogoj za rešitev tega problema je da je v kritičnem odseku v vsakem trenutku le en proces.
**Kriteriji**: medsebojno izključevanje v vsakih okoliščinah, ne sme priti do zastoja, ne sme priti do nepredvideno dolgega odlaganja, izvajanje enega procesa znotraj kritičnega dela ne sme ovirati napredovanja drugih procesov izven kritičnega dela.
> - **Vzajemno izključevanje procesov**: sočasno se lahko izvaja kvečjemu en kritični odsek (tudi če pride do prekinitve)
> - **Omejeno čakanje na vstop**: procesu se ne sme neomejeno dolgo preprečevati vstopa v kr.odsek
> - **Omejen vpliv na izbor**: na to, kdo bo naslednji vstopil v kr. odsek, vplivajo le kandidati za vstop
> - **Splošnost rešitve**: rešitev naj bo neodvisna od števila procesov (n)

40. ***Razloži semafor!***

> Semafor je orodje za časovno usklajevanje procesov. Je celoštevilska spremenljivka S, nad katero se izvajajo operacije inicializacija,
   ```
   wait(S) :

   while S ≤ 0 do { no_op; } //cakamo dokler je S enak 0
   S := S-1;
   ```

   ```
   signal(S):

   S := S+1 //atomarno – ne more biti prekinjen
   ```
>Po navadi sta ti dve operaciji realizirani na OS.

41. ***Tipi datotek v Linuxu***
> - navadna datoteka – /etc/passwd
> - imenik – /bin
> - simbolična povezava – /usr/src/linux
> - cev – mkfifo pipa
> - vtičnica
> - znakovno orientirana naprava – /dev/tty
> - bločno orientirana naprava – /dev/sda


42. ***Bash ukazi za obdelavo datotek***
> - izpis vsebine: cat, less, head, tail
> - urejanje vrstic: sort
> - permutiranje vrstic: shuf
> - odstranjevanje duplikatov: uniq
> - številčenje vrstic: nl
> - obrat vrstic: rev
> - spreminjanje znakov: tr
> - obdelava stolpcev: cut in paste.
> - štetje besed: wc.
> -  primerjava vsebine: cmp.
Primer: cat /etc/passwd | cut -d: -f7 | sort | uniq -c | sort –gr

43. ***Odgovori na vprašanja***

> - V kateri datoteki na Linux sistemih se skriva sol?
> - Zapišite ukaz, ki ustvari anonimno cev.
> - Katera dva znaka v Bashu sta lahko uporabljena za ločilo med ukazi?
> - Kam se shranjujejo podatki, ki jih zapišemo v /dev/null
> - Kateri proces je tipično oče vseh demonov?

44. ***Naštejte prednosti mikrojedernih operacijskih sistemov***

> TO DO...

45. ***Katere funkcije OS opravlja mikrojedro?***

> TO DO...

46. ***Z diagramom opišite delovanje ukazov wait(S) in signal(S) za delo s semaforji. Označite kateri deli se morajo izvajati atomarno.***

> TO DO...

47. *Razloži pomen pozivnika* ***sokrat@jama:~>*** . *Obrazloži vse dele, tudi ločila.*

> TO DO...
