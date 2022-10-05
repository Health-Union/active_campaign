defmodule ActiveCampaign.Deal do
  @moduledoc """
  Documentation for `ActiveCampaign.Deal`.
  """

  alias ActiveCampaign.Http

  @doc """
  Create a deal

  ## Examples

      iex> ActiveCampaign.Deal.create(%{contact: "51", ...})
      {:ok, %{...}}
  """
  @spec create(map()) :: {:ok, map()} | {:error, any()}
  def create(deal) do
    Http.post("deals", %{deal: deal})
  end

  @doc """
  Retrieve a deal

  ## Examples

      iex> ActiveCampaign.Deal.get(123)
      {:ok, %{"owner" => "1", ...}}
  """
  @spec get(integer) :: {:ok, map()} | {:error, any()}
  def get(id) do
    Http.get("deals/#{id}")
  end

  @doc """
  Update a deal

  ## Examples

      iex> ActiveCampaign.Deal.update(123, %{contact: "51", ...})
      {:ok, %{...}}
  """
  @spec update(integer(), map()) :: {:ok, map()} | {:error, any()}
  def update(id, deal) do
    Http.put("deals/#{id}", %{deal: deal})
  end

  @doc """
  Delete a deal

  ## Examples

      iex> ActiveCampaign.Deal.delete(123)
      {:ok, %{...}}
  """
  @spec delete(integer()) :: {:ok, map()} | {:error, any()}
  def delete(id) do
    Http.delete("deals/#{id}")
  end

  @doc """
  List all deals

  ## Examples

      iex> ActiveCampaign.Deal.list()
      {:ok, %{...}}
  """
  @spec list(map()) :: {:ok, map()} | {:error, any()}
  def list(query) do
    query = URI.encode_query(query)
    Http.get("deals?#{query}")
  end

  @doc """
  Create a deal note

  ## Examples

      iex> ActiveCampaign.Deal.create_note(123, %{note: "Note for the deal"})
      {:ok, %{...}}
  """
  @spec create_note(integer(), map()) :: {:ok, map()} | {:error, any()}
  def create_note(id, note) do
    Http.post("deals/#{id}/notes", %{note: note})
  end

  @doc """
  Update a deal note

  ## Examples

      iex> ActiveCampaign.Deal.update_note(123, %{note: "Update with more info"})
      {:ok, %{...}}
  """
  @spec update_note(integer(), integer(), map()) :: {:ok, map()} | {:error, any()}
  def update_note(id, note_id, note) do
    Http.put("deals/#{id}/notes/#{note_id}", %{note: note})
  end

  @doc """
  Bulk Update Deal Owners

  ## Examples

      iex> ActiveCampaign.Deal.bulk()
      {:ok, %{...}}
  """
  @spec bulk(list(map())) :: {:ok, map()} | {:error, any()}
  def bulk(deals) do
    Http.patch("deals/bulkUpdate", %{deals: deals})
  end
end
