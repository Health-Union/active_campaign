defmodule ActiveCampaign.Deal.Field do
  @moduledoc """
  Documentation for `ActiveCampaign.Deal.Field`.
  """

  alias ActiveCampaign.Http

  @doc """
  Create a custom field meta
  """
  @spec create(map()) :: {:ok, map()} | {:error, any()}
  def create(field) do
    Http.post("dealCustomFieldMeta", %{dealCustomFieldMetum: field})
  end

  @doc """
  Retrieve a custom field
  """
  @spec get(integer()) :: {:ok, map()} | {:error, any()}
  def get(id) do
    Http.get("dealCustomFieldMeta/#{id}")
  end

  @doc """
  Update a custom field
  """
  @spec update(integer(), map()) :: {:ok, map()} | {:error, any()}
  def update(id, field) do
    Http.put("dealCustomFieldMeta/#{id}", %{dealCustomFieldMetum: field})
  end

  @doc """
  Delete a custom field
  """
  @spec delete(integer()) :: {:ok, map()} | {:error, any()}
  def delete(id) do
    Http.delete("dealCustomFieldMeta/#{id}")
  end

  @doc """
  List all custom fields
  """
  @spec list(map()) :: {:ok, map()} | {:error, any()}
  def list(query_params \\ %{}) do
    Http.get("dealCustomFieldMeta?" <> Http.encode_query(query_params))
  end
end
