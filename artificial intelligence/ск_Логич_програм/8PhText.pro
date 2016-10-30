% PherzeiЗадача о 8 ферзях

domains
	coord=c(integer,integer)
	ilist=integer*
	clist=coord*
	
predicates
	solution(clist)
	noattack(coord,clist)
	member(integer,ilist)

clauses
	solution([]).
	solution([c(X,Y)|Others]):-solution(Others),
					member(Y,[1,2,3,4,5,6,7,8]),
					noattack(c(X,Y),Others).



	noattack(_,[]).
	noattack(c(X,Y),[c(X1,Y1)|Others]):-		
					Y<>Y1,
					Y1-Y<>X1-X,
					Y1-Y<>X-X1,
					noattack(c(X,Y),Others).
					
	member(Item,[Item|Rest]).
	member(Item,[First|Rest]):-member(Item,Rest).
	goal
		solution([c(1,Y1),c(2,Y2),c(3,Y3),c(4,Y4),c(5,Y5),c(6,Y6),c(7,Y7),c(8,Y8)]).