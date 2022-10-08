defmodule ActiveCampaign.Account do
  @moduledoc """
  Documentation for `ActiveCampaign.Account`.
  """

  use ActiveCampaign.Crud,
    fun: [:get, :create, :update, :delete, :list],
    endpoint: "accounts",
    key: :account

  @doc """
  Create an account note
  """
  @spec create_note(integer(), String.t()) :: {:ok, map()} | {:error, any()}
  def create_note(account_id, note) do
    Http.post("accounts/#{account_id}/notes", %{note: %{note: note}})
  end

  @doc """
  Update an account note
  """
  @spec update_note(integer(), integer(), String.t()) :: {:ok, map()} | {:error, any()}
  def update_note(account_id, note_id, note) do
    Http.put("accounts/#{account_id}/notes/#{note_id}", %{note: %{note: note}})
  end

  @doc """
  Bulk delete accounts
  """
  @spec bulk_delete(list(integer())) :: {:ok, map()} | {:error, any()}
  def bulk_delete(account_ids) do
    Http.delete("accounts/bulk_delete?" <> Http.encode_query(%{ids: account_ids}))
  end
end
