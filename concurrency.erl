-module(concurrency).
-export([
         simple/0,
         start/0
        ]).


simple() ->
  Pid = spawn(fun() -> server("Hello") end),
  Pid ! {fillipe}.

server (Message) ->
  io:fwrite("~p", [Message]).


loop () ->
  receive
    {rectangle, Width, Height} ->
      io:fwrite("Area of rectangle is ~p~n", [Width * Height]),
      loop();
    {circle, R} ->
      io:fwrite("Area of circle is ~p~n", [3.14 * R * R]),
      loop();
    Other ->
      io:fwrite("Unknown ~n"),
      loop()
    end.

start() ->
  Pid = spawn(fun() -> loop() end),
  Pid ! {rectangle, 6, 10},
  Pid ! {circle, 40}.
  % Pid ! {square, 4}.

