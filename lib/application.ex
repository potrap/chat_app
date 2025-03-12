defmodule ChatApp.Application do
  use Application
  use N2O

  def start(_, _) do
    port = Application.get_env(:n2o, :port, 8001)

    :cowboy.start_clear(:http, [{:port, port}], %{env: %{dispatch: :n2o_cowboy.points()}})

    Supervisor.start_link([], strategy: :one_for_one, name: ChatApp.Supervisor)
  end
end
