defmodule ActiveCampaign.Task.Type do
  @moduledoc """
  Documentation for `ActiveCampaign.Task.Type`.
  """

  use ActiveCampaign.Crud,
    fun: [:get, :create, :update, :delete, :list],
    endpoint: "dealTasktypes",
    key: :dealTasktype,
    name: "task type"

  @doc """
  Move tasks to another task type
  """
  @spec move(integer(), integer()) :: {:ok, map()} | {:error, any()}
  def move(from_task_id, to_task_id) do
    Http.put("dealTasktypes/#{from_task_id}/dealTasks", %{dealTask: %{dealTaskType: to_task_id}})
  end
end
