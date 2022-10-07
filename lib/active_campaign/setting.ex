defmodule ActiveCampaign.Setting do
  @moduledoc """
  Documentation for `ActiveCampaign.Setting`.
  """

  alias ActiveCampaign.Http

  @doc """
  Update settings
  """
  @spec update(integer(), map()) :: {:ok, map()} | {:error, any()}
  def update(id, setting) do
    Http.put("configs/#{id}", %{config: setting})
  end
end
