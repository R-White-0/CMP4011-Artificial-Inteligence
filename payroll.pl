/* Problem Solving
Pheonix, Brighton and Sussex are universities.
Pheonix and Sussex are accredited.
Pheonix and Brighton also offer online courses.
Brighton and Sussex accept Caribbean students on campus.
Pheonix, Brighton and Sussex offer vocational courses.
Pheonix offers science courses.
Brighton and Sussex offer hacking courses.

Tarique will attend a university that offers hacking and vocational, accepts Caribbean,offer online courses but is not accredited.

Joy will attend a university that offers science or hacking, offers online courses. Joy does not care about accreditation.

Danielle will attend a university that accepts Caribbean or offer online courses and is accredited.


Create a function university/0 that will display the universities that each student might attend.
<student> can attend <university>
 */

%FACTS:
universities(pheonix,online).
universities(brighton,online).
universities(sussex).

accredited(pheonix).
accredited(sussex).

accept_carib(brighton).
accept_carib(sussex).

voc_course(pheonix).
voc_course(brighton).
voc_course(sussex).

offer(pheonix,science).
offer(brighton,hacking).
offer(sussex,hacking).

%RULES:
tarAttend:-
    offer(University,hacking),
    voc_course(University),
    accept_carib(University),
    universities(University,online),
    not(accredited(University)),
    write('Tarique can attend: '),write(University),fail.

joyAttend:-
    offer(University,science);
    offer(University,hacking),
    universities(University,online),
    nl,write('Joy can attend: '),write(University),fail.

danAttend:-
    accept_carib(University);
    universities(University,online),
    accredited(University),
    nl,write('Danielle can attend: '),write(University),fail.

university:-
    tarAttend;
    joyAttend;
    danAttend.


%__________________________________________________________________________________________________________________________________________________

/* a. Write a prolog program payroll/0 that will request the following information for a employee: 
1. Employee Name 
2. Salary. 

Tax is calculated as follows: 
Salary  				Tax 
1-10000 			    7% of Salary  
10,001  - 30,000		6% of Salary 
Over 30,000  			4% of Salary 

If the salary greater than 20,000 the employee has to pay nht of 5% of their salary otherwise nht is 2% of their salary.
The program should calculate Net Salary = Salary – (Tax + NHT) and display the employee’s name, tax, nht contribution and net salary.  
This program should also continue to run until the user gives the option to quit. 
 */

 %RULES:
 payroll:-
    nl,write(' Enter employee name: '),nl,read(Emp),
    nl,write(' Enter salary ammount: '),nl,read(Sal),
    cal_sal(Sal,Tax), (Sal > 20000 -> Nht is Sal * 0.05; Nht is Sal * 0.02),
    Net is Sal - (Tax + Nht),
    do_output( Emp,Tax,Nht,Net).

cal_sal(Sal,Tax):-
    Sal > 0,
    Sal =< 10000 -> Tax is Sal * 0.07;

    Sal > 10000,
    Sal =< 30000 -> Tax is Sal * 0.06;

    Sal > 30000 -> Tax is Sal * 0.04;
    Tax is 0.

    do_output(Emp,Tax,Nht,Net):-
        nl,write('************************************');
        nl,write(' Employee name: '),write(Emp),
        nl,write(' Tax: '),write(Tax),
        nl,write(' Nht contribution: '),write(Nht),
        nl,write(' Net Salary: '),write(Net),
    
   	 nl,write('run again? y/n '),nl,read(Ans),
    (Ans == y -> nl,payroll;write('bye')).

/** <examples>
?- university.
?- payroll.
*/