defmodule ActiveCampaign.Address do
  @moduledoc """
  Documentation for `ActiveCampaign.Address`.
  """

  alias ActiveCampaign.Http

  @doc """
  Create an address
  """
  @spec create(map()) :: {:ok, map()} | {:error, any()}
  def create(address) do
    Http.post("addresses", %{address: address})
  end

  @doc """
  Retrieve an address
  """
  @spec get(integer()) :: {:ok, map()} | {:error, any()}
  def get(id) do
    Http.get("addresses/#{id}")
  end

  @doc """
  Update an address
  """
  @spec update(integer(), map()) :: {:ok, map()} | {:error, any()}
  def update(id, address) do
    Http.put("addresses/#{id}", %{address: address})
  end

  @doc """
  Delete an address
  """
  @spec delete(integer()) :: {:ok, map()} | {:error, any()}
  def delete(id) do
    Http.delete("addresses/#{id}")
  end

  @doc """
  Delete address associated with a specific user group
  """
  @spec delete_address_group(integer()) :: {:ok, map()} | {:error, any()}
  def delete_address_group(address_group_id) do
    Http.delete("addressGroups/#{address_group_id}")
  end

  @doc """
  Delete address associated with a specific list
  """
  @spec delete_address_list(integer()) :: {:ok, map()} | {:error, any()}
  def delete_address_list(address_list_id) do
    Http.delete("addressLists/#{address_list_id}")
  end

  @doc """
  List all addresses
  """
  @spec list :: {:ok, map()} | {:error, any()}
  def list do
    Http.get("addresses")
  end
end
