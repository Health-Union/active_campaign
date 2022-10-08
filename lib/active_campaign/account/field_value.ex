defmodule ActiveCampaign.Account.FieldValue do
  @moduledoc """
  Documentation for `ActiveCampaign.Account.FieldValue`.
  """

  use ActiveCampaign.Crud,
    fun: [:get, :create, :update, :delete, :list],
    endpoint: "accountCustomFieldData",
    key: :accountCustomFieldDatum,
    name: "custom field value"

  @doc """
  Bulk create a custom account field value
  """
  @spec bulk_create(list(map())) :: {:ok, map()} | {:error, map()}
  def bulk_create(values) do
    Http.post("accountCustomFieldData/bulkCreate", values)
  end

  @doc """
  Bulk update a custom field value
  """
  @spec bulk_update(list(map())) :: {:ok, map()} | {:error, map()}
  def bulk_update(values) do
    Http.patch("accountCustomFieldData/bulkUpdate", values)
  end
end
