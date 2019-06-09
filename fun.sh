#!/bin/bash

# fakulteta rekurzivno (smo naredili na vajah)
function handleFakrek {
   local n="$1"

   if [ $n -lt 0 ]; then
      return 41
   fi

   if [ $n -eq 1 ]; then
      echo 1
   else
      nn=$(handleFakrek $(bc <<< "$n - 1"))
      echo $(bc <<< "$n * $nn")
   fi
}

# fakulteta iterativno
function handlefakiter {
   n=$1
   i=1
   fak=1

   if [ $n -lt 0 ]; then
      return 41
   fi

   while [ $i -le $n ]; do
      fak=$((fak * $i))
      i=$((i+1))
   done
   echo "$fak"
}

# fibonacci rekurzivno
function handlefibrek {
   local n=$1

   if [ $n -lt 0 ]; then
      return 41
   fi

   if [ $n -lt 2 ]; then
      echo 1
   else
      prvi=$((n - 1))
      drugi=$((n - 2))
      echo $(( $(handlefibrek $prvi ) + $(handlefibrek $drugi ) ))
   fi
}

# fibonacci iterativno
function handlefibiter {
   n=$1
   prvi=1
   drugi=1
   i=1

   if [ $n -lt 0 ]; then
      return 41
   fi

   while [ $i -lt $n ]; do
      tmp=$drugi
      drugi=$((drugi + $prvi))
      prvi=$tmp
      i=$((i + 1))
   done

   echo "$drugi"
}

#help function
function handleHelp {
   echo
   echo "Navodila za uporabo:"
   echo
   echo "fakulteta stevila rekurzivno ....................... ./fun fakrek <value> "
   echo "fakulteta stevila iterativno ....................... ./fun fakiter <value> "
   echo "fibonacci stevila rekurzivno ....................... ./fun fibrek <value> "
   echo "fibonacci stevila iterativno ....................... ./fun fakiter <value> "
   echo

   echo "help ....................... ./fun fakiter -h | --help"
   echo
}

DEFAULT=10

if [ "$#" -eq 0 ]; then
    echo "Vpisi argumente."
fi

while [ -n "$1" ]; do
   case "$1" in
      fakrek)
         shift
         #a=$1
         handleFakrek ${1:-$DEFAUL}
         if [ $? -eq 41 ]; then
            echo "Fakulteta negativnega stevila ne obstaja."
         fi
         exit 1
         ;;
      fakiter)
         shift
         handlefakiter ${1:-$DEFAULT}
         if [ $? -eq 41 ]; then
            echo "Fakulteta negativnega stevila ne obstaja."
         fi
         exit 1
         ;;
      fibrek)
         shift
         handlefibrek ${1:-$DEFAULT}
         if [ $? -eq 41 ]; then
            echo "Fibonacci negativnega stevila ne obstaja."
         fi
         exit 1
         ;;
      fibiter)
         shift
         handlefibiter ${1:-$DEFAULT}
         if [ $? -eq 41 ]; then
            echo "Fibonacci negativnega stevila ne obstaja."
         fi
         exit 1
         ;;
      -h | --help)
         handleHelp
         exit 42
         ;;
      *)
         echo "Vpisi prave argumente."
         exit 0
   esac
done
