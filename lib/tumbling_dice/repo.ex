defmodule TumblingDice.Repo do
  use Ecto.Repo,
    otp_app: :tumbling_dice,
    adapter: Ecto.Adapters.Postgres
end
