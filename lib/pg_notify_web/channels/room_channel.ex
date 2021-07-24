defmodule PgNotifyWeb.RoomChannel do
  use PgNotifyWeb, :channel

  def join("room:lobby", _params, socket) do
    IO.inspect("someone joined our channel..")
    {:ok, socket}
  end

  def handle_in("new_msg", payload, socket) do
    IO.inspect("handle_in")
    IO.inspect(payload)
    broadcast!(socket, "new_msg", payload)
    {:reply, {:ok, payload}, socket}
  end
end
