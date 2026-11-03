use context dcic2024
#Abigail Farrell#

#Task one#

#will give the value 3.75
fun bike-ride(m :: Number) -> Number:
  m * 0.15
end
bike-ride(25) #-> 3.75
#3.75 = 3.75

# will run as "Electric bike"
"Electric" + " " + "bike"
#they are the same

#will give 9
string-length("handlebar") #-> 9
#9 = 9

#Task two#

minute-rate = 0.15 #Exactnum
fun ride-cost(l :: Number, p :: Number) -> Number:
  doc:"determines the price of a ride given length of ride and price per minute"
  l * p
where:
  ride-cost(25, minute-rate) is 3.75
  ride-cost(5, 0.10) is 0.50
end

#Task three#
fun ride-discount(n :: Number) -> Number:
  if n < 30:
    0
  else if (n >= 30) and (n < 60):
    0.1
  else:
    0.2
  end 
where:
  ride-discount(29) is 0
  ride-discount(30) is 0.1
  ride-discount(59) is 0.1
  ride-discount(60) is 0.2
end

#Task four#
rides = table: rider, minutes, rate
  row: "Ella", 20, 0.15
  row: "Farid", 45, 0.10
  row: "Grace", 70, 0.10
  row: "Hugo", 10, 0.20
end

fun cost(r :: Row) -> Number:
  r["minutes"] * r["rate"]
end

rides.build-column("cost", cost)

fun ride-filter(q :: Number) -> Boolean:
  if q >= 30:
    true
  else:
    false
  end
end
rides.transform-column("minutes", ride-filter)

#The two riders left are Farid and Grace

#Task five#
minute-list = rides.get-column("minutes")

#Taks six#
data Ride:
  | pedal-bike(minutes :: Number)
  | e-bike(minutes :: Number, has-pass :: Boolean)
end

fun battery-fee(r :: Ride) -> Number:
  cases (Ride) r:
    | pedal-bike(m) => 0
    | e-bike(m, pass) =>
      if pass:
        0
      else:
        m * 0.05
      end
  end
where:
  battery-fee(pedal-bike(30)) is 0
  battery-fee(e-bike(20, true)) is 0
  battery-fee(e-bike(20, false)) is 1
  battery-fee(e-bike(0, false)) is 0
end