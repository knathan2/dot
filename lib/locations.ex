defmodule Locations do 
  require Logger
  def loc(place) do
    Logger.info("#{inspect place}")
    key = String.to_atom(place)
    map = %{:"collegiate" => "P.H.D", :"the movies" => "M.S.S", :"the grocery store" => "M.S.S", :"the math emporium" => "U.C.B", :"maple ridge" => "M.S.N", :"pheasant run" => "P.H.D", :"terrace view" => "P.H.D", :"fox ridge" => "H.W.D", :"the village" => "P.R.O"}
    map[key]
  end
end
