use context starter2024
#LECTURE ONE: DEFFINITIONS#
#Class excersizes

orange-triangle = triangle(35, 'solid', 'orange')

side = 40
color = 'blue'
blue-square = square(side, 'solid', color)
other-square = square(40, 'solid', 'blue')

yellow-circle = circle(30, "solid", 'yellow')
overlay(yellow-circle, rectangle(60, 100, 'solid', 'black'))

#define width
rect-width = 120
#define length
rect-length = 40
flag-before = above(rectangle(rect-width, rect-length, 'solid', 'red'), rectangle(rect-width, rect-length, 'solid', 'green'))


#LECTURE TWO: FUNCTIONS#
fun welcome(name):
  "Welcome to class, " + name
end

fun area(width, height):
  width * height
end

check:
  area(3, 20) is 3 * 20
  area(4, 50) is 4 * 50
end

#|type annotations - communicate to people reading the code what type of values we expect, but also to allow Pyret to report better errors in case of mistakes|#

fun welcome1(name :: String) -> String:
  "Welcome to class, " + name
end

#| docstrings are the second step in the design recipy and is a concise, English explanation of what the purpose of the function is. It is not necessarily how it works, but what someone who want to use it needs to know|#

fun wlecome(name :: String) -> String:
  doc: "returns a greetign addressed to the given person"
  "Welcome to class, " + name
end

#Class exercises

fun area1(width, height):
  doc: "calculates the area of a rectangle based on the inputed perameters"
  width * height
end

fun shirt-cost(text1 :: String, shirts :: Number):
  doc: "claculates the cost of the shirt order based on the number of charactes in the text and the number of shirts in the order"
  (0.10 * string-length(text1)) + (5 * shirts)
end

check:
  shirt-cost("Go Team!", 4) is 20.8
  shirt-cost('Hello World', 7) is 36.1
end

fun celsius-to-fahrenheit(Cdegrees :: Number) -> Number:
  doc: 'converts Degrees Celsius to Degrees Fahrenheit'
  (Cdegrees * 9/5) + 32
end

fun fahrenheit-to-celsius(Fdegrees :: Number) -> Number:
  doc: 'converts Degrees Fahrenheit to Degrees Celsius'
  (Fdegrees - 32) * 5/9
end

check:
  celsius-to-fahrenheit(0) is 32
  fahrenheit-to-celsius(32) is 0
end


fun flag-of-france(width :: Number, height :: Number) -> Image:
  doc: "Draws the flag of France at the given width and height"
  stripe-width = width / 3
  blue-stripe = rectangle(stripe-width, height, "solid", "blue")
  white-stripe = rectangle(stripe-width, height, "solid", "white")
  red-stripe = rectangle(stripe-width, height, "solid", "red")
  beside(blue-stripe, beside(white-stripe, red-stripe))
end

flag-of-france(300, 200)