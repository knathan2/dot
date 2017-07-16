defmodule Dot.DotController do 
  use Dot.Web, :controller
  def mytime(conn, _params) do
    json conn, 
      %{
        "version" => "1.0",
        "response" => %{
          "outputSpeech" => %{
            "type" => "Plaintext"
            "text" => "Hello World!",
           }
           "shouldEndSession" => true
         }
       }
  end
end
