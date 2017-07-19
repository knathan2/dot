defmodule Dot.DotController do 
  use Dot.Web, :controller
  require Logger
  def mytime(conn, params) do
    Logger.info("#{inspect params}")
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
