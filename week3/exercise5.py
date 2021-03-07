#!/usr/bin/env python

weights = [3, 7, 4, 12, 8, 10, 9, 14 , 10, 12]
values = [3, 5, 2, 11, 4, 6, 2, 15, 12, 9]

max_value = 0
max_content = []
max_weight = 60

dataset = [[[], 0, 0]]  # items, weight, value

while dataset:
    items, weight, value = dataset.pop()
    if len(items) == len(weights):
        if value > max_value:
            max_value = value
            max_content = items
            opt_weight = weight
    else:
        dataset.append([items + [False], weight, value])
        weight += weights[len(items)]
        if weight <= max_weight:
            value += values[len(items)]
            dataset.append([items + [True], weight, value])

print(f"value = {max_value}")
print(f"weight = {opt_weight}")
packed_items = [i+1 for i, x in enumerate(max_content) if x]
print(f"content = {packed_items}")
