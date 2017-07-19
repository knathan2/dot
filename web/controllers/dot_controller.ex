defmodule Dot.DotController do 
  use Dot.Web, :controller
  require Logger
  def mytime(conn, params) do
    
    %{"request" => %{"intent" => %{"name" => "HelloWorld", "slots" => %{"Date" => %{"name" => "Date", "value" => busDate}}}}} = params
    busStatus = Bus.get(busDate)
    Logger.info(busStatus)
    json conn, 
      %{
        "version" => "1.0",
        "sessionAttributes" => %{},
        "response" => %{
          "outputSpeech" => %{
            "type" => "PlainText",
            "text" => "The bus status for " <> busDate <> " is " <> busStatus <> "",
           },
           "shouldEndSession" => true
         }
       }
  end
end
