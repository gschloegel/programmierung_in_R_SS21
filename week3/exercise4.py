#!/usr/bin/env python

import math

M = ((0, 150, 80, math.inf, 90), 
     (150, 0, 100, 125, 100),
      (80, 100, 0, 50, 125),
      (math.inf, 125, 50, 0, 100),
      (90, 100, 125, 100, 0))

min_distance = math.inf
shortest_path = []

path = [([0], 0)]  # visited_places, distance

while path:
    visited_places, distance = path.pop()
    if len(visited_places) == 5:
        distance += M[visited_places[-1]][0]
        if distance < min_distance:
            min_distance = distance
            shortest_path = visited_places
    else:
        for i in set(range(5)) - set(visited_places):
            new_distance = distance + M[visited_places[-1]][i]
            if new_distance < min_distance:
                path.append((visited_places + [i], new_distance))

print(f"Der Kürzeste Pfad ist {[i + 1 for i in shortest_path]} und hat die Länge {min_distance}")