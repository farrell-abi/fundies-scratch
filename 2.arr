use context starter2024
#String testing/notes#
a = 'Hello World'
a

string-length(a)
string-repeat(a, 3)

"CS" + "2000"

b = a + " "

string-repeat(b, 3)

#to convert all string characters to upper case
string-to-upper("hello cs2000!") # -> HELLO CS2000!
string-toupper("hellow cs2000!") # same thing

#to convert all string characters to lower case
string-to-lower("WELCOME TO CS2000!")

string-substring("welcome to london", 0, 7) # -> welcome

sample_string = "Hello, how are you? My name is Blarf, and I am from the planet Krypton."

#to check if certain characters exist in a string
string-contains(sample_string, "Blarf")
string-contains(sample_string, "Bland")
string-contains(sample_string, "blarf")

#case sensitive testing
SAMPLE_STRING = string-to-upper(sample_string)
SAMPLE_STRING

string-contains(SAMPLE_STRING, "BLARF")
string-contains(SAMPLE_STRING, 'blarf')
#end string testing/notes#

#Image testing/notes#
circle(30, "solid", "green")
rectangle(80, 40, "solid", "orange")
triangle(50, 'outline', 'purple')

#composition, each of these takes two images and gives back one image
circle(30, 'solid', 'blue')
rectangle(80, 60, 'solid', 'yellow')
overlay(circle(30, 'solid', 'blue'), rectangle(80, 60, 'solid', 'yellow'))

#FUNCTIONS#

#overlay((first image), (second image))
#above((first image), (second image))
#below((first image), (second image))
#beside((first image), (second image))

#function testing
above(rectangle(80, 60, 'solid', 'yellow'), circle(20, 'outline', 'pink'))
below(triangle(90, 'solid', 'red'), rectangle(40, 40, 'outline', 'blue'))
beside(circle(40, 'outline', 'green'), triangle(50, 'solid', 'purple'))

#fuck off bksjfbaeoiugh
