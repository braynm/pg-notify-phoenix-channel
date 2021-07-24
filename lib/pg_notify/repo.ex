defmodule PgNotify.Repo do
  use Ecto.Repo,
    otp_app: :pg_notify,
    adapter: Ecto.Adapters.Postgres

  def init(_, opts), do: {:ok, opts}

  def child_spec(opts) do
    %{
      id: __MODULE__,
      start: {__MODULE__, :start_link, []},
      restart: :transient,
      type: :supervisor
    }
  end

  def listen(channel) do
    with {:ok, pid} <- Postgrex.Notifications.start_link(__MODULE__.config()),
         {:ok, ref} <- Postgrex.Notifications.listen(pid, channel) do
      {:ok, pid, ref}
    end
  end
end
