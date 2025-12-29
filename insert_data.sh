#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# empty the database
$PSQL "TRUNCATE TABLE games, teams;"

# add each unique team to the teams table
INSERT_UNIQUE_TEAM=$(tail -n +2 games.csv | awk -F',' '{print $3; print $4}' | sort -u | \
$PSQL "COPY teams (name) FROM STDIN;")

# insert into games table
while IFS=',' read -r year round winner opponent winner_goals opponent_goals; do
  [[ "$year" == "year" ]] && continue
  WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$winner'")
  OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$opponent'")
  $PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals)
    VALUES($year, '$round', $WINNER_ID, $OPPONENT_ID, $winner_goals, $opponent_goals);"
done < games.csv
