# DNA sequence definitions dna motifs
dna1 <- "GGCGTTCAGGCA"
dna2 <- "AAGAATCAGTCA"
dna3 <- "CAAGGAGTTCGC"
dna4 <- "CACGTCAATCAC"
dna5 <- "CAATAATATTCG"

# Combining all sequences into one
dna_all <- paste(dna1, dna2, dna3, dna4, dna5, sep = "")

# Step 1: Creating a matrix from DNA sequences
dna_matrix <- matrix(unlist(strsplit(dna_all, "")), nrow = 5, ncol = 6, byrow = TRUE)

# Step 2: Creation of the profile matrix (for k = 3)
profile_matrix <- dna_matrix[, c(1, 2, 3)]
profile_df <- as.data.frame(profile_matrix)

# Step 2.1: Creation of a counting matrix
lvls <- c("G", "A", "C", "T")
freq <- sapply(profile_df, function(x) table(factor(x, levels = lvls, ordered = TRUE)))

# Step 2.2: Standardisation
profile_normalized <- sweep(freq, 2, colSums(freq), FUN = "/")

# Step 3: Function to calculate the best result for a given k-mer
high_score <- function(kmer_dna) {
  kmer_dna_split <- strsplit(kmer_dna, "")[[1]]
  score <- 1
  best_score <- 0
  
  for (i in 1:3) {
    sub_score <- 0
    
    if (kmer_dna_split[i] == "G") sub_score <- profile_normalized[1, i]
    if (kmer_dna_split[i] == "A") sub_score <- profile_normalized[2, i]
    if (kmer_dna_split[i] == "C") sub_score <- profile_normalized[3, i]
    if (kmer_dna_split[i] == "T") sub_score <- profile_normalized[4, i]
    
    score <- 1 * sub_score * score
  }
  
  list_score <- c(score, kmer_dna)
  return(list_score)
}

# Step 4: Calculation of the best result
best_score <- 0
dna_score <- ""

for (i in 1:10) {
  end_of_range <- i + 2
  score <- high_score(paste(dna_matrix[1, c(i:end_of_range)], collapse = ""))
  
  if (best_score < score[1]) {
    best_score <- score[1]
    dna_score <- score[2:4]
  }
}

# Step 5: Writing out the best score and k-means
print("The best score:")
print(best_score)
print("The best k-mer:")
print(dna_score)
