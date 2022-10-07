defmodule ActiveCampaign.Webhook do
  @moduledoc """
  Documentation for `ActiveCampaign.Webhook`.
  """

  alias ActiveCampaign.Http

  @doc """
  Create a webhook
  """
  @spec create(map()) :: {:ok, map()} | {:error, any()}
  def create(webhook) do
    Http.post("webhooks", %{webhook: webhook})
  end

  @doc """
  Retrieve a webhook
  """
  @spec get(integer()) :: {:ok, map()} | {:error, any()}
  def get(id) do
    Http.get("webhooks/#{id}")
  end

  @doc """
  Update a webhook
  """
  @spec update(integer(), map()) :: {:ok, map()} | {:error, any()}
  def update(id, webhook) do
    Http.put("webhooks/#{id}", %{webhook: webhook})
  end

  @doc """
  Delete a webhook
  """
  @spec delete(integer()) :: {:ok, map()} | {:error, any()}
  def delete(id) do
    Http.delete("webhooks/#{id}")
  end

  @doc """
  List all webhooks
  """
  @spec list(map()) :: {:ok, map()} | {:error, any()}
  def list(query_params \\ %{}) do
    Http.get("webhooks?" <> Http.encode_query(query_params))
  end

  @doc """
  List all webhook events
  """
  @spec list_events(map()) :: {:ok, map()} | {:error, any()}
  def list_events(query_params \\ %{}) do
    Http.get("webhook/events?" <> Http.encode_query(query_params))
  end
end
