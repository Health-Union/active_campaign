defmodule ActiveCampaign.Config do
  @moduledoc """
  Configuration helper.
  """
  @api_version_path "/api/3/"

  def api_key do
    Application.get_env(
      :active_campaign,
      :api_key
    )
  end

  def api_url do
    :active_campaign
    |> Application.get_env(:api_url)
    |> URI.merge(@api_version_path)
  end
end
