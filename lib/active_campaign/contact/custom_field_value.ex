defmodule ActiveCampaign.Contact.CustomFieldValue do
  @moduledoc """
  Documentation for `ActiveCampaign.Contact.CustomFieldValue`.
  """

  alias ActiveCampaign.Http

  @doc """
  Create a custom field value
  """
  @spec create(map()) :: {:ok, map()} | {:error, map()}
  def create(data) do
    Http.post("fieldValues", data)
  end

  @doc """
  Retrieve a custom field value
  """
  @spec get(integer()) :: {:ok, map()} | {:error, map()}
  def get(id) do
    Http.get("fieldValues/#{id}")
  end

  @doc """
  Update a custom field value for contact
  """
  @spec update(integer(), map()) :: {:ok, map()} | {:error, map()}
  def update(id, data) do
    Http.put("fieldValues/#{id}", data)
  end

  @doc """
  Delete a custom field value
  """
  @spec delete(integer()) :: {:ok, map()} | {:error, map()}
  def delete(id) do
    Http.delete("fieldValues/#{id}")
  end

  @doc """
  List all custom field values
  """
  @spec list :: {:ok, map()} | {:error, map()}
  def list do
    Http.get("fieldValues")
  end
end
