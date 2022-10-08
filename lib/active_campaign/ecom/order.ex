defmodule ActiveCampaign.Ecom.Order do
  @moduledoc """
  Documentation for `ActiveCampaign.Ecom.Order`.
  """

  use ActiveCampaign.Crud,
    fun: [:get, :create, :update, :delete, :list],
    endpoint: "ecomOrders",
    key: :ecomOrder,
    name: "order"
end
