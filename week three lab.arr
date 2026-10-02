use context starter2024

#Problem 1 - determine if a given year is a leap year

fun leap-year(year :: Number) -> Boolean:
  doc: "determins if a given year is a leap year"
  ((num-modulo(year, 4) == 0) and (num-modulo(year, 100) <> 0)) or (num-modulo(year, 400) == 0)
where:
  leap-year(2000) is true
  leap-year(1900) is false
  leap-year(2024) is true
  leap-year(2023) is false
end

#Problem 2 - takes a number of seconds and returns the next second

fun second-tick(seconds :: Number) -> Number:
  doc: "takes the number of seconds and increases the input bu 1"
  if seconds < 59:
    seconds + 1
  else if seconds == 59:
    0
  else:
    "error"
  end
where:
  second-tick(0) is 1
  second-tick(59) is 0
  second-tick(10) is 11
end

#Problem 3 - Rock, Paper, Scissors

fun rock-paper-sissors(player1 :: String, player2 :: String) -> String:
  doc: "Determines the winner of a game of rock, paper, sissors"
  if player1 == player2:
    "It's a tie."
  else if (player1 == 'paper') and (player2 == 'rock'):
    "player 1 wins"
  else if (player1 == 'sissors') and (player2 == 'paper'):
    "player 1 wins"
  else if (player1 == 'rock') and (player2 == 'sissors'):
    "player 1 wins"
  else if (player2 == 'paper') and (player1 == 'rock'):
    "player 2 wins"
  else if (player2 == 'sissors') and (player1 == 'paper'):
    "player 2 wins"
  else if (player2 == 'rock') and (player1 == 'sissors'):
    "player 2 wins"
  else:
    "invalid choice"
  end
where:
    rock-paper-sissors('rock', 'rock') is "It's a tie."
    rock-paper-sissors('paper', 'rock') is "player 1 wins"
    rock-paper-sissors('paper', 'sissors') is "player 2 wins"
    rock-paper-sissors('sissors', 'rock') is "player 2 wins"
    rock-paper-sissors('rock', 'spock') is "invalid choice"
end

#Problem 4 - Planet table

planet = table: Planet :: String, Distance :: Number
  row: "Mercury", 0.39
  row: "Venus", 0.72
  row: "Earth", 1
  row: "Mars", 1.52
  row: "Jupiter", 5.2
  row: "Saturn", 9.54
  row: "Uranus", 19.2
  row: "Neptune", 30.06
end

mars = planet.row-n(3)
mars["Distance"]

#Problem 5 - Official Bank Rate history data from the Bank of England (1844-)

