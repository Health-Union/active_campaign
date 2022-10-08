defmodule ActiveCampaign.Task.Reminder do
  @moduledoc """
  Documentation for `ActiveCampaign.Task.Reminder`.
  """

  alias ActiveCampaign.Http

  @doc """
  Create a task reminder
  """
  @spec create(map()) :: {:ok, map()} | {:error, any()}
  def create(data) do
    Http.post("taskNotifications", data)
  end
end
