#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL "TRUNCATE games, teams")
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  # do no include first line of column names
  if [[ $WINNER != 'winner' ]]
  then
    #get team id
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")

    # if not found
    if [[ -z $TEAM_ID ]]
    then
      # insert team
      INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      echo Inserted into teams, $WINNER
      echo $INSERT_TEAM_RESULT
    fi  
  fi

  if [[ $OPPONENT != 'opponent' ]]
  then
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    #echo $TEAM_ID
    if [[ -z $TEAM_ID ]]
    then
      INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      echo Inserted into teams, $OPPONENT
      echo $INSERT_TEAM_RESULT
    fi
  fi

  if [[ $YEAR != 'year' && $ROUND != 'round' && $WINNER != 'winner' && $OPPONENT != 'opponent' && $WINNER_GOALS != 'winner_goals' && $OPPONENT_GOALS != 'opponent_goals' ]]
  then
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    echo $OPPONENT_ID
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    # get team_id that matches $OPPONENT and insert as opponent_id
    INSERT_OPPONENT_ID_RESULT=$($PSQL "INSERT INTO games(year, round, opponent_id, winner_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $OPPONENT_ID, $WINNER_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
    echo $INSERT_OPPONENT_ID_RESULT
    #OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='
    # insert year
    #INSERT_YEAR_ROUND=$($PSQL "INSERT INTO games(year, round) VALUES('$YEAR', '$ROUND')")
    #echo Inserted into games, 
    #echo $NSERT_YEAR_ROUND
  fi
done