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

#LECTURE 2