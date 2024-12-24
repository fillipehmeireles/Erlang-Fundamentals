-module(hello).
-author("Fillipe Meireles").
-export([test_if/2, while/1, while/2, myfor/3, filereader/2]).

test_if(A, B) ->
  if
    A == 5 ->
      io:format("A == 5~n", []),
      a_equals_5;
    B == 6 ->
      io:format("B == 6~n", []),
      b_equals_6;
    A == 2, B == 3 ->                      
      io:format("A == 2, B == 3~n", []),
      a_equals_2_b_equals_3;
    A == 1 ; B == 7 ->                     
      io:format("A == 1 ; B == 7~n", []),
      a_equals_1_or_b_equals_7
  end. 


while(L) -> while(L,0).


while([], Element) -> Element;

while([_|T], Element) ->
  io:fwrite("~w~n", [Element]),
  while(T, Element+1).


myfor(I,N,Group) when N >= I ->
  io:fwrite("~w~n", [lists:nth(I,Group)]),
  myfor(I+1, N, Group);
myfor(_,_,_) ->  
  ok.


