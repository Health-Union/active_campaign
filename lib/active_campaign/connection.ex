defmodule ActiveCampaign.Connection do
  @moduledoc """
  Documentation for `ActiveCampaign.Connection`.
  """

  use ActiveCampaign.Crud,
    fun: [:get, :create, :update, :delete, :list],
    endpoint: "connections",
    key: :connection
end
