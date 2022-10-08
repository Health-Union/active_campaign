defmodule ActiveCampaign.Group do
  @moduledoc """
  Documentation for `ActiveCampaign.Group`.
  """

  use ActiveCampaign.Crud,
    fun: [:get, :create, :update, :delete, :list],
    endpoint: "groups",
    key: :group

  @doc """
  Retrieve a user by email
  """
  @spec list_group_limits(map()) :: {:ok, map()} | {:error, any()}
  def list_group_limits(query_params \\ %{}) do
    Http.get("groupLimits?" <> Http.encode_query(query_params))
  end
end
