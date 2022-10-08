defmodule ActiveCampaign.Task.TypeOutcomeRelation do
  @moduledoc """
  Documentation for `ActiveCampaign.Task.TypeOutcomeRelation`.
  """

  use ActiveCampaign.Crud,
    fun: [:get, :delete, :list],
    endpoint: "tasktypeOutcomeRels",
    name: "task type - outcome relation"
end
