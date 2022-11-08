#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# generate random number between 1 - 1000
SECRET_NUMBER=$(( $RANDOM % 1000 + 1 ))

# get username
echo "Enter your username: "
read NAME
USERNAME=$($PSQL "SELECT username FROM number_guess WHERE username = '$NAME'")

# greet if new
if [[ -z $USERNAME ]]
then
  # add new username
  INSERT_NEW_USER=$($PSQL "INSERT INTO number_guess(username) VALUES('$NAME')")
  USERNAME=$($PSQL "SELECT username FROM number_guess WHERE username = '$NAME'")
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM number_guess WHERE username = '$NAME'")
  BEST_GAME=$($PSQL "SELECT best_game FROM number_guess WHERE username = '$NAME'")
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  # greet if existing
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM number_guess WHERE username = '$USERNAME'")
  BEST_GAME=$($PSQL "SELECT best_game FROM number_guess WHERE username = '$USERNAME'")
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# ask for guess
echo "Guess the secret number between 1 and 1000: "
NUMBER_OF_GUESSES=$(( 0 ))

# start guessing game
GUESSING_GAME() {
  read GUESS
  NUMBER_OF_GUESSES=$(( $NUMBER_OF_GUESSES + 1 ))

  # if not an int, print
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again: "
    GUESSING_GAME
#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# generate random number between 1 - 1000
SECRET_NUMBER=$(( $RANDOM % 1000 + 1 ))

# get username
echo "Enter your username: "
read NAME
USERNAME=$($PSQL "SELECT username FROM number_guess WHERE username = '$NAME'")

# greet if new
if [[ -z $USERNAME ]]
then
  # add new username
  INSERT_NEW_USER=$($PSQL "INSERT INTO number_guess(username) VALUES('$NAME')")
  USERNAME=$($PSQL "SELECT username FROM number_guess WHERE username = '$NAME'")
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM number_guess WHERE username = '$NAME'")
  BEST_GAME=$($PSQL "SELECT best_game FROM number_guess WHERE username = '$NAME'")
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  # greet if existing
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM number_guess WHERE username = '$USERNAME'")
  BEST_GAME=$($PSQL "SELECT best_game FROM number_guess WHERE username = '$USERNAME'")
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# ask for guess
echo "Guess the secret number between 1 and 1000: "
NUMBER_OF_GUESSES=$(( 0 ))

# start guessing game
GUESSING_GAME() {
  read GUESS
  NUMBER_OF_GUESSES=$(( $NUMBER_OF_GUESSES + 1 ))

  # if not an int, print
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again: "
    GUESSING_GAME

  else
    # if too high, print
    if [[ $GUESS -gt $SECRET_NUMBER ]]
    then
      echo "It's lower than that, guess again:"
      GUESSING_GAME

    # if too low, print
    elif [[ $GUESS -lt $SECRET_NUMBER ]]
    then
      echo "It's higher than that, guess again:"
      GUESSING_GAME

    # when correct, get # of guesses and print
    elif [[ $GUESS == $SECRET_NUMBER ]]
    then
      echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
      
      # update games played
      GAMES_PLAYED=$(( $GAMES_PLAYED + 1 ))
      UPDATE_GAMES_PLAYED=$($PSQL "UPDATE number_guess SET games_played = '$GAMES_PLAYED' WHERE username = '$USERNAME'")

      # update best game
      if [[ $BEST_GAME -gt $NUMBER_OF_GUESSES ]]
      then
        UPDATE_BEST_GAME=$($PSQL "UPDATE number_guess SET best_game = '$NUMBER_OF_GUESSES' WHERE username = '$USERNAME'")
      fi
    else
      echo "How did you get here? This shouldn't happen."
    fi
  fi
}

GUESSING_GAME

  else
    # if too high, print
    if [[ $GUESS -gt $SECRET_NUMBER ]]
    then
      echo "It's lower than that, guess again:"
      GUESSING_GAME

    # if too low, print
    elif [[ $GUESS -lt $SECRET_NUMBER ]]
    then
      echo "It's higher than that, guess again:"
      GUESSING_GAME

    # when correct, get # of guesses and print
    elif [[ $GUESS == $SECRET_NUMBER ]]
    then
      echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
      
      # update games played
      GAMES_PLAYED=$(( $GAMES_PLAYED + 1 ))
      UPDATE_GAMES_PLAYED=$($PSQL "UPDATE number_guess SET games_played = '$GAMES_PLAYED' WHERE username = '$USERNAME'")

      # update best game
      if [[ $BEST_GAME -lt $NUMBER_OF_GUESSES ]]
      then
        UPDATE_BEST_GAME=$($PSQL "UPDATE number_guess SET best_game = '$NUMBER_OF_GUESSES' WHERE username = '$USERNAME'")
      fi
    else
      echo "How did you get here? This shouldn't happen."
    fi
  fi
}

GUESSING_GAME
