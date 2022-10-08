defmodule ActiveCampaign.Ecom.OrderProduct do
  @moduledoc """
  Documentation for `ActiveCampaign.Ecom.OrderProduct`.
  """

  use ActiveCampaign.Crud,
    fun: [:get, :list],
    endpoint: "ecomOrderProducts",
    key: :ecomOrder,
    name: "EcomOrderProducts"

  @doc """
  List EcomOrderProducts for a Specific EcomOrder
  """
  @spec list_products_for_order(integer()) :: {:ok, map()} | {:error, any()}
  def list_products_for_order(order_id) do
    Http.get("ecomOrders/#{order_id}/orderProducts")
  end
end
