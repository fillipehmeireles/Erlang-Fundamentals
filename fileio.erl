-module(fileio).
-author("Fillipe Meireles").
-export([filereader/2]).


filereader(FileName, ML) ->
  case file:open(FileName, [read]) of
    {ok, IoDevice} ->
      reader(IoDevice, ML),
      file:close(IoDevice);
    {error, Reason} ->
      io:format("Failed to open file: ~p~n", [Reason])
  end.

reader(File, ML) when ML ->
  Txt = file:read(File, 1024 * 1024),
  io:fwrite("~p~n",[Txt]);
reader(File,_) ->
  process_lines(File).

process_lines(IoDevice) ->
  case io:get_line(IoDevice, "") of
    eof ->
      ok;
    {error, Reason} ->
      io:format("Error reading line: ~p~n", [Reason]);
    Line ->
      process_line(Line),            
      process_lines(IoDevice)
  end.

process_line(Line) ->
  io:fwrite("~p~n", [Line]).


