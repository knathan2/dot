defmodule Dot.DotController do 
  use Dot.Web, :controller
  def mytime(conn, _params) do
    json conn, 
      %{
        "version" => "1.0",
        "sessionAttributes" => %{},
        "response" => %{
          "outputSpeech" => %{
            "type" => "PlainText",
            "text" => "Hello World!",
           },
           "shouldEndSession" => true
         }
       }
  end
end
