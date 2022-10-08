defmodule ActiveCampaign.Form do
  @moduledoc """
  Documentation for `ActiveCampaign.Form`.
  """

  alias ActiveCampaign.Http

  @doc """
  Retrieve a form
  """
  @spec get(integer()) :: {:ok, map()} | {:error, any()}
  def get(id) do
    Http.get("forms/#{id}")
  end

  @doc """
  List all forms
  """
  @spec list(map()) :: {:ok, map()} | {:error, any()}
  def list(query_params \\ %{}) do
    Http.get("forms?" <> Http.encode_query(query_params))
  end
end
