defmodule ActiveCampaign.Ecom.Customer do
  @moduledoc """
  Documentation for `ActiveCampaign.Ecom.Customer`.
  """

  use ActiveCampaign.Crud,
    fun: [:get, :create, :update, :delete, :list],
    endpoint: "ecomCustomers",
    key: :ecomCustomer,
    name: "customer"
end
