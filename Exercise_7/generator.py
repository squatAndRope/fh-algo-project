#importing modules
import random
from random import randint
from random import choice

##### HELPER FUNCTIONS #######


#this makes a random DNA sequence of length  l
def DNA_Sequence(seq_length):
    DNA=""
    for count in range(seq_length):
      DNA+=choice("CGTA")
    return DNA

#random mutation of motifs at a given mutation rate
def mutate(motiv, rate):
    bases='AGCT'
    mutants = []
    for i in range(100):
        for base in motiv:
            if rate > random.random():
                new_base = bases[bases.index(base) - random.randint(1, 3)]
                insert_indx = randint(0,len(motiv))
                mut_seq = motiv[ :insert_indx] + new_base + motiv[insert_indx+1: ]
                mutants.append(mut_seq)
    return mutants


###### MAIN FUNCTION #######

#this inserts the motiv s times in random placed in random DNA sequence and mutates it randomly
def generate_DNA_mutants(motiv, rate, motiv_number, seq_length, n_out): #string and integer as integer how many times the motiv is supposed to appear
    motifs = mutate(motiv, rate)
    DNA_string = DNA_Sequence(seq_length)
    print(DNA_string)
    final_seq = ''
    all_seq = []
    for i in range(n_out):
        for i in range(randint(1,motiv_number), randint(1, motiv_number)): #this is to make sure the number of times a motif is inserted is random
            insertion_index = randint(0,seq_length)
            final_seq = DNA_string[ :insertion_index] + motifs[randint(0,len(motifs)-1)] + DNA_string[insertion_index+len(motiv): ]
            all_seq.append(final_seq)

    return all_seq

print(generate_DNA_mutants('AGCTATTA', 0.2, 10, 30, 3))