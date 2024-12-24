-module(structures).
-author("Fillipe Meireles").
-export([start/0]).
-record(item, {id, name = ""}).
-record(player, {id, name = "", life = 100, item}).


start() ->
  P = #player{name="Henrique", id = 1, item = #item{id = 1, name = "helmet"}},
  io:fwrite("Player name: ~p~n", [P#player.name]),
  io:fwrite("Player ID: ~p~n", [P#player.id]).

