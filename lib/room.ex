defmodule ChatApp.Room do
  require NITRO
  require N2O
  require Logger

  def event(:init) do
    room_id = :n2o.session(:room_id)
    :n2o.reg({:topic, room_id})
    :n2o.session(:user, Faker.Person.first_name)
    :nitro.update(:heading, NITRO.h2(id: :heading, body: "Room #{room_id}"))
    :nitro.update(:send, NITRO.button(id: :send, body: "Send", postback: :chat, source: [:message]))
    :nitro.update(:back, NITRO.button(id: :back, body: "Back", postback: :back))
  end

  def event(:chat) do
    message = :nitro.q(:message)
    room_id = :n2o.session(:room_id)
    user = :n2o.session(:user)
    :n2o.send({:topic, room_id}, N2O.client(data: {user, message}))
  end

  def event({:client, {user, message}}) do
    :nitro.wire(NITRO.jq(target: :message, method: [:focus, :select]))
    :nitro.insert_top(:history, NITRO.message(body: [NITRO.author(body: user), :nitro.jse(message)]))
  end

  def event(:back), do: :nitro.redirect("/app/rooms.htm")
end
