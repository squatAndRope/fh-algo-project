list <- list("ATGT","AGGT","ATTA")

total <- 0

distanz <- function(dna1, dna2){
dna1_split <-  strsplit(dna1,"")[[1]]
dna2_split <- strsplit(dna2,"")[[1]]
sum_words <- sum(dna1_split != dna2_split)
  return (sum_words)
}

print(distanz("ATGT", "AGGT"))

totalDistanz <- function(list) {
  different <- 0
  for (i in list){ #i=1,2,3,4,
    for (j in list){ #j=1
      if(i == j)
      {
        different <- 0
      }
      else {
        different <- distanz(i,j)
        total<- total + different
      }
    }
  }
 return (total/2)
}