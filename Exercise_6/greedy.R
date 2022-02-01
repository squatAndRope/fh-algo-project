dna1 < -"GGCGTTCAGGCA"
dna2 < -"AAGAATCAGTCA"
dna3 < -"CAAGGAGTTCGC"
dna4 < -"CACGTCAATCAC"
dna5 < -"CAATAATATTCG"

# dna_all <- "GGCGTTCAGGCAAAGAATCAGTCACAAGGAGTTCGCCACGTCAATCACCAATAATATTCG"
create_profile_matrix < - function(dna)
{

}
dna_all < - "GACTATGGCACGAACATCGACGTACGCAAC"
dna_stringSplit < - strsplit(dna_all, "")[[1]]
# 1. create a dna matrix
dna_matrix < - matrix(dna_stringSplit, nrow=5, ncol=6,
                      byrow=TRUE)
# 2. create a profile matrix, kmers=3
profile_matrix < - dna_matrix[, c(1, 2, 3)]  # this is greedy
profile_df < - as.data.frame(profile_matrix)
# 2.1 Create a count matrix; we should know how many A,C,G,T...
lvls < - c("G", "A", "C", "T")
freq < - sapply(profile_df,
                function(x)
table(factor(x, levels=lvls,
             ordered=TRUE)))
# 2.2 Normalisation
# N=value/total
profile_normalized < - sweep(freq, 2, colSums(freq), FUN="/")

# 3. Selecting the kmer(motif1) with highest score from first row
high_score < - function(kmer_dna)
{  # GTC 
    kmer_dna_split < - strsplit(kmer_dna, "")
print("kmer_dna_split")
print(kmer_dna_split)
print("kmer_dna")
print(kmer_dna)
score < - 1
best_score < - 0
for (i in 1:3){
    sub_score < - 0
# for(j in 1:4){
print("kmer_dna_split[i]")
print(kmer_dna_split[i])
print(i)
if (kmer_dna_split[i] == "G"){sub_score < - profile_normalized[1, i]}
if (kmer_dna_split[i] == "A"){sub_score < - profile_normalized[2, i]}
if (kmer_dna_split[i] == "C"){sub_score < - profile_normalized[3, i]}
if (kmer_dna_split[i] == "T"){sub_score < - profile_normalized[4, i]}
# }

print("sub_score")
print(sub_score)

score < - 1 * sub_score * score
print("score")
print(score)

}
list_score < - c(score, kmer_dna)
print("list_score")
print(list_score[1])
print(list_score[2:4])
print("score")
return (list_score)
}
best_score < - 0
dna_score < - ""
for (i in 1:10){

    print("dna_matrix")
    print(dna_matrix)
    print(i)
    end_of_range < - i + 2
    print(end_of_range)
    # print(dna_matrix[i, c(i:end_of_range)])
    # print(high_score(dna_matrix[1,c(i:end_of_range)]))
    score < - high_score(dna_matrix[1, c(i:end_of_range)])
    print("score in function")
    print(score)
    if (best_score < score[1]){
    # print("bestScore2")
    # print(best_score) 
    # print(score)
    best_score < - score[1]
    dna_score < - score[2:4]
    }
    print("bestScore")
    print(best_score)
    print(dna_score)
    # print(score$score)
    # print(score$kmer_dna)
}

# 4. Looking for the bestscore
print("bestScore")
print(best_score)
print(kmer_dna)

# 5. Validate Motif
motiv_high_score < - high_score(dna_score)
print(motiv_high_score)