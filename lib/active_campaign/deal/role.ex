defmodule ActiveCampaign.Deal.Role do
  @moduledoc """
  Documentation for `ActiveCampaign.Deal.Role`.
  """

  alias ActiveCampaign.Http

  @doc """
  List all deal roles
  """
  @spec list(map()) :: {:ok, map()} | {:error, any()}
  def list(query_params \\ %{}) do
    Http.get("dealRoles?" <> Http.encode_query(query_params))
  end

  @doc """
  Create a deal role
  """
  @spec create(String.t()) :: {:ok, map()} | {:error, any()}
  def create(title) do
    Http.post("dealRoles", %{title: title})
  end

  @doc """
  Delete a deal role
  """
  @spec delete(integer()) :: {:ok, map()} | {:error, any()}
  def delete(id) do
    Http.delete("dealRoles/#{id}")
  end
end
