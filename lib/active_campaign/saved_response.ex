defmodule ActiveCampaign.SavedResponse do
  @moduledoc """
  Documentation for `ActiveCampaign.SavedResponse`.
  """

  alias ActiveCampaign.Http

  @doc """
  Create a saved response
  """
  @spec create(map()) :: {:ok, map()} | {:error, any()}
  def create(saved_response) do
    Http.post("savedResponses", %{savedResponse: saved_response})
  end

  @doc """
  Retrieve a saved response
  """
  @spec get(integer()) :: {:ok, map()} | {:error, any()}
  def get(id) do
    Http.get("savedResponses/#{id}")
  end

  @doc """
  Update a saved response
  """
  @spec update(integer(), map()) :: {:ok, map()} | {:error, any()}
  def update(id, saved_response) do
    Http.put("savedResponses/#{id}", %{savedResponse: saved_response})
  end

  @doc """
  Delete a saved response
  """
  @spec delete(integer()) :: {:ok, map()} | {:error, any()}
  def delete(id) do
    Http.delete("savedResponses/#{id}")
  end

  @doc """
  List all saved responses
  """
  @spec list(map()) :: {:ok, map()} | {:error, any()}
  def list(query_params \\ %{}) do
    Http.get("savedResponses?" <> Http.encode_query(query_params))
  end
end
