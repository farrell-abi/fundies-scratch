use context starter2024
#|T-Shirt Shop
Note: for the sake of my sanity I will be using the American dollar sign ($) becuase I am too lazy to find the pound symbol and type it every time. Thank you in advance for using your imagination and pretenting it is the pound sign. :)
$12 per shirt + $3 setup fee per design|#

#Calculating Cost

#expression 1 (5 shirts/one design)
a = (5 * 12) + 3
a
#expression 2 (7 shirts/one design)
a + (2 * 12)

#| The expressions are virually the same. The second expression can also be written as {(7 * 12) + 3} so that the expressions look even closer. The only reason I used a vairable initally for the first expression is for simplicity and, thankfully, the understanding of basic multiplication.|#

#| Rectangular Poster price of poster is based on the perimiter * $0.10|#

#Perimiter of 420mm X 594mm
p = 2 * (420 + 594)
p

#Cost
p * 0.1

#| Forgetting the parentheses in the perimiter equation would cause an error becuase the two operations are 'at the same grouping level' (I do not know what this means, that is what the error message told me), which causes the system to have difficulty deciding the order of operations.|#


#String Suprises
#Tag line
"Designs for everyone!"
"Designs for everyone!"

#color inventory
"red"
'blue'
"gold"

'red' + 'blue'
#| When you add (+) string together, the words just combine/are sat next to eachother.|#

# 1 + 'blue'

#| When you add (+) 1 + 'blue', you create an error because you cannot combine a value and a string as the system processes the two inventories (idk if that is the right word) in different ways.|#

#Traffic light
r = rectangle(50, 120, "solid", "black")
b = above(circle(20, 'solid', 'red'), circle(20, 'solid', 'yellow'))
c = above(b, circle(20, 'solid', 'green'))
d = overlay-xy(c, -5, 0, r)
below(rectangle(10, 40, 'solid', 'gray'), d)

#| So I don't know who to make the black rectangle start at the top of the red circle, or alernatively, for the red circle to start at the top of the balck rectangle. Either way, I think that this is pretty good, so...|#

#Broken Code Hunt

# Goal: A rectangle with width 50 and height 20, solid black
#rectangle(50, "solid", 20, "black")
#the fix is to switch the order of the inputs to (width, height, solid/outline, color)
rectangle(50, 20, 'solid', 'black')

#circle(30, solid, 'red')
#| the issue is that the string for the opactiy is not in quotations.|#
circle(30,'solid', 'red')

#Create a Flag or Shield#
s = rotate(45, square(100, 'solid', 'gray'))
t = overlay(star(40, 'solid', 'yellow'), circle(50, "solid", 'blue'))
overlay(t, s)