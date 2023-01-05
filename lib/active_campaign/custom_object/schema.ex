defmodule ActiveCampaign.CustomObject.Schema do
  @moduledoc """
  Documentation for `ActiveCampaign.CustomObject.Schema`.
  """

  alias ActiveCampaign.Http

  @doc """
  List all schemas
  """
  @spec list(map()) :: {:ok, map()} | {:error, any()}
  def list(query_params \\ %{}) do
    Http.get("customObjects/schemas?" <> Http.encode_query(query_params))
  end

  @doc """
  Retrieve a schema
  """
  @spec get(integer()) :: {:ok, map()} | {:error, any()}
  def get(id) do
    Http.get("customObjects/schemas/#{id}")
  end

  @doc """
  Create a schema
  """
  @spec create(map()) :: {:ok, map()} | {:error, any()}
  def create(schema) do
    Http.post("customObjects/schemas", %{schema: schema})
  end

  @doc """
  Update a schema
  """
  @spec update(integer(), map()) :: {:ok, map()} | {:error, any()}
  def update(id, schema) do
    Http.put("customObjects/schemas/#{id}", %{schema: schema})
  end

  @doc """
  Delete a schema
  """
  @spec delete(integer()) :: {:ok, map()} | {:error, any()}
  def delete(id) do
    Http.delete("customObjects/schemas/#{id}")
  end

  @doc """
  Delete a field
  """
  @spec delete_field(integer(), integer()) :: {:ok, map()} | {:error, any()}
  def delete_field(schema_id, field_id) do
    Http.delete("customObjects/schemas/#{schema_id}/fields/#{field_id}")
  end

  @doc """
  Create a public schema
  """
  @spec create_public_schema(map()) :: {:ok, map()} | {:error, any()}
  def create_public_schema(schema) do
    Http.post("customObjects/schemas/public", %{schema: schema})
  end

  @doc """
  Create a public schema
  """
  @spec create_child_schema(integer()) :: {:ok, map()} | {:error, any()}
  def create_child_schema(id) do
    Http.post("customObjects/schemas/#{id}/child")
  end
end
