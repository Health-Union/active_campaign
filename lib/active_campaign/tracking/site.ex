defmodule ActiveCampaign.Tracking.Site do
  @moduledoc """
  Documentation for `ActiveCampaign.Tracking.Site`.
  """

  alias ActiveCampaign.Http

  @doc """
  Add domain to whitelist
  """
  @spec add(String.t()) :: {:ok, map()} | {:error, any()}
  def add(domain) do
    Http.post("siteTrackingDomains", %{siteTrackingDomain: %{name: domain}})
  end

  @doc """
  Retrieve site tracking code
  """
  @spec get_tracking_code :: {:ok, String.t()} | {:error, any()}
  def get_tracking_code do
    Http.get("siteTracking/code")
  end

  @doc """
  Retrieve status
  """
  @spec get_status :: {:ok, map()} | {:error, any()}
  def get_status do
    Http.get("siteTracking")
  end

  @doc """
  Enable/disable
  """
  @spec set_enabled(boolean()) :: {:ok, map()} | {:error, any()}
  def set_enabled(bool) do
    Http.put("siteTracking", %{siteTracking: %{enabled: bool}})
  end

  @doc """
  Remove domain from whitelist
  """
  @spec remove(String.t()) :: {:ok, map()} | {:error, any()}
  def remove(domain) do
    Http.delete("siteTrackingDomains/#{domain}")
  end

  @doc """
  List all whitelisted domains
  """
  @spec list(map()) :: {:ok, map()} | {:error, any()}
  def list(query_params \\ %{}) do
    Http.get("siteTrackingDomains?" <> Http.encode_query(query_params))
  end
end
