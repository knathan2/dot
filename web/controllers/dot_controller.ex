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

  def mytime(conn, %{"request" => %{"intent" => %{"name" => "PheasantStop"}}}) do 
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

  def mytime(conn, %{"request" => %{"intent" => %{"name" => "NextThree"}}}) do 
    [f|a] = Pheasant.timeStop
    [s|b] = a
    [t|c] = b
    json conn, 
      %{
        "version" => "1.0",
        "sessionAttributes" => %{},
        "response" => %{
          "outputSpeech" => %{
            "type" => "PlainText",
            "text" => "The next three buses arrive at " <> f <> ", " <> s <> " ,and " <> t,
           },
           "shouldEndSession" => true
         }
       }
  end

  def mytime(conn, %{"request" => %{"intent" => %{"name" => "BusLines", "slots" => %{"Loc" => %{"name" => "Loc", "value" => place}}}}} = params) do 
    Logger.info("#{inspect params}")
    code = Locations.loc(place)
    json conn, 
      %{
        "version" => "1.0",
        "sessionAttributes" => %{},
        "response" => %{
          "outputSpeech" => %{
            "type" => "PlainText",
            "text" => "The three letter bus code going to " <> place <> " is " <> code,
           },
           "shouldEndSession" => true
         }
       }
  end

    def mytime(conn, params) do 
    json conn, 
      %{
        "version" => "1.0",
        "sessionAttributes" => %{},
        "response" => %{
          "outputSpeech" => %{
            "type" => "PlainText",
            "text" => "I couldn't understand your request. Try another command",
           },
           "shouldEndSession" => false
         }
       }
  end

end
