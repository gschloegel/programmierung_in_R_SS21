# 1
F <- function(k) {
  if (k == 1){
    return(8)
  } else if (k == 2) {
    return(7)
  } else {
    return(3*F(k-1)+5*F(k-2))
  }
}
F(12)

# 2

y <- function(t) {
  g <- 9.8065
  k <- 0.00341
  return(log(cosh(t * (g*k)^(1/2))) / k)
}

t = pretty(c(0,10),1000)
plot(t,y(t), type = "l", xlab = "time", ylab = "vertical distance", main = "Free Fall")

uniroot(y,c(0,8))

#3
bible <- scan(file = "KingJames.txt", what = "character", sep = "\n")
word_list <- unlist(strsplit(bible, split = " "))
word_list <- tolower(word_list)

median(nchar(word_list))

word_list[order(nchar(word_list), decreasing = T)[7]]

word_table <- sort(table(word_list), decreasing = T)
word_table[8]

mean(word_table)

barplot(word_table[1:4], main = "4 most common words")
