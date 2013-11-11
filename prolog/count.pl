%
% This program is part of the Rosalind challenge.
% It solves the problem
%
%  Counting Nucleotides
%
%  at
%
%  http://rosalind.info/problems/dna/
%

/**	nucleotide_count(+DNA:list, -A:int, -C:int, G:int, T:int) is nondet

Problem

A string is simply an ordered collection of symbols selected from some alphabet and formed into a word; the length of a string is the number of symbols that it contains.

An example of a length 21 DNA string (whose alphabet contains the
symbols 'A', 'C', 'G', and 'T') is ="ATGCTTCAGAAAGGTCTTACG."=

Given: A DNA string s of length at most 1000 nt.

Return: Four integers (separated by spaces) counting the respective number of times that the symbols 'A', 'C', 'G', and 'T' occur in s.

Sample Dataset

     AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC

Sample Output

     20 12 17 21

Note: fails if there's an illegal character

Note: swipl 7.0 safe

*/
nucleotide_count(DNA, A, C, G, T) :-
	nucleotide_count(DNA, 0, 0, 0, 0, A, C, G, T),!.
nucleotide_count("", A, C, G, T, A, C, G, T).
nucleotide_count([0'A | Rest], A, C, G, T, OA, OC, OG, OT) :-
	NA is A + 1,
	nucleotide_count(Rest, NA, C, G, T, OA, OC, OG, OT).
nucleotide_count([0'C | Rest], A, C, G, T, OA, OC, OG, OT) :-
	NC is C + 1,
	nucleotide_count(Rest, A, NC, G, T, OA, OC, OG, OT).
nucleotide_count([0'G | Rest], A, C, G, T, OA, OC, OG, OT) :-
	NG is G + 1,
	nucleotide_count(Rest, A, C, NG, T, OA, OC, OG, OT).
nucleotide_count([0'T | Rest], A, C, G, T, OA, OC, OG, OT) :-
	NT is T + 1,
	nucleotide_count(Rest, A, C, G, NT, OA, OC, OG, OT).


go :-
	nucleotide_count("AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC", A, C, G, T),
	format('~d ~d ~d ~d~n', [A, C, G, T]).
