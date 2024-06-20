defmodule ActiveCampaign.Config do
  @moduledoc """
  Configuration helper.
  """

  @api_version_path "/api/3/"
  @event_endpoint "https://trackcmp.net/event"

  def api_key, do: get_env(:api_key)

  def api_url do
    :api_url
    |> get_env()
    |> URI.merge(@api_version_path)
  end

  def event_key, do: get_env(:event_key)

  def actid, do: get_env(:actid)

  def json_library, do: get_env(:json_library, Jason)

  def http_library, do: get_env(:http_library, HTTPoison)

  def http_options, do: get_env(:http_options, [])

  def event_endpoint, do: get_env(:event_endpoint, @event_endpoint)

  defp get_env(name, default \\ nil), do: Application.get_env(:active_campaign, name, default)
end
