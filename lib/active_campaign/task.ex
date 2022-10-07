defmodule ActiveCampaign.Task do
  @moduledoc """
  Documentation for `ActiveCampaign.Task`.
  """

  alias ActiveCampaign.Http

  @doc """
  Create a task
  """
  @spec create(map()) :: {:ok, map()} | {:error, any()}
  def create(task) do
    Http.post("dealTasks", %{dealTask: task})
  end

  @doc """
  Retrieve a task
  """
  @spec get(integer()) :: {:ok, map()} | {:error, any()}
  def get(id) do
    Http.get("dealTasks/#{id}")
  end

  @doc """
  Update a task
  """
  @spec update(integer(), map()) :: {:ok, map()} | {:error, any()}
  def update(id, task) do
    Http.put("dealTasks/#{id}", %{dealTask: task})
  end

  @doc """
  Delete a task
  """
  @spec delete(integer()) :: {:ok, map()} | {:error, any()}
  def delete(id) do
    Http.delete("dealTasks/#{id}")
  end

  @doc """
  List all tasks
  """
  @spec list(map()) :: {:ok, map()} | {:error, any()}
  def list(query_params) do
    Http.get("dealTasks?" <> Http.encode_query(query_params))
  end
end
