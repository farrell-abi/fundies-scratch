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

#Lecture two

#|the two opwerations:
   1 - transform-column:
   your function takes: one value
   you get back: same columns, new values in one
   
   2 - build-column:
   your function: one whole Row
   you get back: one extra column|#

sales = table: item :: String, price :: Number, qty :: Number
  row: "Tea", 2.50, 4
  row: "Coffee", 3.00, 2
  row: "Cake", 4.25, 3
end

#Transform column
#add VAT to every price
fun add-vat(p :: Number) -> Number:
  doc: "returns the price with 20 percent VAT added"
  p * 1.2
where:
  add-vat(10) is 12
  add-vat(0) is 0
end

with-vat = transform-column(sales, "price", add-vat)
sales.get-column("price")
with-vat.get-column("price")

also-with-vat = transform-column(sales, "price", lam(v): v * 1.2 end)
also-with-vat.get-column("price")

#build column
fun line-total(r :: Row) -> Number:
  doc: "returns price times quantity for one order line"
  r["price"] * r["qty"]
where:
  line-total(sales.row-n(0)) is 10
  line-total(sales.row-n(2)) is 12.75
end

with-total = build-column(sales, "total", line-total)
with-total.get-column("total")

fun total-w-vat(r :: Row) -> Number:
  doc: "returns the total with vat included"
  r['price'] * r['qty'] * 1.2
where:
  total-w-vat(sales.row-n(0)) is 12
end

final-total = build-column(sales, "final total", total-w-vat)
final-total.get-column("final total")

#chain the two together, operations compose, because each returns a table
# ADD VAT, then total the VAT-inclusive prices

billed = build-column(transform-column(sales, "price", add-vat), "total", line-total)
billed