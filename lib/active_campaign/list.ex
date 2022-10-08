defmodule ActiveCampaign.List do
  @moduledoc """
  Documentation for `ActiveCampaign.List`.
  """

  alias ActiveCampaign.Http

  @doc """
  Create a list

  ## Examples

      iex> ActiveCampaign.List.create(%{
        name: "Name of List",
        stringid: "Name-of-list",
        sender_url: "http://activecampaign.com",
        sender_reminder: "You are receiving this email as you subscribed to a newsletter when making an order on our site.",
        send_last_broadcast: 0,
        carboncopy: "",
        subscription_notify: "",
        unsubscription_notify: "",
        user: 1
      })
      {:ok, %{"list" => %{...}}}
  """
  @spec create(map()) :: {:ok, map()} | {:error, any()}
  def create(list) do
    Http.post("lists", %{list: list})
  end

  @doc """
  Retrieve a list

  ## Examples

      iex> ActiveCampaign.List.get(1)
      {:ok, %{"list" => %{...}}}
  """
  @spec get(integer()) :: {:ok, map()} | {:error, any()}
  def get(id) do
    Http.get("lists/#{id}")
  end

  @doc """
  Delete a list
  """
  @spec delete(integer()) :: {:ok, map()} | {:error, any()}
  def delete(id) do
    Http.delete("lists/#{id}")
  end

  @doc """
  Retrieve all lists

  The number of lists returned defaults to 20, and can be changed with a limit parameter.

  ## Examples

      iex> ActiveCampaign.List.list()
      {:ok, %{"lists" => [...]}}

      iex> ActiveCampaign.List.list(%{limit: 1})
      {:ok, %{"lists" => [%{...}]}}

      iex> ActiveCampaign.List.list(%{"filters[name]" => "blue"})
      {:ok, %{"lists" => [%{"name" => "Blue Team", ...}, ...]}}
  """
  @spec list(map()) :: {:ok, map()} | {:error, any()}
  def list(params \\ %{}) do
    Http.get("lists?#{URI.encode_query(params)}")
  end

  @doc """
  Create a list group permission

  ## Examples

      iex> ActiveCampaign.List.create_list_group_permission(%{
        listid: 1,
        groupid: 1
      })
      {:ok, %{...}}
  """
  @spec create_list_group_permission(map()) :: {:ok, map()} | {:error, any()}
  def create_list_group_permission(list_group) do
    Http.post("listGroups", %{"listGroup" => list_group})
  end
end
