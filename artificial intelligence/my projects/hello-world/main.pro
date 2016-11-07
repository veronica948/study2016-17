% Copyright

implement main
    open core

clauses
interval(A,B,A) :- A<=B.
interval(A,B,C) :- A<B, A1 = A+1, interval(A1, B,C).

    run() :-
        succeed,
        stdio::write("Hello world"),
        interval(2,5,3).% place your own code here

end implement main

goal
    console::runUtf8(main::run).