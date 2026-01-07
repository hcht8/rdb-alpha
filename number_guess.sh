#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

RANDOM_NUMBER=$(( (RANDOM % 1000) + 1 ))

echo Enter your username:
read USERNAME

USER_ID=$($PSQL "SELECT user_id FROM user_table WHERE username='$USERNAME'")

if [[ -z $USER_ID ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  USER_LOG=$($PSQL "INSERT INTO user_table(username) VALUES('$USERNAME')")
  USER_ID=$($PSQL "SELECT user_id FROM user_table WHERE username='$USERNAME'")
else
  GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM user_table INNER JOIN game_logs USING(user_id) WHERE user_id=$USER_ID")
  BEST_GUESS=$($PSQL "SELECT MIN(best_guess) FROM user_table INNER JOIN game_logs USING(user_id) WHERE user_id=$USER_ID")
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GUESS guesses."
fi

echo "Guess the secret number between 1 and 1000:"
read USER_GUESS
NUMBER_OF_GUESS=1
while [[ $USER_GUESS -ne $RANDOM_NUMBER ]]
do
  if [[ ! $USER_GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
  elif [[ $USER_GUESS -gt $RANDOM_NUMBER ]]
  then
    echo "It's lower than that, guess again:"
  else
    echo "It's higher than that, guess again:"
  fi
  read USER_GUESS
  (( NUMBER_OF_GUESS++ ))
done

echo You guessed it in $NUMBER_OF_GUESS tries. The secret number was $RANDOM_NUMBER. Nice job!
GAME_LOG=$($PSQL "INSERT INTO game_logs(user_id, best_guess) VALUES($USER_ID, $NUMBER_OF_GUESS)")
