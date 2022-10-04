defmodule ActiveCampaign.Note do
  @moduledoc """
  Documentation for `ActiveCampaign.Note`.
  """

  alias ActiveCampaign.Http

  @doc """
  Create a note

  ## Examples

      iex> ActiveCampaign.Note.create(%{
        note: "This is the text of the note",
        relid: 2,
        reltype: "Subscriber"
      })
      {:ok, %{"note" => %{...}}}
  """
  @spec create(map()) :: {:ok, map()} | {:error, any()}
  def create(note) do
    Http.post("notes", %{note: note})
  end

  @doc """
  Retrieve a note

  ## Examples

      iex> ActiveCampaign.Note.get(1)
      {:ok, %{"note" => %{...}}}
  """
  @spec get(integer()) :: {:ok, map()} | {:error, any()}
  def get(id) do
    Http.get("notes/#{id}")
  end

  @doc """
  Update a note

  ## Examples

      iex> ActiveCampaign.Note.update(
        1,
        %{
          note: "This is the text of the note",
          relid: 2,
          reltype: "Subscriber"
        }
      )
      {:ok, %{"note" => %{...}}}
  """
  @spec update(integer(), map()) :: {:ok, map()} | {:error, any()}
  def update(id, data) do
    Http.put("notes/#{id}")
  end

  @doc """
  Delete a note

  ## Examples

      iex> ActiveCampaign.Note.delete(1)
      {:ok, %{...}}
  """
  @spec delete(integer()) :: {:ok, map()} | {:error, any()}
  def delete(id) do
    Http.delete("notes/#{id}")
  end
end
