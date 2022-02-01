from random import random
'''
function builds tuple with items to take for the intruder
'''
def build_items(n):
    res = []
    for i in range(n):
        res.append((i, 1+int(9*random()), 1+int(9*random())))
    return res


'''
generates function to iterate through every item combination in the set
'''
def powerset(items):
    res = [[]]
    for item in items:
        newset = [r+[item] for r in res]
        res.extend(newset) #extend adds the specified list elements to the end of the current list
    return res

'''
the algorithm, iterates through all item combinations and returns the best sets to take
'''
def knapsack_brute_force(items, max_weight):
    knapsack = []
    best_weight =0
    best_value = 0
    for item_set in powerset(items):
        set_weight = sum([e[1] for e in item_set])
        set_value = sum([e[2] for e in item_set])
        if set_value > best_value and set_weight <= max_weight:
            best_value = set_value
            best_weight = set_weight
            knapsack = item_set
    return knapsack, best_weight, best_value


#items = [(id, weight, value)]
n = 25
items_to_take = build_items(n)
print("computing", 2**n, "powersets")
print("items_to_take", items_to_take)
max_w = 10
kn, opt_w, opt_v = knapsack_brute_force(items_to_take, max_w)
print("\nthe contents of the knapsack are:", kn)
print("the optimal weight is:", opt_w)
print("the optimal value is:", opt_v)