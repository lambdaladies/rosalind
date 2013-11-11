:- use_module(library(dcg/basics)).

:- dynamic sample_gc/2.

gc_percent(FileName) :-
	phrase_from_file(fasta, FileName).

fasta --> blanks.
fasta --> fasta_entry,
	blanks,
	fasta.
fasta -->
	lazy_list_location(file(Name, Line, LinePos, _CharNo)),
	... ,
	{
	    format('error in ~w on line ~w at column ~w~n',
		  [Name, Line, LinePos ])
        }.


fasta_entry -->
	">",
	string(Name),
	nl,
	!,
	fasta_string(Name, 0, 0).

fasta_string(Name, GC, AT) -->
	"G",
	!,
	{
	    NGC is GC + 1
	},
	fasta_string(Name, NGC, AT).
fasta_string(Name, GC, AT) -->
	"C",
	!,
	{
	    NGC is GC + 1
	},
	fasta_string(Name, NGC, AT).
fasta_string(Name, GC, AT) -->
	"A",
	!,
	{
	    NAT is AT + 1
	},
	fasta_string(Name, GC, NAT).
fasta_string(Name, GC, AT) -->
	"T",
	!,
	{
	    NAT is AT + 1
	},
	fasta_string(Name, GC, NAT).
fasta_string(Name, GC, AT) -->
	blank,
	fasta_string(Name, GC, AT).
fasta_string(Name, GC, AT) -->
	[],
	{
	    Pairs is GC + AT,
	    Pairs \= 0,
	    Portion is 100.0 * GC / float(GC + AT),
	    atom_codes(AName, Name),
	    asserta(sample_gc(AName, Portion))
	}.
fasta_string(_, _, _) --> [].

nl --> "\r\n".
nl --> "\n".

... --> []|[_],... .

go :-
	retractall(sample_gc(_, _)),
	gc_percent('samples.fasta'),
	setof(N-P, sample_gc(N, P), Samples),
	print_max(Samples, -1.0, 'none').

print_max([], Portion, Name) :-
	  format('~s~n~6f~n', [Name, Portion]).
print_max([Name-Portion | T], MaxPortion, _) :-
	Portion > MaxPortion,
	print_max(T, Portion, Name).
print_max([_ | T], MaxPortion, MaxName) :-
	print_max(T, MaxPortion, MaxName).




