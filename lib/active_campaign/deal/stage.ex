defmodule ActiveCampaign.Deal.Stage do
  @moduledoc """
  Documentation for `ActiveCampaign.Deal.Stage`.
  """

  alias ActiveCampaign.Http

  @doc """
  Create a stage
  """
  @spec create(map()) :: {:ok, map()} | {:error, any()}
  def create(deal_stage) do
    Http.post("dealStages", %{dealStage: deal_stage})
  end

  @doc """
  Retrieve a stage
  """
  @spec get(integer()) :: {:ok, map()} | {:error, any()}
  def get(id) do
    Http.get("dealStages/#{id}")
  end

  @doc """
  Update a stage
  """
  @spec update(integer(), map()) :: {:ok, map()} | {:error, any()}
  def update(id, deal_stage) do
    Http.put("dealStages/#{id}", %{dealStage: deal_stage})
  end

  @doc """
  Delete a stage
  """
  @spec delete(integer()) :: {:ok, map()} | {:error, any()}
  def delete(id) do
    Http.delete("dealStages/#{id}")
  end

  @doc """
  List all stages
  """
  @spec list(map()) :: {:ok, map()} | {:error, any()}
  def list(query_params) do
    Http.get("dealStages?" <> Http.encode_query(query_params))
  end

  @doc """
  Move deals to another stage
  """
  @spec move(integer(), integer()) :: {:ok, map()} | {:error, any()}
  def move(from_deal_stage_id, to_deal_stage_id) do
    Http.put("dealStages/#{from_deal_stage_id}/deals", %{deal: %{stage: to_deal_stage_id}})
  end
end
