#!/bin/bash

# Database connection command
PSQL="psql --username=freecodecamp --dbname=periodic_table --no-align --tuples-only -c"

# Check if argument is provided
if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
  exit
fi

# Determine if input is a number or string
if [[ $1 =~ ^[0-9]+$ ]]
then
  ELEMENT_DATA=$($PSQL "SELECT elements.atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements JOIN properties USING(atomic_number) JOIN types USING(type_id) WHERE atomic_number = $1;")
else
  ELEMENT_DATA=$($PSQL "SELECT elements.atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements JOIN properties USING(atomic_number) JOIN types USING(type_id) WHERE symbol = '$1' OR name = '$1';")
fi

# If element is not found
if [[ -z $ELEMENT_DATA ]]
then
  echo "I could not find that element in the database."
else
  # Format output
  echo "$ELEMENT_DATA" | while IFS="|" read ATOMIC_NUMBER NAME SYMBOL TYPE MASS MELTING BOILING
  do
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
  done
fi