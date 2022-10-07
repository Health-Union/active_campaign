defmodule ActiveCampaign.Branding do
  @moduledoc """
  Documentation for `ActiveCampaign.Branding`.
  """

  alias ActiveCampaign.Http

  @doc """
  Retrieve a branding

  ## Examples

      iex> ActiveCampaign.Branding.get(1)
      {:ok, %{"branding" => %{...}}}
  """
  @spec get(integer()) :: {:ok, map()} | {:error, any()}
  def get(id) do
    Http.get("brandings/#{id}")
  end

  @doc """
  Update a branding
  """
  @spec update(integer(), map()) :: {:ok, map()} | {:error, any()}
  def update(id, branding) do
    Http.put("brandings/#{id}", %{branding: branding})
  end

  @doc """
  List all brandings

  ## Examples

      iex> ActiveCampaign.Branding.list()
      {:ok, %{"brandings" => [%{...}, ...]}}
  """
  @spec list :: {:ok, map()} | {:error, any()}
  def list do
    Http.get("brandings")
  end
end
