defmodule ActiveCampaign.Deal.Group do
  @moduledoc """
  Documentation for `ActiveCampaign.Deal.Group`.
  """

  alias ActiveCampaign.Http

  @doc """
  Create a pipeline
  """
  @spec create(map()) :: {:ok, map()} | {:error, any()}
  def create(deal_group) do
    Http.post("dealGroups", %{dealGroup: deal_group})
  end

  @doc """
  Retrieve a pipeline
  """
  @spec get(integer()) :: {:ok, map()} | {:error, any()}
  def get(id) do
    Http.get("dealGroups/#{id}")
  end

  @doc """
  Update a pipeline
  """
  @spec update(integer(), map()) :: {:ok, map()} | {:error, any()}
  def update(id, deal_group) do
    Http.put("dealGroups/#{id}", %{dealGroup: deal_group})
  end

  @doc """
  Delete a pipeline
  """
  @spec delete(integer()) :: {:ok, map()} | {:error, any()}
  def delete(id) do
    Http.delete("dealGroups/#{id}")
  end

  @doc """
  List all pipelines
  """
  @spec list(map()) :: {:ok, map()} | {:error, any()}
  def list(query_params \\ %{}) do
    Http.get("dealGroups?" <> Http.encode_query(query_params))
  end
end
