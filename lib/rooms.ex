defmodule ChatApp.Rooms do
  require NITRO
  require N2O
  require Logger

  def event(:init) do
    :nitro.update(:room1, NITRO.button(id: :room1, postback: {:room, "1"}, body: "Room 1"))
    :nitro.update(:room2, NITRO.button(id: :room2, postback: {:room, "2"}, body: "Room 2"))
    :nitro.update(:room3, NITRO.button(id: :room3, postback: {:room, "3"}, body: "Room 3"))
  end

  def event({:room, id}) do
    :n2o.session(:room_id, id)
    :nitro.redirect("/app/room.htm")
  end

  def event({:exit, reason}) do
    Logger.info("Connection from rooms.htm terminated with reason: #{inspect(reason)}")
  end
end
