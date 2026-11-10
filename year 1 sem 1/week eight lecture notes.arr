use context dcic2024

#Lecture one notes

#LAST DAY OF PYRET!!!!!!!#

data Comment:
    comment(author :: String, text :: String, likes :: Number, replies :: List<Comment>)
end

r1 = comment("@user1", " I am feeling anxious", 4, [list: ])
c1 = comment("@user2", "We are about to get our grades", 15, [list: r1])
c2 = comment("@user3", "One of the greatest comebacks!!! #GOAT", 30, [list: ])
r2 = comment("@user45", "Today is super cold!!! Hot Chocolate?", 5, [list: ])
r3 = comment("@user65", "I am very happy today", 40, [list: ])
c3 = comment("@user7", "The London weather is not for everyone", 3, [list: r2, r3])

thread = comment("@user54", "Thunderstorm warning for Thursday", 120, [list: c1, c2, c3])

fun count-comments-list(cs :: List<Comment>) -> Number:
  doc: "how many comments are in all threads"
  cases (List) cs:
    |empty => 0
    |link(first, rest) => count-comments(first) + count-comments-list(rest)
  end
end

fun count-comments(c :: Comment) -> Number:
  doc: "How many comments are in the thread"
  1 + count-comments-list(c.replies)
where:
  count-comments(r1) is 1
  count-comments(c3) is 3
  count-comments(thread) is 7
end
  
fun count-likes(c :: Comment) -> Number:
  doc: "how many likes are in a thread"
  c.likes
where:
  count-likes(r1) is 4
  count-likes(c1) is 15
  count-likes(thread) is 120
end

#which comments got no reply?

fun no-reply(c :: Comment) -> Boolean:
  if c.replies == empty:
    true
  else:
    false
  end
where:
  no-reply(c3) is false
  no-reply(r1) is true
end
