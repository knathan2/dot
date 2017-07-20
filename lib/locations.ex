defmodule Locations do 
  def loc(place) do
    key = String.to_atom(place)
    map = %{:"collegiate" => "P.H.D", :"the movies" => "M.S.S", :"kroger" => "M.S.S", :"the math empo" => "U.C.B", :"maple ridge" => "M.S.N", :"pheasant run" => "P.H.D", :"terrace view" => "P.H.D", :"fox" => "H.W.D", :"the village" => "P.R.O"}
    map[key]
  end
end
