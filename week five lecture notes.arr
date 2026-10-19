use context dcic2024
include csv
include data-source

import math as M
import statistics as S
#Lecture 1

#| plan a task before coding it 
   finding and cleaning dirty data
   visualisation |#

#task plan is a to-do list that you can check off
#|
   input = columns you start from
   output = a concrete example of what you want at the end
   steps = small enough that each one is a sigle function or table operation
   tools = the operation for each step: filter-with, transform column
|#


#load voter data

voter-data =
  load-table: VoterID,DOB,Party,Address,City,County,Postcode
  source: csv-table-url("https://raw.githubusercontent.com/NU-London/LCSCI4207-datasets/refs/heads/main/voters.csv", default-options)
end

voter-data.row-n(0)["VoterID"]

#confirm the party problem
filter-with(voter-data, lam(r): r["Party"] == "Labour" end).length()

voter-data.row-n(3)["Party"]

#reading one value from a row
fun get-column(r :: Row, colname :: String):
  doc: "returns the value in row r for the column colname"
  r[colname]
where:
  get-column(voter-data.row-n(3), "Party") is "Labuor"
  get-column(voter-data.row-n(0), "VoterID") is "1"
end

filter-with(voter-data, lam(r): get-column(r, "Party") == "Labour" end).length()

get-column(voter-data.row-n(3), "Party")

with-year = build-column(voter-data, "BirthYear", lam(r): string-substring(get-column(r, "DOB"), 6, 10) end)

get-column(with-year.row-n(0), "BirthYear")

#Lecture 2
#extracting columns as lists
cafe-data = table: day, drinks-sold
  row: "Mon", 45
  row: "Tue", 30
  row: "Wed", 55
  row: "Thu", 40
  row: "Fri", 60
end

cafe-data.get-column("drinks-sold")
get-column(cafe-data.row-n(0), "drinks-sold")

sample-list = [list: 10, 20, 30]
empty-list = [list: ]

#Math and Satistics Libraries

sales = cafe-data.get-column("drinks-sold")
M.max(sales)
S.mean(sales)
M.sum(sales)

#operating on lists

discount-codes = [list: "NEWYEAR", "student", "NONE", "student", "VIP", "none"]
unique-codes = distinct(discount-codes)

fun is-real-code(code :: String) -> Boolean:
  not(string-to-lower(code) == "none")
end

real-codes = filter(is-real-code, unique-codes)
first-code = real-codes.get(0)
lower-codes = map(string-to-lower, real-codes)

#calling an unnamed function directly

(lam(x): x * 2 end)(5)

lam(x): x * 2 end(5)

(lam(s :: String) -> Boolean: string-legth(s) > 3 end)("Pyret")

double = lam(x): x * 2 end
double(5)

#mutable variables
var total = 1
total := total + 10
total

var my-var = initial-value
#for each(my-elt from my-list):
  #code to handle my-elt
  #and update my-var
#end
my-var #final result

fun my-sum(num-list :: List) -> Number block:
  var total = 0
  for each(n from num-lsit):
    total := total + n
  end
  total
where:
my-sum([list: 0, 1, 2, 3]) is 6
end

fun func(lst :: List) block:
  var result = ... #what to return if the input list is empty
  for each(item from lst):
    #combine item with the result so far
    result := ... item ... result
  end
  result
end