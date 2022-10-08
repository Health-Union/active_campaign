defmodule ActiveCampaign.Deal.Contact do
  @moduledoc """
  Documentation for `ActiveCampaign.Deal.Contact`.
  """

  alias ActiveCampaign.Http

  @doc """
  Create a secondary contact
  """
  @spec create(map()) :: {:ok, map()} | {:error, any()}
  def create(contact) do
    Http.post("contactDeals", %{contactDeal: contact})
  end

  @doc """
  Retrieve a secondary contact
  """
  @spec get(integer()) :: {:ok, map()} | {:error, any()}
  def get(id) do
    Http.get("contactDeals/#{id}")
  end

  @doc """
  Update a secondary contact
  """
  @spec update(integer(), map()) :: {:ok, map()} | {:error, any()}
  def update(id, contact) do
    Http.put("contactDeals/#{id}", %{contactDeal: contact})
  end

  @doc """
  Delete a secondary contact
  """
  @spec delete(integer()) :: {:ok, map()} | {:error, any()}
  def delete(id) do
    Http.delete("contactDeals/#{id}")
  end

  @doc """
  List all secondary contacts
  """
  @spec list(map()) :: {:ok, map()} | {:error, any()}
  def list(query_params \\ %{}) do
    Http.get("contactDeals?" <> Http.encode_query(query_params))
  end
end
