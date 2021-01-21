/*
Exercise 1
Let us extract the facts and rules from the below paragraph.

Sue reads all books written by Stephen king. Carrie is a book. The
Langoliers is a mystery book.  Stephen king is the author of Carrie. He is
also the author of the Langoliers. Sue likes all mystery books that she
reads. Jane will read any book that Sue likes or any book written by Phillip.
Torrid is a book. Phillip is the author of Torrid.
*/

%FACTS
book(carrie).
book(torrid).
book('Langoliers').
mystery('Langoliers').

author_of('Stephen king', carrie).
author_of('Stephen king', 'Langoliers').
author_of('Phillip', torrid).

%RULES
sue_reads(X):-
    book(X),
    author_of('Stephen king', X),
    write('Sue read '),write(X), nl.

sue_likes(X):-
    sue_reads(X),
    mystery(X),
    write('Sue likes '),write(X), write(', mystery book'), nl.

jane_reads(X):-
    book(X),
    author_of('Phillip', X);
    sue_likes(X),
	write('Jane read '),write(X).

/** <examples>
?-  sue_reads('Langoliers').
?-  sue_reads(carrie).
?- sue_likes('Langoliers').
?- sue_likes(carrie).
?- jane_reads('Langoliers').
?- jane_reads(torrid).
*/
