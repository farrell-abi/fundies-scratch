use context dcic2024

data SensorNet:
  | hub(bandwidth :: Number, left :: SensorNet, right :: SensorNet)
  | sensor(rate :: Number)
end

# Example network
sA = sensor(60)
sB = sensor(120)
sC = sensor(45)

# You can construct larger networks like:
hub1 = hub(150, sA, sB)
core = hub(200, hub1, sC)

#Task one#
fun total-load(n :: SensorNet) -> Number:
  cases (SensorNet) n:
    |sensor(rate) => rate
    |hub(bw, l, r) => total-load(l) + total-load(r)
  end
where:
  total-load(sA) is 60
  total-load(hub1) is 180
  total-load(core) is 225
end

#Task two#
fun fits-capacities(n :: SensorNet) -> Boolean:
  cases (SensorNet) n:
    |sensor(rate) => true
    |hub(bw, l, r) =>
      (bw >= (total-load(l) + total-load(r)))
      and fits-capacities(l)
      and fits-capacities(r)
  end
where:
  fits-capacities(sA) is true
  fits-capacities(hub1) is false
  fits-capacities(core) is false
  fits-capacities(hub(225, hub(180, sA, sB), sC)) is true
end

#Task three#

fun deepest-depth(n :: SensorNet) -> Number:
  cases (SensorNet) n:
    |sensor(rate) => 0
    |hub(bw, l, r) => 1 + num-max(deepest-depth(l), deepest-depth(r))
  end
where:
  deepest-depth(sA) is 0
  deepest-depth(hub1) is 1
  deepest-depth(core) is 2
end

#Task four#

fun apply-scale(n :: SensorNet, s :: Number) -> SensorNet:
  cases (SensorNet) n:
    | sensor(rate) => sensor(rate / s)
    | hub(bw, l, r) => hub(bw, apply-scale(l, s), apply-scale(r, s))
  end
where:
  apply-scale(sA, 2) is sensor(30)
  total-load(apply-scale(core, 1.2)) is-roughly 187.5
  total-load(apply-scale(core, 2)) is-roughly 112.5
  total-load(apply-scale(hub1, 1.5)) is-roughly 120
end

# Task five#

fun worst-ratio(n :: SensorNet) -> Number:
  cases (SensorNet) n:
    | sensor(rate) => 1
    | hub(bw, l, r) =>
      here = (total-load(l) + total-load(r)) / bw
      num-max(here, num-max(worst-ratio(l), worst-ratio(r)))
  end
where:
  worst-ratio(sA) is 1
  worst-ratio(core) is-roughly 1.2
end

fun scale-to-fit(n :: SensorNet) -> SensorNet:
  s = worst-ratio(n)
  if s <= 1: n
  else: apply-scale(n, s)
  end
where:
  fits-capacities(scale-to-fit(core)) is true
  total-load(scale-to-fit(core)) is-roughly (total-load(core) / 1.2)
  scale-to-fit(hub(225, hub(180, sA, sB), sC)) is hub(225, hub(180, sA, sB), sC)
end