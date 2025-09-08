#!/bin/bash
# Number Guessing Game - freeCodeCamp project
# Script para jugar adivinando un número y guardar resultados en PostgreSQL

# Variable de conexión a la DB
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# 1. Pedir username (texto EXACTO)
echo "Enter your username:"
read USERNAME

# 2. Buscar usuario en DB
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")

if [[ -z $USER_ID ]]
then
  # Si no existe -> crearlo (silenciar salida para evitar 'INSERT 0 1')
  $PSQL "INSERT INTO users(username) VALUES('$USERNAME')" >/dev/null
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  # Si ya existe -> mostrar stats (formato exacto y sin espacios raros)
  GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id=$USER_ID")
  BEST_GAME=$($PSQL "SELECT COALESCE(MIN(guesses), 0) FROM games WHERE user_id=$USER_ID")
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# 3. Generar número aleatorio entre 1 y 1000 (mensaje EXACTO)
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))
echo "Guess the secret number between 1 and 1000:"

# 4. Loop de adivinanza
GUESSES=0

# Loop until the correct number is guessed
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

# 5. Cuando acierta (mensaje EXACTO)
echo "You guessed it in $GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"

# Insert game result into database (silenciar salida)
$PSQL "INSERT INTO games(user_id, guesses) VALUES($USER_ID, $GUESSES)" >/dev/null
