defmodule ActiveCampaign.Account.Contact do
  @moduledoc """
  Documentation for `ActiveCampaign.Account.Contact`.
  """

  use ActiveCampaign.Crud,
    fun: [:get, :create, :update, :delete, :list],
    endpoint: "accountContacts",
    key: :accountContact,
    name: "association"
end
