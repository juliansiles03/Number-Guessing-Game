#!/bin/bash
# ^ esto siempre arriba (shebang)

# Variable de conexión a la DB
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# 1. Pedir username
echo "Enter your username:"
read USERNAME

# 2. Buscar usuario en DB
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")

if [[ -z $USER_ID ]]
then
  # Si no existe -> crearlo
  $PSQL "INSERT INTO users(username) VALUES('$USERNAME')"
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  # Si ya existe -> mostrar stats
  GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id=$USER_ID")
  BEST_GAME=$($PSQL "SELECT MIN(guesses) FROM games WHERE user_id=$USER_ID")
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# 3. Generar número aleatorio
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))
echo "Guess the secret number between 1 and 1000:"

# 4. Loop de adivinanza
GUESSES=0
while [[ $GUESS != $SECRET_NUMBER ]]
do
  read GUESS
  ((GUESSES++))

  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
  elif [[ $GUESS -gt $SECRET_NUMBER ]]
  then
    echo "It's lower than that, guess again:"
  elif [[ $GUESS -lt $SECRET_NUMBER ]]
  then
    echo "It's higher than that, guess again:"
  fi
done

# 5. Cuando acierta
echo "You guessed it in $GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
$PSQL "INSERT INTO games(user_id, guesses) VALUES($USER_ID, $GUESSES)"
