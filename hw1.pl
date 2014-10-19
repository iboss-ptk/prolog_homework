%% stack impl
push(X,List,List2):- List2=[X|List].
pop(List,List2):- [_|List2]=List.

%% remove last element
append([],L,L).
append([H|T],L,[H|R]):-append(T,L,R).
removeLast(List,List2):-acc(List,[],List2).
acc([X],A,A).
acc([H|T],A,List2):-append(A,[H],L),acc(T,L,List2).

%% replace first
replaceFirst(X,[],Y,[]).
replaceFirst(X,[X|T],Y,[Y|T]).
replaceFirst(X,[H|T],Y,[H|R]):-replaceFirst(X,T,Y,R).

%% no duplication
found(X,[X|T]).
found(X,[H|T]):-found(X,T).
noDuplicate(L, L2):-no_dup(L, [], L2).
no_dup([], L, L).
no_dup([H|T],L2,L3):-found(H,T),no_dup(T,L2,L3).
no_dup([H|T],L2,L3):-append(L2,[H],L),no_dup(T,L,L3).

%% first K element
firstk(L,K,R):-addup(L,K,[],R).
addup([],K,R,R).
addup(L,0,R,R).
addup([H|T],K,A,R):-append(A,[H],A2),K2 is K-1,addup(T,K2,A2,R).

%% palindrome
foundAtLast(X,[X|T]):-T==[].
foundAtLast(X,[H|T]):-foundAtLast(X,T).
palindrome([]).
palindrome([_]).
palindrome([H|T]):-foundAtLast(H,T),removeLast(T,L),palindrome(L).