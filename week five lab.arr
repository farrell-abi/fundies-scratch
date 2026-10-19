use context dcic2024
include csv
include data-source

#| 
   
   Task Plan:
  Inputs: tailnum, dep_delay, arr_delay, flight, carrier, dep-time, distance, air_time
   
   Outputs: cleaned table, duplicate counts, airline column, outlier-free table, 3 charts, total/average/max distance
   
   Steps:
1. Problem: numeric columns loaded as strings
   Step - num-sanitizer in load table
2. Problem: tailnum has empty values
   Step - transform column, replace "" with "UNKNOWN"
3. Problem: negative dep_delay / arr_delay.
   Step: transform-column, replace values < 0 with 0.
4. Problem: duplicates are hard to spot.
   Step: build-column dedup_key = flight + "-" + CARRIER + "-" + HH:MM, using helpers (trim, format-time) inside one lam.
5. Step: count dedup_key, keep counts > 1 to show duplicates.
6. Step: build-column airline using a carrier->name helper.
7. Step: filter-with to remove distance/air_time outliers.
8. Step: draw bar chart, histogram, scatter plot.
9. Step: extract distance as a list; for each loop for total/avg/max.
   
|#

flight_53 = load-table:
  rownames :: Number,
  dep_time :: Number,
  sched_dep_time :: Number,
  dep_delay :: Number,
  arr_time :: Number,
  sched_arr_time :: Number,
  arr_delay :: Number,
  carrier :: String,
  flight :: String,
  tailnum :: String,
  origin :: String,
  dest :: String,
  air_time :: Number,
  distance :: Number,
  hour :: Number,
  minute :: Number,
  time_hour :: String
  source: csv-table-file("datasets/flights_sample53.csv",default-options)
  sanitize rownames using num-sanitizer
  sanitize dep_time using num-sanitizer
  sanitize sched_dep_time using num-sanitizer
  sanitize dep_delay using num-sanitizer
  sanitize arr_time using num-sanitizer
  sanitize sched_arr_time using num-sanitizer
  sanitize arr_delay using num-sanitizer
  sanitize air_time using num-sanitizer
  sanitize distance using num-sanitizer
  sanitize hour using num-sanitizer
  sanitize minute using num-sanitizer
end

#TASK 2

# 1. Missing tailnum -> "UNKNOWN"
fun fix-tailnum(s :: String) -> String:
  doc: "replace the empty tail number with UNKNOWN."
  if s == "":
    "UNKNOWN"
  else:
    s
  end
end

# 2. Negative delays -> 0
fun floor-zero(n :: Number) -> Number:
  doc: "replace a negative number with 0"
  if n < 0:
    0
  else:
    n
  end
end

step1 = transform-column(flight_53, "tailnum", fix-tailnum)
step2 = transform-column(step1, "dep_delay", floor-zero)
step3 = transform-column(step2, "arr_delay", floor-zero)

# 3. Helpers for dedup_key
fun trim(s :: String) -> String:
  doc: "remove spaces from a given string"
  n = string-length(s)
  if n == 0:
    ""
  else:
    string-replace(s, " ", "")
  end
end

fun two-digits(n :: Number) -> String:
  doc: "convert a number to a string, padding with a leading 0 if below 10"
  if n < 10:
    "0" + num-to-string(n)
  else:
    num-to-string(n)
  end
end

fun format-time(t :: Number) -> String:
  doc: "convert a time like 517 to the string '05:17'"
  hours = num-floor(t / 100)
  minutes = num-modulo(t, 100)
  two-digits(hours) + ":" + two-digits(minutes)
end

cleaned = build-column(step3, "dedup_key", lam(r :: Row) -> String: 
    r["flight"] + "-"
      + string-to-upper(trim(r["carrier"])) + "-"
    + format-time(r["dep_time"]) end)

# 4. group and count; keep keys that occur more than once
key-counts = count(cleaned, "dedup_key")
duplicates = filter-with(key-counts, lam(r :: Row) -> Boolean: r["count"] > 1 end)
duplicates

# TASK 3

fun carrier-to-airline(code :: String) -> String:
  doc: "map a carrier code to its full airline name"
  if code == "UA": "United Airlines"
  else if code == "AA": "American Airlines"
  else if code == "B6": "JetBlue"
  else if code == "DL": "Delta Air Lines"
  else if code == "EV": "ExpressJet"
  else if code == "WN": "Southwest Airlines"
  else if code == "OO": "SkyWest Airlines"
  else: "Other"
  end
end

with-airline = build-column(cleaned, "airline",
  lam(r :: Row) -> String: carrier-to-airline(string-to-upper(trim(r["carrier"]))) end)

# keep realistic rows only
final = filter-with(with-airline,
  lam(r :: Row) -> Boolean:
    (r["distance"] <= 5000) and (r["air_time"] <= 500)
  end)

# TASK 4

freq-bar-chart(final, "airline")
histogram(final, "distance", 250)
scatter-plot(final, "distance", "air_time")

dists = extract distance from final end

