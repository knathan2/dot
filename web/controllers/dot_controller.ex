defmodule Dot.DotController do 
  use Dot.Web, :controller
  require Logger
  def mytime(conn, params) do
    
    %{"request" => %{"intent" => %{"name" => "HelloWorld", "slots" => %{"Date" => %{"name" => "Date", "value" => busDate}}}}} = params
    status = Bus.get(busDate)
    Logger.info("#{inspect status}")
    json conn, 
      %{
        "version" => "1.0",
        "sessionAttributes" => %{},
        "response" => %{
          "outputSpeech" => %{
            "type" => "PlainText",
            "text" => "The bus status for " <> busDate <> " is " <> status,
           },
           "shouldEndSession" => true
         }
       }
  end
end
