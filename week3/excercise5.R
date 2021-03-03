data <- data.frame(weight = c(3, 7, 4, 12, 8, 10, 9, 14 , 10, 12), 
                   value = c(3, 5, 2, 11, 4, 6, 2, 15, 12, 9))

# variant 1, recursive, very inefficient

max.value <- 0
max.content <- 0

content <- rep(F, length(data$weight))
max.weight <- 60
               
get_maximum <- function(content, value, weight) {
  possible.additions <- !content & data$weight <= (max.weight - weight)
  if (all(possible.additions == F)) {
    # base case
    if (value > max.value) {
      max.value <<- value
      max.content <<- content
    }
  } else {
    # recursive case
    for (i in which(possible.additions)) {
    new.value <- value + data$value[i]
    new.weight <- weight + data$weight[i]
    new.content <- content
    new.content[i] <- T
    get_maximum(new.content, new.value, new.weight)
    }
  }
}               

get_maximum(content, 0, 0)
max.value
max.content

# variant 2, more efficient

data <- data.frame(weight = c(3, 7, 4, 12, 8, 10, 9, 14 , 10, 12), 
                   value = c(3, 5, 2, 11, 4, 6, 2, 15, 12, 9))

# global variables
max.value <- 0
max.content <- 0


get_max <- function(content, weight) {
  # recursive function to create all possible values
  if (length(content) == length(data$weight)) {
    # base case, reached end of list
    content <- append(content, rep(F, length(data$weight) - length(content)))
    value <- sum(data$value[content])
    if (value > max.value) {
      max.value <<- value
      max.content <<- content
    }
  } else {
    # recursive case append list, do not add item if it exceeds the weight limit
    get_max(append(content, F), weight)
    new.weight <- weight + data$weight[length(content) + 1]
    if (new.weight <= max.weight) {
      get_max(append(content, T), new.weight)
    }
  }
}

max.weight <- 60
get_max(c(), 0)
max.value  # value of the optimal packager
which(max.content) # items in the optimal package
sum(data$weight[max.content]) # weight of the optimal package
