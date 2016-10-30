domains
ilist=integer*
tree=tree(integer,tree,tree);end
predicates
read_list(ilist)%чтение списка
read_tree(tree,tree)%чтение в дерево
insert(integer,tree,tree)%вставка в дерево
traverse(tree)%обход дерева во внутреннем порядке
list_tree(ilist,tree,tree)%преобразование списка в дерево
tree_list(tree,ilist)%преобразование дерева в список
append(ilist,ilist,ilist)%добавление в конец списка
clauses
read_list([H|T]):-readint(H),H<>1000,!,read_list(T).
read_list([]).
insert(X,end,tree(X,end,end)).
insert(X,tree(Y,Left,Right),tree(Y,Nleft,Right)):-X<=Y,!,insert(X,Left,Nleft).
insert(X,tree(Y,Left,Right),tree(Y,Left,Nright)):-insert(X,Right,Nright).
read_tree(T1,T2):-readint(X),X<>1000,!,insert(X,T1,T3),read_tree(T3,T2).
read_tree(T,T).
append([],L,L).
append([H|T],L,[H|T1]):-append(T,L,T1).
list_tree([],T,T).
list_tree([H|T],Tree1,Tree2):-insert(H,Tree1,Tree3),list_tree(T,Tree3,Tree2).
tree_list(end,[]).
tree_list(tree(X,Left,Right),L):-tree_list(Left,L1),tree_list(Right,L2),
                                 append(L1,[X|L2],L).
traverse(end).
traverse(tree(X,Left,Right)):-traverse(Left),write(X," "),traverse(Right).
goal
%read_list(L).
read_tree(end,T),traverse(T),nl,tree_list(T,L),nl,list_tree(L,end,T2),
nl,traverse(T2).
