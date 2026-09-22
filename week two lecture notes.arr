use context starter2024
include image

#Class excersizes

orange-triangle = triangle(35, 'solid', 'orange')
orange-triangle

side = 40
color = 'blue'
square(side, 'solid', color)
square(40, 'solid', 'blue')

yellow-circle = circle(30, "solid", 'yellow')
overlay(yellow-circle, rectangle(60, 100, 'solid', 'black'))

#define width
rect-width = 120
#define length
rect-length = 40
flag-before = above(rectangle(rect-width, rect-length, 'solid', 'red'), rectangle(rect-width, rect-length, 'solid', 'green'))

flag-before