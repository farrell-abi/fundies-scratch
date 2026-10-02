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



#Problem 4 - Planet table



#Problem 5 - Official Bank Rate history data from the Bank of England (1844-)

