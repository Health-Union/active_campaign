defmodule ActiveCampaign.Contact.EmailActivity do
  @moduledoc """
  Documentation for `ActiveCampaign.Contact.EmailActivity`.
  """

  alias ActiveCampaign.Http

  @doc """
  List all email activities
  """
  @spec list(map()) :: {:ok, map()} | {:error, map()}
  def list(filters \\ %{}) do
    Http.get("emailActivities?" <> Http.encode_query(filters))
  end
end
