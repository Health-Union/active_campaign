defmodule ActiveCampaign.Message do
  @moduledoc """
  Documentation for `ActiveCampaign.Message`.
  """

  use ActiveCampaign.Crud,
    fun: [:get, :create, :update, :delete, :list],
    endpoint: "messages",
    key: :message
end
