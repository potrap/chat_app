defmodule ChatApp.Application do
  require N2O
  use Application
  
  def route(path) do
    case path do
      <<"rooms", _::binary>> -> ChatApp.Rooms
      <<"room", _::binary>> -> ChatApp.Room
      _ -> :error
    end
  end

  def start(_, _) do
      children = [
        {Plug.Cowboy, scheme: :http, port: 8001, plug: ChatApp.Router}
      ]
      Supervisor.start_link(children, strategy: :one_for_one, name: ChatApp.Supervisor)
  end
end
