defmodule ActiveCampaign.Campaign do
  @moduledoc """
  Documentation for `ActiveCampaign.Campaign`.
  """

  use ActiveCampaign.Crud,
    fun: [:get, :list],
    endpoint: "campaigns",
    name: "campaign"

  @doc """
  Retrieve links associated to campaign
  """
  @spec get_links(integer()) :: {:ok, map()} | {:error, any()}
  def get_links(id) do
    Http.get("campaigns/#{id}/links")
  end
end
