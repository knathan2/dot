defmodule Locations do 
  def loc(place) do
    key = String.to_atom(place)
    map = %{:"collegiate" => "P.H.D", :"the movies" => "M.S.S", :"the grocery store" => "M.S.S", :"the math emporium" => "U.C.B", :"maple ridge" => "M.S.N", :"pheasant run" => "P.H.D", :"terrace view" => "P.H.D", :"foxridge" => "H.W.D", :"the village" => "P.R.O"}
    map[key]
  end
end
