use context starter2024
#LECTURE 1 - class exercises
fun choose-hat(temp-in-C :: Number) -> String:
  doc: "determines appropriate head gear, with above 27C a sun hat, below 10C a winter hat"
  spy:
    temp-in-C,
    comparison: temp-in-C >= 30,
    comparison: temp-in-C <= 10
  end
  if temp-in-C >= 30:
    "sun hat"
  else if temp-in-C <= 10:
    "winter hat"
  else:
    "no hat"
  end
where:
  choose-hat(25) is "no hat"
  choose-hat(32) is "sun hat"
  choose-hat(30) is "sun hat"
  choose-hat(10) is "winter hat"
  choose-hat(1) is "winter hat"
end

fun add-glasses(s :: String) -> String:
  string-append(s, "and glasses")
end

fun choose-outfit(temp-in-C :: Number) -> String:
  s = choose-hat(temp-in-C)
  add-glasses(s)
end

#LECTURE 2 - something about tabels
workouts = table: date :: String, activity :: String, duration :: Number
  row: "2025-04-01", "Running", 30
  row: "2025-04-02", "Yoga", 45
  row: "2025-04-03", "Cycling", 60
end

check:
  table: date :: String, activity :: String, duration :: Number
    row: "2025-04-01", "Running", 30
  row: "2025-04-02", "Yoga", 45
  row: "2025-04-03", "Cycling", 60
  end
  is-not
  table: date :: String, activity :: String, duration :: Number
    row: "2025-04-03", "Cycling", 60
    row: "2025-04-01", "Running", 30
    row: "2025-04-02", "Yoga", 45
  end
end

#| extracting rows and column values from a table - table-identifier.row-n(N) for some N. the first row is numbered 0. From a row, extract colum values using 
   row-identifier["column-name"]|#

second-workout = workouts.row-n(1)
second-workout["activity"] # -> 'Yoga'
workouts.row-n(1)['duration'] # -> 45