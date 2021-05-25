defmodule ProxyWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :proxy

  @base_host_regex ~r|\.?mydomain.*$|
  @subdomains %{
    "admin" => Admin.Web.Endpoint,
    "client" => Client.Web.Endpoint
  }
  @default_host Client.Web.Endpoint

  def init(opts), do: opts

  def call(conn, _) do
    with subdomain <- String.replace(conn.host, @base_host_regex, ""),
         endpoint <- Map.get(@subdomains, subdomain, @default_host) do
      endpoint.call(conn, endpoint.init())
    end
  end
end
