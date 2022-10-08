defmodule ActiveCampaign.User do
  @moduledoc """
  Documentation for `ActiveCampaign.User`.
  """

  use ActiveCampaign.Crud,
    fun: [:get, :create, :update, :delete, :list],
    endpoint: "users",
    key: :user

  @doc """
  Retrieve a user by email
  """
  @spec get_by_email(String.t()) :: {:ok, map()} | {:error, any()}
  def get_by_email(email) do
    Http.get("users/email/#{email}")
  end

  @doc """
  Retrieve a user by username
  """
  @spec get_by_username(String.t()) :: {:ok, map()} | {:error, any()}
  def get_by_username(username) do
    Http.get("users/username/#{username}")
  end

  @doc """
  Retrieve logged-in user
  """
  @spec me :: {:ok, map()} | {:error, any()}
  def me do
    Http.get("users/me")
  end
end
