M <- rbind(c(0, 150, 80, Inf, 90), 
           c(150, 0, 100, 125, 100),
           c(80, 100, 0, 50, 125),
           c(Inf, 125, 50, 0, 100),
           c(90, 100, 125, 100, 0))

min.distance <- Inf
shortest.path <- c()

get_dist <- function(visited.places, dist) {
  if (all(1:5 %in% visited.places)) {
    # base case, all 5 places are already visited
    dist <- dist + M[1, tail(visited.places, 1)]  # add distance to 1 first item to complete the loop
    if (dist < min.distance) {
      min.distance <<- dist
      shortest.path <<- visited.places
    }
  } else {
    # recursive case, extend path
    for (i in subset(1:5, !(1:5 %in% visited.places))) {
      new.dist <- dist + M[i, tail(visited.places, 1)]
      if (new.dist < min.dist) {
        get_dist(append(visited.places, i), new.dist)
      }
    }
  }
}

get_dist(1, 0)
min.distance
shortest.path

