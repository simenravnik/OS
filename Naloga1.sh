#!/bin/bash

function handleHelp {
   echo "Tukaj bo napisana pomoc"
}

function getGcd {
	a="$1"
	b="$2"
	m=$a
	if [ $b -lt $m ]; then
		m=$b
	fi
   gcd=0
	while [ $m -gt 0 ]; do
		o1=$(($a % $m))
		o2=$(($b % $m))
		if [ $o1 -eq 0  -a $o2 -eq 0 ]; then
			gcd=$m
         break
		fi
		((m--))
	done
	exit $gcd
}

function findGcd {
	a=$1
	b=$2
	max=$a

	if [ $b -lt $m ]; then
		max=$b
	fi

	while [ $max -ne 0 ]; do
		x = `expr $a % $max`
		y = `expr $b % $max`

		if [ $x -eq 0 -a $y -eq 0 ]; then
			break
		fi
		max = `expr $max - 1`
	done
	echo $max
}

function getLeepYear {
	for i in "$@"; do
		(( !(i % 4) && ( i % 100 || !(i % 400) ) )) &&
      echo "Leto $i je prestopno." || echo "Leto $i ni prestopno."
	done
}

function getFib {
	for i in "$@"; do
		fibo=$(handleFib $i)
		echo "$i: $fibo"
	done
}

# fibonacci iterativno
function handleFib {
   n=$1
   prvi=1
   drugi=0
   i=0
   if [ $n -lt 0 ]; then
      return -1
   fi

   while [ $i -lt $n ]; do
      tmp=$drugi
      drugi=$((drugi + $prvi))
      prvi=$tmp
      i=$((i + 1))
   done

   echo $drugi
}

function getInfo {
	for i in $@; do
		# preverimo ali uporabnik obstaja
		if id "$i" >/dev/null 2>&1; then
			echo -n "$i: "
      		uid=$(id -u $i)
			gid=$(id -g $i)
			if [ $uid -eq $gid ]; then
				echo -n "enaka "
			fi
			if [ -d "/home/$i" ] || [ -d "/home/uni/$i" ]; then
  				echo -n "obstaja "
			fi
			num=$(groups "$i" | wc -w)
			echo  -n "$num"
			echo
		else
      		echo "err"
		fi
	done
}

function getTocke {
   RANDOM=42
   i=0
   skupnaVsota=0
	while read line; do
		besede=( $line )
		prva=${besede[0]}
		if [ "$prva" != "#" ]; then
         ((i++))
			vpisna=$prva
			leto="${vpisna:2:2}"
			a=${besede[1]}
			b=${besede[2]}
			c=${besede[3]}
			vsota=$(( $a + $b + $c ))
			num=$(wc -w <<< $line)
			jeP=0
			if [ $num -eq 5 ]; then
				d=${besede[4]}
				if [ "$d" == "P" -o "$d" == "p" ]; then
					vsota=$(( $vsota / 2 ))
					jeP=1
				fi
			fi
			if [ "$leto" = "14" ] && [ $jeP -eq 0 ]; then
				rand=$((1 + RANDOM % 5))
				vsota=$((vsota + $rand))
			fi
			if [ $vsota -gt 50 ]; then
				echo "$vpisna: 50"
            skupnaVsota=$((skupnaVsota+50))
			else
				echo "$vpisna: $vsota"
            skupnaVsota=$((skupnaVsota+$vsota))
			fi
		fi
	done
   echo "St. studentov: $i"
   povprecje=$(($skupnaVsota / $i))
   echo "Povprecne tocke: $povprecje"
}

#rekurzivna funkcija drevo
function getFiles {
	local stevec=2
	konec=0
	for i in "$1"/*; do
		tip=$(poisciTip "$1" "$stevec")
		#echo $tip
		ime=$(basename "$i")
		if [ "$tip" = "d" ]; then
			printf_new "-" $3
			echo -n "DIR   "
			echo "$ime"
			if [ "$2" != "$konec" ]; then
				getFiles "$i" $(($2 - 1)) $(($3 + 4))
			fi
		elif [ "$tip" = "-" ]; then
			printf_new "-" $3
			echo -n "FILE  "
			echo "$(basename "$i")"
		elif [ "$tip" = "c" ]; then
			printf_new "-" $3
			echo -n "CHAR  "
			echo "$(basename "$i")"
		elif [ "$tip" = "l" ]; then
			printf_new "-" $3
			echo -n "LINK  "
			echo "$(basename "$i")"
		elif [ "$tip" = "p" ]; then
			printf_new "-" $3
			echo -n "PIPE  "
			echo "$(basename "$i")"
		elif [ "$tip" = "s" ]; then
			printf_new "-" $3
			echo -n "SOCK  "
			echo "$(basename "$i")"
		elif [ "$tip" = "b" ]; then
			printf_new "-" $3
			echo -n "BLOCK "
			echo "$(basename "$i")"
		fi
		((stevec++))
	done
}

printf_new() {
 str="$1"
 num="$2"
 v=$(printf "%-${num}s" "$str")
 echo -n "${v// /-}"
}

function poisciTip {
	line=$(ls -ll "$1" |  cut -d " " -f1)
	val=$(echo $line | cut -d " " -f$2)
	val="${val:0:1}"
	echo $val
}

function handleDefault {
	echo "Napacna uporaba skripte!"
	echo "Uporaba: ./Naloga.sh akcija parametri"
}

DEFAULT=2

while [ -n "$1" ]; do
   case "$1" in
      pomoc)
         handleHelp
         shift
         ;;
      status)
      	shift
         getGcd "$@"
         shift
         ;;
      leto)
	      shift
      		getLeepYear "$@"
      		exit 0
      		;;
      	fib)
	      shift
      		getFib "$@"
      		exit 0
      		;;
      	userinfo)
	      shift
      		getInfo "$@"
      		exit 0
      		;;
     	tocke)
     		shift
     		 getTocke
     		exit 0
     		;;
     	drevo)
     		shift
            trenutniImenik="$(pwd)"
            ime="$1"
            # ime=$(basename $ime)
            if [ -z "$1" ]; then
               echo "DIR   $trenutniImenik"
            else
        		     echo "DIR   $ime"
            fi
        		globina=$2
            if [ -z "$2" ]; then
        		   getFiles "${ime:-$trenutniImenik}" "$DEFAULT" 4
            else
               ((globina--))
               getFiles "${ime:-$trenutniImenik}" "${globina:-$DEFAULT}" 4
            fi
     		exit 0
     		;;
      *)
         handleDefault
         shift
         exit 0
         ;;
   esac
done
