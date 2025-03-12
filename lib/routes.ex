defmodule ChatApp.Routes do
  require N2O

  def finish(state, context), do: {:ok, state, context}

  def init(state, context) do
    %{path: path} = N2O.cx(context, :req)
    {:ok, state, N2O.cx(context, path: path, module: route_prefix(path))}
  end

  defp route_prefix(<<"/ws/", p::binary>>), do: route(p)
  defp route_prefix(<<"/", p::binary>>), do: route(p)
  defp route_prefix(path), do: route(path)

  defp route(<<"app/rooms", _::binary>>), do: ChatApp.Rooms
  defp route(<<"app/room", _::binary>>), do: ChatApp.Room
  defp route(_), do: ChatApp.Rooms
end
