calculateHammingDistance <- function(dna1, dna2) {
  dna1_chars <- strsplit(dna1, "")[[1]]
  dna2_chars <- strsplit(dna2, "")[[1]]
  distance <- sum(dna1_chars != dna2_chars)
  return(distance)
}

calculateTotalDistance <- function(dna_list) {
  total_distance <- 0
  num_sequences <- length(dna_list)
  for (i in 1:(num_sequences - 1)) {
    for (j in (i + 1):num_sequences) {
      sequence1 <- dna_list[i]
      sequence2 <- dna_list[j]
      difference <- calculateHammingDistance(sequence1, sequence2)
      total_distance <- total_distance + difference
    }
  }
  return(total_distance)
}

sequences <- c("ATGT", "AGGT", "ATTA")
result <- calculateTotalDistance(sequences)
cat("Total Distance:", result, "\n")
