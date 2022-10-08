defmodule ActiveCampaign.Account.Field do
  @moduledoc """
  Documentation for `ActiveCampaign.Account.Field`.
  """

  use ActiveCampaign.Crud,
    fun: [:get, :create, :update, :delete, :list],
    endpoint: "accountCustomFieldMeta",
    key: :accountCustomFieldMetum,
    name: "custom field"
end
