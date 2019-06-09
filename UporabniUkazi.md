
# Uporabni ukazi

```
Avtor: Šimen Ravnik
Datum: June, 2019
```

## Ukazi Bash

NAPISI REGULARNE IZRAZE



```bash
$? # zadnji izhodni status
$! # pid zadnjega ukaza
$$ # = $BASHPID, pid trenutnega procesa
$PPID # parent trenutnega procesa

"$#" # stevilo argumentov
$0 # ime skripte
$@ # vsi argumenti
```

```bash
# oce procesa 'pid'
ppid=$(ps -p ${pid:-$$} -o ppid=)
```

```bash
# rekurzivno poisce vse ocete procesa
findFather(){
    ppid=$(ps ho ppid $1)
    echo $ppid
    if [ $ppid -gt 1 ] &&  findFather $ppid
}
```

```sh
# iritacija preko uporabnikov v sistemu
for i in 'who | cut -d " " -f1'
```

```sh
# beremo vnos uporabnika
read answer
```

```sh
# iritacija preko datotek v direktoriju
FILES=/path/to/*
for f in $FILES

# ali
for f in `ls $1`; do
   ...
done

# preverimo ali je datoteka direktorij
if [ -d "$file"]; then
   ...
fi
```

```bash
# zadji dostop in zadnja sprememba datotek v direktoriju
ls -alRSa $1 > acesstime.log
ls -alRSc $1 > changetime.log
```

```bash
# preimenovanje koncnic
for file in *.html; do
    mv "$file" "$(basename "$file" .html).txt"
done
```

7. Napišite program v lupini, ki vsake pet minut preveri, če se na sistemu pojavi nek proces in ga poskusa ubiti. Ime procesa podamo v ukazni vrstici

```bash
while true; do
    ps -eo "%t %c %p" | grep $1 > dd
    while read p; do
        if [ `echo $p | grep -o ":" | wc -l` -eq 1 ]; then
            if [ `echo $p | cut -d":" -f1` -lt 5 ]; then
                kill `echo $p | awk '!/(Avail|shm|udev)/{print $3}'`
            fi
        fi
    done < dd
    sleep 300
    rm dd
done
```

```
Naloga1:

gcd (getGcd)
prestopno Leto
userinfo

fun.sh:

fibonacci
fakulteta


```

```bash
# datoteke vsebujejo | @ $ v imenih
for dat in `ls -f |  grep ["|@€"]`
```

```bash
#!/bin/bash

# while loop
n=0
while [ $n -lt 100 ]
do
      echo $n
      ((n++))
done

# for loop

for var in 5 4 3 2 1
do
   echo $var
done

# primer uporabe, * gre cez datoteke v tem direkturiju

for var in *
do
   echo $var
done

# primer 2

for ((i = 0; i < 10; i++)) do
   echo $i
done

#primer 3

for i in $(seq0 9)
do
   echo $i
done


#-----------------------------------------------------------------------

# echo $0 $1 $2
# shift <---------- zamakne
# echo $0 $1 $2

# zelo uporabno:
while [ -n "$1" ]
do
   echo "$1"
   shift
done

# case stavek

case "$1" in
   (pr?i)
      echo "$1"
      ;;
   (-h | --help)
      echo "HELP"
      ;;
esac
done

#to uporabimo lahko v while
while [ -n "$1" ]; do
   case "$1" in
      (-h | --help)
         echo "HELP"
         shift
         ;;
      (-n | --number)
         number="$2"
         shift
         shift
   esac
done

echo $number

# getopts funkcija
number=42
while getopts "hn:" var; do
   case var in
      h)
         echo "HELP"
         ;;
      n)
         number="$OPTART"
         ;;
   esac
done

echo $number

# preko vseh argumentov
for arg in "$*"; do
   echo $arg
done

# druga moznost, uporabljaj tako
for arg in "$@"; do
   echo $arg
done

# preko vseh argumentov
for arg in "$*"; do
   echo $arg
done

# druga moznost, uporabljaj tako
for arg in "$@"; do
   echo "$arg"
done

# kako beremo z stdio
var="$(cat)"
echo "$var"

# ce hocemo samo prebrati in izpisati
read var
echo
echo "$var"

# tako deluje cat
while read line; do
   echo "$line"
done

#funkcije
function test {
   echo "$1"
   echo test
   return 90000
}

test "$@"
```

```bash
# arrays v bashu
array=(el1 el2 el3)
echo "${array[0]}"
for i in "${array[@]}"

```

```bash
# strings
echo ${string:P:L} # P je idx zacetka, L idx konca
${string#vzorec} # od zaceta odrezes vzorec
${string%vzorec} # od konca odrezes vzorec
${string/vzorec/noviVzorec} # zamenjas vzorec z novim
${string//vzorec/noviVzorec} # zamenjas vse vzorce z novim
```


# Ukazi C

```C
int open(const char *path, int oflags, mode_t mode);
```

<table class="wiki-content-table">
<tbody><tr>
<th>Value</th>
<th>Meaning</th>
</tr>
<tr>
<td>O_RDONLY</td>
<td>Open the file so that it is read only.</td>
</tr>
<tr>
<td>O_WRONLY</td>
<td>Open the file so that it is write only.</td>
</tr>
<tr>
<td>O_RDWR</td>
<td>Open the file so that it can be read from and written to.</td>
</tr>
<tr>
<td>O_APPEND</td>
<td>Append new information to the end of the file.</td>
</tr>
<tr>
<td>O_TRUNC</td>
<td>Initially clear all data from the file.</td>
</tr>
<tr>
<td>O_CREAT</td>
<td>If the file does not exist, create it. If the O_CREAT option is used, then you must include the third parameter.</td>
</tr>
<tr>
<td>O_EXCL</td>
<td>Combined with the O_CREAT option, it ensures that the caller <em>must</em> create the file. If the file already exists, the call will fail.</td>
</tr>
</tbody></table>

```
mode_t:
0000 is ---------
0666 is rw-rw-rw-
0777 is rwxrwxrwx
0700 is rwx------
0100 is --x------
0001 is --------x
0002 is -------w-
0003 is -------wx
0004 is ------r--
0005 is ------r-x
0006 is ------rw-
0007 is ------rwx
```

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

napisi si read write append, waitpid, WIFEXITED

SIGNALI!!!
