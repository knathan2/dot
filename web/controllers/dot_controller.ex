defmodule Dot.DotController do 
  use Dot.Web, :controller
  require Logger
  def mytime(conn, params) do
    Logger.info("#{inspect params}")
    %{"request" => %{"intent" => %{"name" => "HelloWorld", "slots" => %{"Date" => %{"name" => "Date", "value" => busDate}}}}} = params
    json conn, 
      %{
        "version" => "1.0",
        "sessionAttributes" => %{},
        "response" => %{
          "outputSpeech" => %{
            "type" => "PlainText",
            "text" => "The bus status for " <> busDate <> " is ...",
           },
           "shouldEndSession" => true
         }
       }
  end
end
