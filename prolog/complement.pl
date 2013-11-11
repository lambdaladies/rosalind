%
% This program is part of the Rosalind challenge.
% It solves the problem
%
%  Complementing a Strand of DNA
%
%  at
%
%  http://rosalind.info/problems/revc/
%

/**	dna_complement(?DNA:list, ?Complement:list) is nondet

Problem

In DNA strings, symbols 'A' and 'T' are complements of each other, as are 'C' and 'G'.

The reverse complement of a DNA string s is the string sc formed by reversing the symbols of s, then taking the complement of each symbol (e.g., the reverse complement of "GTCA" is "TGAC").

Given: A DNA string s of length at most 1000 bp.

Return: The reverse complement sc of s.

Sample Dataset

   AAAACCCGGT

Sample Output

   ACCGGGTTTT

Note: copies illegal characters

Note: NOT swipl 7.0 safe

*/
dna_complement(DNA, Complement) :-
	reverse(DNA, Rev),
	dna_complement_pairs(Rev, Complement).

dna_complement_pairs("", "").
dna_complement_pairs([P | DNA], [CP | Complement]) :-
	swap_pair(P, CP),
	dna_complement_pairs(DNA, Complement).

swap_pair(A, B) :- complementary_pair(A, B).
swap_pair(A, B) :- complementary_pair(B, A).

complementary_pair(0'A, 0'T).
complementary_pair(0'C, 0'G).


go :-
	DNA = "AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC",
	dna_complement(DNA, Complement),
	format('Complement is ~s~n', [Complement]),
	dna_complement(NDNA, Complement),
	format('and to show off, original is ~s~n', [NDNA]).


