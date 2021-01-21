/* Student: Rojay White
   ID: 1400372 */
/*_________________________________________Question 1__________________________________________ */
%RULE
taxable:-
    nl,write(' Enter name: '),nl,read(Name),
    nl,write(' Enter Tax Revenue Number: '),nl,read(Taxrev),
    nl,write(' Enter income: '),nl,read(Inc),
    nl,write(' Are you married ? y/n '),nl,read(Ans),
    (Ans == y -> nl,Refund is 50;Refund is 60),
    
    cal_tax(Inc,Tax), 
    Disinc is (Inc-Tax) + Refund,
    do_output(Name,Taxrev,Inc,Tax,Refund,Disinc).

cal_tax(Inc, Tax):-
        Inc > 0,
        Inc =< 5461.99 -> Tax is 0;

        Inc > 5461.99,
        Inc =< 18893.99 -> Tax is Inc * 0.1;

        Inc > 18893.99,
        Inc =< 39499.99 -> Tax is Inc * 0.15;

        Inc > 39499.99,
        Inc =< 55899.99 -> Tax is Inc * 0.20;

        Inc >= 55900.00 -> Tax is Inc * 0.25;
        Tax is 0.

        do_output(Name,Taxrev,Inc,Tax,Refund,Disinc):-
            nl,write('*******************Tax Payable****************'),
            nl,write('Name: '),write(Name),
            nl,write('Number: '),write(Taxrev),
            nl,nl,write('Taxable Income: $'),write(Inc),
            nl,write('Taxes: $'),format('~2f', [Tax]),
            nl,write('Refund: $'),write(Refund),
            nl,write('Disposable Income: $'),format('~2f', [Disinc]).

/* ________________________________________Question 2___________________________________________*/
%FACTS:
isreasonable(zeus).
isreasonable(staub).
isexpensive(mercury).

origin(zeus,usa).
origin(mercury,norway).
origin(staub,japan).

shipsto(zeus,norway).
shipsto(zeus,japan).
shipsto(zeus,usa).
shipsto(mercury,japan).
shipsto(mercury,germany).
shipsto(staub,germany).
shipsto(staub,usa).

sells(zeus,mazda).
sells(zeus,toyota).
sells(staub,mazda).
sells(staub,toyota).
sells(mercury,hyundai).

%RULES:
lisaBuy:-
  isreasonable(Dealer),
  sells(Dealer,Car),(Car == mazda; Car == toyota),
  not(origin(Dealer,japan)),
  shipsto(Dealer,Country),( Country== germany; Country == usa),
  write('Lisa '),write('can purchase '),write(Car),write(' from '),write(Dealer).

tanyaBuy:-
        isreasonable(Dealer),
        sells(Dealer,Car),(Car == mazda; Car == toyota),
        shipsto(Dealer,Country),(Country==germany),
        write('Tanya '),write('can purchase '),write(Car),write(' from '),write(Dealer).

thomasBuy:-
       	sells(Dealer,Car),(Car == hyundai),
        shipsto(Dealer,Country),(Country==germany),
        write('Thomas '),write('can purchase '),write(Car),write(' from '),write(Dealer).


/** <examples>
?- taxable.
?- lisaBuy.
?- tanyaBuy.
?- thomasBuy.
*/