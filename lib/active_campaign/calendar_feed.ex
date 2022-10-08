defmodule ActiveCampaign.CalendarFeed do
  @moduledoc """
  Documentation for `ActiveCampaign.CalendarFeed`.
  """

  use ActiveCampaign.Crud,
    fun: [:get, :create, :update, :delete, :list],
    endpoint: "calendars",
    key: :calendar,
    name: "calendar feed"
end
