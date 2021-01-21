% Rules - Lab Excercise.

/* Translate the following sentences into Prolog
John eats all kinds of food.  Apples are food.  Oysters are food. 
 Anything anyone eats is food.Tom eats snakes.  Sue eats everything Tom eats.

Save the program in a file called “food.pl” 
now read them into Prolog and formulate queries to find out:

What does John eats?
What does Sue eats?
Is there anything which both Sue and Tom eat?
Who eats snakes?
*/
    
%FACTS
food(apple).
food(oyster).
food(snake).

eats(snake, tom).
eats(food, john).
eats(food, sue).

anyone_eats(food, anything).

%RULES
john_eats(X, Y) :-
    eats(Y, X),
    write('John eats all kind of foods. '), nl.

sue_eats(X, Y) :-
    eats(Y, X),
    eats(snake, tom),
    write(' Sue eats everything Tom eats. '), nl.

share_food(_) :-
    eats(food, sue),
    eats(snake, tom),
    write(' Sue and Tom share food snake. '), nl.

who_eat_snake(_) :-
    food(snake),
    john_eats(X, Y),
    sue_eats(X, Y),
    eats(snake, tom),
    write(' John may eat a snake. '), nl, 
    write(' Tom eats snakes. ').
    

/** <examples>
?- who_eat_snake(_).

?- share_food(_).
   
?- sue_eats(sue, food).

?- john_eats(john, food).
*/
