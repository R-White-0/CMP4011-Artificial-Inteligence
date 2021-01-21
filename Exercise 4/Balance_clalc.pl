%Arithmetic_Exercise 

/* a. Write a prolog program bank_customer/0 that will request the following information for a customer: 
1. Customer Name 
2. Customer Category (c1,c2 or c3) 
3. Beginning balance. 
4. Total deposits for the month 
5. Total withdrawals for the month  

For positive pre-interest balances(0 (beginning balance + monthly deposit – monthly withdrawals)

 Interest is calculated based on the customer category as follows: 
                      Category  	Interest 
c1  		7% of positive pre-interest balance  
c2  		6% of positive pre-interest balance 
c3  		4% of positive pre-interest balance 

The program should calculate the final balance (pre-interest balance + Interest) and 
display the customer’s name, interest amount and final balance.  
This program should also continue to run until the user gives the option to quit. 
*/

%RULES
bank_customer :-
    nl,write('Enter Customer name: '), nl, read(Customer),
    nl,write('Enter Customer Category (c1, c2, c3): '),nl, read(Cat),
    nl,write('Enter beginning balance: '), nl, read(Bal),
    nl,write(' Total deposit for the month: '), nl, read(Dep),
    nl, write('Enter total withdrawls: '), nl, read(Withd),

    Preintbal is Bal + Dep - Withd, (Preintbal > 0 -> calc_int(Cat,Preintbal,Int);Int is 0), %If_statement.

    Fbal is Preintbal + Int,

    do_disp(Fbal,Customer,Int).

calc_int(Cat,Preintbal,Int) :-
    Cat == 'c1' -> Int is Preintbal * 0.07;
    Cat == 'c2' -> Int is Preintbal * 0.06;
    Cat == 'c3' -> Int is Preintbal * 0.04;
    Int is 0.

do_disp(Fbal,Customer,Int):-
    nl,write('**********************');
    nl, write(' Customer name: '),write(Customer),
    nl, write(' Interest: '),write(Int),
    nl, write(' Final Balance: '),write(Fbal),
    nl,write('run again? y/n '),nl,read(Ans),

    (Ans == y -> nl,bank_customer;write('bye')).

/** <examples>
?- bank_customer.
*/