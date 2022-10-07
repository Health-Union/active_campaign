defmodule ActiveCampaign.CustomObject.Record do
  @moduledoc """
  Documentation for `ActiveCampaign.CustomObject.Record`.
  """

  alias ActiveCampaign.Http

  @doc """
  List records by schema
  """
  @spec list(integer(), map()) :: {:ok, map()} | {:error, any()}
  def list(schema_id, query_params \\ %{}) do
    Http.get("customObjects/records/#{schema_id}?" <> Http.encode_query(query_params))
  end

  @doc """
  Create or update record
  """
  @spec create(integer(), map()) :: {:ok, map()} | {:error, any()}
  def create(schema_id, record) do
    Http.post("customObjects/records/#{schema_id}", %{record: record})
  end

  @doc """
  Get a record by id
  """
  @spec get(integer(), integer()) :: {:ok, map()} | {:error, any()}
  def get(schema_id, record_id) do
    Http.get("customObjects/records/#{schema_id}/#{record_id}")
  end

  @doc """
  Get a record by external id
  """
  @spec get(integer(), integer()) :: {:ok, map()} | {:error, any()}
  def get_by_external_id(schema_id, external_id) do
    Http.get("/records/#{schema_id}/external/#{external_id}")
  end

  @doc """
  Delete a record by id
  """
  @spec delete(integer(), integer()) :: {:ok, map()} | {:error, any()}
  def delete(schema_id, record_id) do
    Http.delete("customObjects/records/#{schema_id}/#{record_id}")
  end

  @doc """
  Delete a record by external ID
  """
  @spec delete(integer(), integer()) :: {:ok, map()} | {:error, any()}
  def delete_by_external_id(schema_id, external_id) do
    Http.delete("customObjects/records/#{schema_id}/external/#{external_id}")
  end
end
