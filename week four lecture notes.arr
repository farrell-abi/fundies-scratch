use context dcic2024
include csv
include data-source

#Lecture one notes

orders = table: time, amount
  row: "08:00", 10.50
  row: "09:30", 5.75
  row: "10:15", 8.00
  row: "11:00", 3.95
  row: "14:00", 4.95
  row: "16:45", 7.95
end

fun is-high-value(o :: Row) -> Boolean:
  o['amount'] >= 8.0
where:
  is-high-value(orders.row-n(2)) is true
  is-high-value(orders.row-n(3)) is false
end

new-high-orders = filter-with(orders, is-high-value)

#filter-with(orders, lam(o): o['amount'] >= 8.0 end)

order-by(orders, 'amount', true) # -> accending order

order-by(orders, 'amount', false) # -> decending order

#Lecture one class exercises

fun is-morning(t :: Number) -> String:
  if (t >= 0000) and (t < 1200):
    "it is Morning"
  else if (t >= 1200) and (t <= 2359):
    "It is afternoon"
  else:
    "invalid input"
  end
where:
  is-morning(0000) is "it is Morning"
  is-morning(1200) is "It is afternoon"
  is-morning(1201) is "It is afternoon"
  is-morning(2400) is "invalid input"
end

is-also-morning = load-table: 
  time :: Number, 
  is_morning :: Boolean
  source:csv-table-file("datasets/times_of_day.csv", default-options)
end

order-by(is-also-morning, 'time', false)

#I dont know what im doing here