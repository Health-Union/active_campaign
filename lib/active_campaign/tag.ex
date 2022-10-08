defmodule ActiveCampaign.Tag do
  @moduledoc """
  Documentation for `ActiveCampaign.Tag`.
  """

  alias ActiveCampaign.Http

  @doc """
  Create a tag
  """
  @spec create(map()) :: {:ok, map()} | {:error, any()}
  def create(tag) do
    Http.post("tags", %{tag: tag})
  end

  @doc """
  Retrieve a tag
  """
  @spec get(integer()) :: {:ok, map()} | {:error, any()}
  def get(id) do
    Http.get("tags/#{id}")
  end

  @doc """
  Update a tag
  """
  @spec update(integer(), map()) :: {:ok, map()} | {:error, any()}
  def update(id, tag) do
    Http.put("tags/#{id}", %{tag: tag})
  end

  @doc """
  Delete a Tag
  """
  @spec delete(integer()) :: {:ok, map()} | {:error, any()}
  def delete(id) do
    Http.delete("tags/#{id}")
  end

  @doc """
  List all tags
  """
  @spec list(map()) :: {:ok, map()} | {:error, any()}
  def list(query_params \\ %{}) do
    Http.get("tags?" <> Http.encode_query(query_params))
  end
end
