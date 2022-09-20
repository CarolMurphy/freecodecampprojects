#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
GUESS_ME=$(( $RANDOM % 1000 ))
echo $GUESS_ME
echo "Enter your username:"
read USERNAME
#TODO: look for USERNAME in db
FINDNAME=$($PSQL "SELECT username FROM users WHERE username='$USERNAME'");
if [[ $FINDNAME == '' ]]
then
  $PSQL "INSERT INTO users(username) VALUES('$USERNAME')";
  echo -e "Welcome, $USERNAME! It looks like this is your first time here."
else
  GAMES_PLAYED=$($PSQL "SELECT COUNT(game_id) FROM games INNER JOIN users ON games.user_id = users.user_id WHERE username='$USERNAME'")
  BEST_GAME=$($PSQL "SELECT MIN(guess_count) FROM games INNER JOIN users ON games.user_id = users.user_id WHERE username='$USERNAME'")
  echo -e "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'");
echo -e "Guess the secret number between 1 and 1000:"
#MAKE ALL GUESS MESSAGES PART OF MAIN
GUESS_COUNT=0
function MAIN {
  read GUESS
  if [[ $GUESS != [0-9]* ]]
  then
    echo -e "That is not an integer, guess again:"
    MAIN 
  fi
  if [[ $GUESS -lt $GUESS_ME ]]
  then
    let "GUESS_COUNT+=1"
    echo -e "It's higher than that, guess again:"
    MAIN 
  fi
  if [[ $GUESS -gt $GUESS_ME ]]
  then
    let "GUESS_COUNT+=1"
    echo -e "It's lower than that, guess again:"
    MAIN 
  fi
  if [[ $GUESS == $GUESS_ME ]]
  then
    let "GUESS_COUNT+=1"
    GUESS_RESULT=$($PSQL "INSERT INTO games(guess_count, user_id) VALUES($GUESS_COUNT, $USER_ID)")
    if [[ $GUESS_RESULT == 'INSERT 0 1' ]]
    then
      echo -e "You guessed it in $GUESS_COUNT tries. The secret number was $GUESS_ME. Nice job!"
    #PUT CODE TO INSERT INTO games(guess_count, user_id)GUESS COUNT INTO games HERE BEFORE RESET TO 0
    #$PSQL "INSERT INTO games(guess_count, user_id) VALUES($GUESS_COUNT, $USER_ID)"
    fi
    #reset guess_count for next game
    let "GUESS_COUNT=0"
    #CODE TO QUIT GAME HERE
    exit 0
  fi
}
#echo $GUESS_ME
MAIN
