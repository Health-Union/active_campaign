defmodule ActiveCampaign.Template do
  @moduledoc """
  Documentation for `ActiveCampaign.Template`.
  """

  alias ActiveCampaign.Http

  @doc """
  Retrieve a template
  """
  @spec get(integer()) :: {:ok, map()} | {:error, any()}
  def get(id) do
    Http.get("templates/#{id}")
  end
end
