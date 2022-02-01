dna_all <- "GACTATGGCACGAACATCGACGTACGCAAC"
dna_stringSplit <- strsplit(dna_all,"")[[1]]
#1. create a dna matrix
dna_matrix <- matrix(dna_stringSplit, nrow=5, ncol = 6,
                     byrow = TRUE)
g_row <- c()
a_row <- c()
t_row <- c()
c_row <- c()
for (i in (1:ncol(dna_matrix))){
g_score <- 0
t_score <- 0
a_score <- 0
c_score <- 0
  for(j in (1:nrow(dna_matrix))){
    if(dna_matrix[j,i] == "G"){ g_score <- g_score + 1}
    if(dna_matrix[j,i] == "T"){ t_score <- t_score + 1}
    if(dna_matrix[j,i] == "A"){ a_score <- a_score + 1}
    if(dna_matrix[j,i] == "C"){ c_score <- c_score + 1}
  }
  g_row <- append(g_row, g_score)
  t_row <- append(t_row, t_score)
  a_row <- append(a_row, a_score)
  c_row <- append(c_row, c_score)
}
#looking for max in every column
score_row <- c()
motif <- c()
for (k in 1:6){
  temp_row <- c(g_row[k], a_row[k], t_row[k], c_row[k])
  nucleotide <- c("G", "A", "T", "C")
  motif <- append(motif, nucleotide[which.max(temp_row)])
  score_row<- append(score_row, max(temp_row))
}

print(motif)