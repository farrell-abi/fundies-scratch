use context dcic2024

#Lecture one

#structured data

data BookRecord:
    book(title :: String, author :: String, pages :: Number)
end

the-dispossessed = book("The Dispossessed", "Ursuka J. Le Guin", 387)
to-the-lighthouse = book("To The Lighthouse", "Virginia Woolf", 209)
brave-new-world = book("Brave New World", "Aldous Huxley", 268)

borrowed-books :: List<BookRecord> = [list: the-dispossessed, brave-new-world]

the-dispossessed.pages #-> 387

fun hours-to-read(b :: BookRecord) -> Number:
  pages-per-hour = 0.83 * 60
  b.pages / pages-per-hour
end

data Priority:
  | low
  | medium
  | high
end

task-1-priority = low
task-2-priority = medium
task-3-priority = high

check:
  is-Priority(task-1-priority) is true
  is-low(task-1-priority) is true
  is-medium(task-2-priority) is true
  is-high(task-3-priority) is true
end

data Task:
  | task(description :: String, priority :: Priority)
  | note(description :: String)
end

task-1 = task("Buy groceries", low)
task-2 = task("Pay council tax", high)
note-1 = note("Post Office closes at 4:30")

fun describe(t :: Task) -> String:
  cases (Task) t:
    | task(d, p) => "TASK: " + d
    | note(d) => "NOTE: " + d
  end
end

describe(task-1)
describe(note-1)

fun priority-to-string(p :: Priority) -> String:
  cases (Priority) p:
    | low => "❕TASK:"
    | medium => "❗️TASK:"
    | high => "‼️ TASK:"
  end
end

fun describe-1(t :: Task) -> String:
  cases (Task) t:
    | task(d, p) => priority-to-string(p) + " " + d
    | note(d) => "📝 " + d
  end
end

describe-1(task-1)
describe-1(task-2)
describe-1(note-1)

#Lecutre two

#link list

#[list: 2, 3, 4, 5, 6]

#[list: 2] first ; [list: 3, 4, 5, 6]

#|
   cases(List) l:
   | empty => ... #the answer for no lements
   | link(f, r) => ... #combine f with the answer for r
   end
|#

[list: 1, 2, 3].first #1
[list: 1, 2, 3].rest #[list: 2, 3]
[list: 1].rest #[list: ]
is-link([list: 1, 2, 3].rest) #true
is-empty([list: ]) #true
is-empty([list: 3].rest) #true

#building lists with link

check:
  [list: ] is empty
  [list: 1] is link(1, empty)
  [list: 1, 2] is link(1, link(2, empty))
  [list: 1, 2, 3] is link(1, link(2, link(3, empty)))
end

temp-list = link(1, link(2, link(3, empty)))
temp-list.length()

fun my-len(l):
  cases (List) l:
    | empty => 0
    | link(f, r) => 1 + my-len(r)
  end
where:
  my-len([list: 4, 5, 6, 7, 8, 9]) is 6
end

my-len([list: 3, 4])

check "some of my-len examples":
  my-len([list: 1, 2, 3]) is 3
  my-len([list: ]) is 0
  my-len([list: 7, 8, 9]) is 1 + my-len([list: 8, 9])
  my-len([list: 9]) is 1 + my-len([list: 9].rest)
end

fun my-sum(l):
  cases (List) l:
    |empty => 0
    |link(f, r) => f + my-sum(r)
  end
where:
  my-sum([list: 1, 2, 3]) is 6
  my-sum([list: ]) is 0
end