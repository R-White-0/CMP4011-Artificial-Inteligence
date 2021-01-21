%Problem Solving Practice Questions. 

/*Formalize the following problem by implementing the necessary Prolog facts and rules.  
 
Dave, Thomas, Sue, Fred and Jack are warriors. Dave and Thomas run tribal meetings well. 
Sue and Fred can use magic. Dave, Thomas and Sue are in the Pigmy tribe. Fred and Jack belong to the Wakanda tribe. 
All warriors except those in the Pigmy tribe are cunning. However warriors in the Pigmy tribe have good hunting abilities.  
The tribal council wants to elect a Chief, an advisor and a strategist. 
The Chief needs to have good hunting abilities and run tribal meetings well and be and adult, 
the advisor needs to be able to use magic and have good hunting abilities. 
The strategist needs to be cunning and be able to use magic. 
Write a rule that should generate the possible candidates for each post.   

<name> is suitable for <post> 
 */

%Facts
warriors(dave).
warriors(thomas).
warriors(sue).
warriors(fred).
warriors(jack).

belongs_to(dave, pigmy_tribe).
belongs_to(thomas, pigmy_tribe).
belongs_to(sue, pigmy_tribe).
belongs_to(fred, wakanda).
belongs_to(jack, wakanda).

adult(dave).
adult(sue).
adult(thomas).
teen(fred).
teen(jack).

use_magic(sue).
use_magic(fred).

run_meetings_well(dave).
run_meetings_well(thomas).

%RULES
cunning(Warrior) :-
    belongs_to(Warrior,Tribe),
    Tribe \= pigmy_tribe,
    write(Warrior), write(' is cunning'),nl.

good_hunting(Warrior) :-
    belongs_to(Warrior, Tribe),
    Tribe == pigmy_tribe,
    write(Warrior), write(' has good hunting abilities'),nl.

trial_meeting(Warrior) :-
    run_meetings_well(Warrior),
    write(Warrior), write(' run meetings well'),nl.

chief(Warrior) :-
    good_hunting(Warrior),
    trial_meeting(Warrior),
    adult(Warrior),
    write(Warrior), write(' is suitable for chief'),nl.

advisor(Warrior) :-
    use_magic(Warrior),
    good_hunting(Warrior),
    write(Warrior), write(' is suitable for advisor'),nl.

strategist(Warrior) :-
    cunning(Warrior),
    use_magic(Warrior),
    write(Warrior), write(' is suitable for strategist'),nl.
    
/** <examples>
?- strategist(fred).
?- strategist(sue).
?- advisor(sue).
?- advisor(dave).
?- chief(dave).
?- chief(thomas).
?- chief(jack).
*/