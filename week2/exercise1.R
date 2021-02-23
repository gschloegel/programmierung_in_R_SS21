# a)
bible <- scan(file = "KingJames.txt", what = "character", sep = "\n")

# b)
word_list <- unlist(strsplit(bible, split = " "))

# c)
length(word_list) # 822840 words

# d)
length(grep("god", word_list, ignore.case = T)) # 4787 gods

# e)
mean(nchar(word_list)) # 4.23478 chars / word

# f)
word_list[which.max(nchar(word_list))]

# g)
word_table <- sort(table(word_list), decreasing = T)
barplot(word_table[1:10], main = "10 most common words")
