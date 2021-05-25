defmodule Radinfo.Repo do
  use Ecto.Repo,
    otp_app: :radinfo,
    adapter: Ecto.Adapters.Postgres
end
