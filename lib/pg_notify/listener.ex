defmodule PgNotify.Listener do
  use GenServer

  def init(opts) do
    with {:ok, _pid, _ref} <- PgNotify.Repo.listen("alert") do
      {:ok, opts}
    else
      error -> {:error, error}
    end
  end

  def start_link(opts) do
    GenServer.start_link(__MODULE__, opts, name: __MODULE__)
  end

  def handle_info({:notification, _pid, _ref, channel, message}, state) do
    IO.inspect(channel)
    IO.inspect(message)

    PgNotifyWeb.Endpoint.broadcast!("room:lobby", "new_msg", %{"name" => "Michel Scott"})
    {:noreply, state}
  end
end
