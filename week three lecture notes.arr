use context dcic2024
#for lecture two
include csv
include data-source

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


recipes = load-table:
  title :: String,
  servings :: Number,
  prep-time :: Number
  source: csv-table-url("https://raw.githubusercontent.com/NU-London/LCSCI4207-datasets/refs/heads/main/recipes.csv", default-options)
end

world-bank = load-table:
  country :: String,
  life-exp :: Number,
  gdp :: Number
  source: csv-table-url("https://raw.githubusercontent.com/NU-London/LCSCI4207-datasets/refs/heads/main/life_exp_gdp.csv", default-options)
  sanitize life-exp using num-sanitizer
  sanitize gdp using num-sanitizer
end

#lr-plot(world-bank, "gdp", "life-exp")

#Lecture 2 - Class Exercises
class-exercises = load-table:
  plant-common-name :: String,
  location-latitude :: Number,
  location-logitude :: Number,
  date-sighted :: Number,
  soil-type :: String,
  plant-height-cm :: Number,
  plant-color :: String
  source: csv-table-url("https://raw.githubusercontent.com/NU-London/LCSCI4207-datasets/refs/heads/main/plant_sightings.csv", default-options)
end

glucose-levels = load-table:
  patient_id :: Number,
  glucose_level :: Number,
  date_time :: Number,
  insulin_dose :: Number,
  exercise_duration :: Number,
  stress_level :: Number
  source: csv-table-file("datasets/glucose_levels.csv", default-options)
end