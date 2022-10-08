defmodule ActiveCampaign.Segment do
  @moduledoc """
  Documentation for `ActiveCampaign.Segment`.
  """

  alias ActiveCampaign.Http

  @doc """
  Retrieve a segment
  """
  @spec get(integer()) :: {:ok, map()} | {:error, any()}
  def get(id) do
    Http.get("segments/#{id}")
  end

  @doc """
  List all segments
  """
  @spec list(map()) :: {:ok, map()} | {:error, any()}
  def list(query_params \\ %{}) do
    Http.get("segments?" <> Http.encode_query(query_params))
  end
end
