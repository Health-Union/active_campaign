defmodule ActiveCampaign.Automation do
  @moduledoc """
  Documentation for `ActiveCampaign.Automation`.
  """

  alias ActiveCampaign.Http

  @doc """
  List all automations

  ## Examples

      iex> ActiveCampaign.Automation.list()
      {:ok, %{"automations" => [%{...}, ...], "meta" => %{...}}}
  """
  @spec list :: {:ok, map()} | {:error, any()}
  def list do
    Http.get("automations")
  end
end
