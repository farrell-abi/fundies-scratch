use context starter2024
include image
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