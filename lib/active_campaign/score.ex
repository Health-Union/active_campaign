defmodule ActiveCampaign.Score do
  @moduledoc """
  Documentation for `ActiveCampaign.Score`.
  """

  alias ActiveCampaign.Http

  @doc """
  Retrieve a score

  ## Examples

      iex> ActiveCampaign.Score.get(1)
      {:ok, %{"score" => %{...}}}
  """
  @spec get(integer()) :: {:ok, map()} | {:error, any()}
  def get(id) do
    Http.get("scores/#{id}")
  end

  @doc """
  List all scores

  ## Examples

      iex> ActiveCampaign.Score.list()
      {:ok, %{"meta" => %{"total" => "2"}, "scores" => [...]}}
  """
  @spec list :: {:ok, map()} | {:error, any()}
  def list do
    Http.get("scores")
  end
end
