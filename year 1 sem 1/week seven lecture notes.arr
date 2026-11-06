use context dcic2024

#Lecture one Notes

#| List Processing:
   * Scalar Processing: produce a value that scales with the traversal
   *Transformation: Produce a new list
   Selection:
   *select element from a list using a given criteria
   **value-based selection: filtering lists based on element properties
   **position-based selection: choosing elements according to ther location in the list
   Relaxed Domains:
   *handle edge cases and data validation
   **what should we do whena list does not have enough elements to perform the operation?
   Accumulators:
   *pass along ectra information with out tecursion to form a memory of previous actions
   **what is the biggest number we have encountered
   **out position in the list
|#

#Value-based Selection
fun my-pos-nums(l :: List<Number>) -> List<Number>:
  cases (List) l:
    | empty => empty
    | link(f, r) =>
      if f > 0:
        link(f, my-pos-nums(r))
      else:
        my-pos-nums(r)
      end
  end
end

check:
  my-pos-nums([list: 1, -2, 3, -4]) is [list: 1, 3]
  
  my-pos-nums([list: 1, -2, 3, -4]) is link(1, my-pos-nums([list: -2, 3, -4]))
my-pos-nums([list:    -2, 3, -4]) is         my-pos-nums([list:     3, -4])
my-pos-nums([list:        3, -4]) is link(3, my-pos-nums([list:        -4]))
my-pos-nums([list:           -4]) is         my-pos-nums([list:          ])
my-pos-nums([list:             ]) is         [list: ]
  
  # link
my-pos-nums([list: 1, -2, 3, -4]) is link(1, my-pos-nums([list: -2, 3, -4]))
my-pos-nums([list:        3, -4]) is link(3, my-pos-nums([list:        -4]))

# rest
my-pos-nums([list:    -2, 3, -4]) is         my-pos-nums([list:     3, -4])
my-pos-nums([list:           -4]) is         my-pos-nums([list:          ])
end

#Position-based Selection
fun my-alternating(l :: List<Number>) -> List<Number>:
  cases (List) l:
    |empty => empty
    |link(f, r) =>
      cases (List) r:
        |empty => [list: f]
        |link(fr, rr) =>
          #fr = first of rest, rr = rest of rest
          #we are not going to use fr, instead call the function on rr
          link(f, my-alternating(rr))
      end
  end
end

check:
  my-alternating([list: 1, 2, 3, 4, 5, 6]) is [list: 1, 3, 5]
  my-alternating([list:   2, 3, 4, 5, 6]) is [list: 2, 4, 6]
  my-alternating([list:       3, 4, 5, 6]) is [list:    3, 5]
  my-alternating([list:          4, 5, 6]) is [list:    4, 6]
end

#Structural Problem over Relaxed Domains


#Lecture two Notes

#|
fun f(fp :: Footprint) -> ...:
cases
| split(name, left, right) => ... f(left) ... f(right) ...
|activity (name, kg)
|#

data Footprint:
