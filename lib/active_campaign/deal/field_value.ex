defmodule ActiveCampaign.Deal.FieldValue do
  @moduledoc """
  Documentation for `ActiveCampaign.Deal.FieldValue`.
  """

  alias ActiveCampaign.Http

  @doc """
  Create a custom field value
  """
  @spec create(map()) :: {:ok, map()} | {:error, any()}
  def create(value) do
    Http.post("dealCustomFieldData", %{dealCustomFieldDatum: value})
  end

  @doc """
  Bulk create a custom deal field value
  """
  @spec bulk_create(list(map())) :: {:ok, map()} | {:error, any()}
  def bulk_create(values) do
    Http.post("dealCustomFieldData/bulkCreate", values)
  end

  @doc """
  Retrieve a custom field value
  """
  @spec get(integer()) :: {:ok, map()} | {:error, any()}
  def get(id) do
    Http.get("dealCustomFieldData/#{id}")
  end

  @doc """
  Update a custom field value
  """
  @spec update(integer(), map()) :: {:ok, map()} | {:error, any()}
  def update(id, value) do
    Http.put("dealCustomFieldData/#{id}", %{dealCustomFieldDatum: value})
  end

  @doc """
  Bulk update a custom field value
  """
  @spec bulk_update(list(map())) :: {:ok, map()} | {:error, any()}
  def bulk_update(values) do
    Http.patch("dealCustomFieldData/bulkUpdate", values)
  end

  @doc """
  Delete a custom field value
  """
  @spec delete(integer()) :: {:ok, map()} | {:error, any()}
  def delete(id) do
    Http.delete("dealCustomFieldData/#{id}")
  end

  @doc """
  List all custom field values
  """
  @spec list(map()) :: {:ok, map()} | {:error, any()}
  def list(query_params \\ %{}) do
    Http.get("dealCustomFieldData?" <> Http.encode_query(query_params))
  end
end
