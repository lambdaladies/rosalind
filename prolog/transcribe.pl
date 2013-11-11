%
% This program is part of the Rosalind challenge.
% It solves the problem
%
%  Transcribing DNA into RNA
%
%  at
%
%  http://rosalind.info/problems/rna/
%

/**	dna_rna(?DNA:list, ?RNA:list) is nondet

Problem

An RNA string is a string formed from the alphabet containing 'A', 'C', 'G', and 'U'.

Given a DNA string t corresponding to a coding strand, its transcribed RNA string u is formed by replacing all occurrences of 'T' in t with 'U' in u.

Given: A DNA string t having length at most 1000 nt.

Return: The transcribed RNA string of t.

Sample Dataset

        GATGGAACTTGACTACGTAAATT

Sample Output

        GAUGGAACUUGACUACGUAAAUU

Note: copies illegal characters

Note: NOT swipl 7.0 safe

*/
dna_rna("", "").
dna_rna([0'T | DNA], [0'U | RNA]) :-
	dna_rna(DNA, RNA).
dna_rna([X | DNA], [X | RNA]) :-
	dna_rna(DNA, RNA).

go :-
	DNA = "AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC",
	dna_rna(DNA, RNA),
	format('RNA is ~s~n', [RNA]),
	dna_rna(NDNA, RNA),
	format('and to show off, untranscribed ~s~n', [NDNA]).


