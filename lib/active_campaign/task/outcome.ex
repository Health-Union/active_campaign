defmodule ActiveCampaign.Task.Outcome do
  @moduledoc """
  Documentation for `ActiveCampaign.Task.Outcome`.
  """

  use ActiveCampaign.Crud,
    fun: [:get, :create, :update, :delete, :list],
    endpoint: "taskOutcomes",
    key: :taskOutcome,
    name: "task outcome"
end
