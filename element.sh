#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

if [[ -z $1 ]]
then
echo -e "Please provide an element as an argument." 
else
  # match to name 
  NAME=$($PSQL "SELECT name FROM elements WHERE name = '$1'")
  if [[ -z $NAME ]]
  then
    # if not, match to symbol
    SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE symbol = '$1'")
    if [[ -z $SYMBOL ]]
    then
      # if not, match to atomic_number
      # is it a number?
      if [[ $1 =~ ^[0-9]+$ ]]
      then
        NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number = '$1'")
        if [[ -z $NUMBER ]]
        then
          # error if not found
          echo "I could not find that element in the database."
        else 
          NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number = '$NUMBER'")
          SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number = '$NUMBER'")
        fi
      # if not a number  
      else
        echo "I could not find that element in the database."
      fi
    else 
      NAME=$($PSQL "SELECT name FROM elements WHERE symbol = '$1'")
      NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE symbol = '$1'")
    fi
  else 
    SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE name = '$1'")
    NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE name = '$1'")
  fi

  # get remaining variables
  if [[ ! -z $NUMBER ]]
  then
    TYPE=$($PSQL "SELECT type FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number = '$NUMBER'")
    MASS=$($PSQL "SELECT atomic_mass FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number = '$NUMBER'")
    MELT=$($PSQL "SELECT melting_point_celsius FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number = '$NUMBER'")
    BOIL=$($PSQL "SELECT boiling_point_celsius FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number = '$NUMBER'")
    # format variables
    NUMBER_FORMATTED=$(echo $NUMBER | sed 's/ +//g')
    SYMBOL_FORMATTED=$(echo $SYMBOL | sed 's/ +//g')
    NAME_FORMATTED=$(echo $NAME | sed 's/ +//g')
    TYPE_FORMATTED=$(echo $TYPE | sed 's/ +//g')
    MASS_FORMATTED=$(echo $MASS | sed 's/ +//g')
    MELT_FORMATTED=$(echo $MELT | sed 's/ +//g')
    BOIL_FORMATTED=$(echo $BOIL | sed 's/ +//g')

    
    # output sentence
    echo "The element with atomic number $NUMBER_FORMATTED is $NAME_FORMATTED ($SYMBOL_FORMATTED). It's a $TYPE_FORMATTED, with a mass of $MASS_FORMATTED amu. $NAME_FORMATTED has a melting point of $MELT_FORMATTED celsius and a boiling point of $BOIL_FORMATTED celsius."
  fi
fi
