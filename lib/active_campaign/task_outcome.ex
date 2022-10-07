defmodule ActiveCampaign.TaskOutcome do
  @moduledoc """
  Documentation for `ActiveCampaign.TaskOutcome`.
  """

  use ActiveCampaign.Crud,
    fun: [:get, :create, :update, :delete, :list],
    endpoint: "taskOutcomes",
    key: :taskOutcome
end
