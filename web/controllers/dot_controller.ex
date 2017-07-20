defmodule Dot.DotController do 
  use Dot.Web, :controller
  require Logger
  def mytime(conn, %{"request" => %{"intent" => %{"name" => "BusStatus", "slots" => %{"Date" => %{"name" => "Date", "value" => busDate}}}}} = params) do
    
    busStatus = Bus.get(busDate)
    Logger.info(busStatus)
    json conn, 
      %{
        "version" => "1.0",
        "sessionAttributes" => %{},
        "response" => %{
          "outputSpeech" => %{
            "type" => "PlainText",
            "text" => "The bus status for " <> busDate <> " is " <> busStatus,
           },
           "shouldEndSession" => true
         }
       }
  end

  def mytime(conn, params) do 
    [h|t] = Pheasant.timeStop
    json conn, 
      %{
        "version" => "1.0",
        "sessionAttributes" => %{},
        "response" => %{
          "outputSpeech" => %{
            "type" => "PlainText",
            "text" => "The next bus arrives at " <> h,
           },
           "shouldEndSession" => true
         }
       }
  end
end
