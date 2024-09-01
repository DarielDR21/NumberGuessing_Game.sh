#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

#TRUNCATE_TABLE=$(echo $($PSQL "TRUNCATE users, games"))

#get user's username
echo -e "\nEnter your username:"
read username

#check if username exists in database

USERNAME=$($PSQL "SELECT username FROM users WHERE username='$username'")

USERNAME_ID=$($PSQL "SELECT username_id FROM users WHERE username='$username'")

#if player not found
if [[ -z $USERNAME ]]
then
  #greet player
  echo -e "\nWelcome, $username! It looks like this is your first time here."
  # add player to database
  INSERT_USERNAME=$($PSQL "INSERT INTO users(username) VALUES('$username')")

else 

  USER_GAMES=$($PSQL "SELECT count(game_id), min(guesses) FROM games WHERE username_id=$USERNAME_ID")
  echo "$USER_GAMES" | while IFS=' |' read GAMES_PLAYED GUESSES
  do
    #print user's games played and best game
    echo -e "\nWelcome back, $username! You have played $GAMES_PLAYED games, and your best game took $GUESSES guesses."
  done
fi


#generate random number from 1-1000
random_number=$((RANDOM % 1000 + 1))
echo "$random_number"

#USERNAME_ID=$($PSQL "SELECT username_id FROM users WHERE username='$username'")

guess_count=0

# get user's guess unitl correct
echo -e "\nGuess the secret number between 1 and 1000:"
read users_guess


# loop to prompt user to guess until correct
until [[ $users_guess == $random_number ]]
do
  
  # check guess is valid/an integer
  if [[ ! $users_guess =~ ^[0-9]+$ ]]
    then
      # request valid guess
      echo -e "\nThat is not an integer, guess again:"
      read users_guess
      # update guess count
      ((guess_count++))
    
    # if its a valid guess
    else
      # check inequalities and give hint
      if [[ $users_guess < $random_number ]]
        then
          echo "It's higher than that, guess again:"
          read users_guess
          # update guess count
          ((guess_count++))
        else 
          echo "It's lower than that, guess again:"
          read users_guess
          #update guess count
          ((guess_count++))
      fi  
  fi

done

((guess_count++))

USERNAME_ID=$($PSQL "SELECT username_id FROM users WHERE username='$username'")

INSERT_GAMES=$($PSQL "INSERT INTO games(username_id, guesses, secret_number) VALUES($USERNAME_ID, $guess_count, $random_number)")

echo You guessed it in $guess_count tries. The secret number was $random_number. Nice job\!

