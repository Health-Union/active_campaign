defmodule ActiveCampaign.MixProject do
  use Mix.Project

  @source_url "https://github.com/Health-Union/active_campaign"
  @version "0.1.0"

  def project do
    [
      app: :active_campaign,
      version: @version,
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      docs: docs(),
      package: package()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:credo, "~> 1.6", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.28.5", only: :dev, runtime: false},
      {:httpoison, "~> 1.8"},
      {:jason, "~> 1.4"}
    ]
  end

  defp package do
    [
      description: "A basic Elixir wrapper for version 3 of the ActiveCampaign API.",
      files: ["lib", "mix.exs", "README.md", "LICENSE"],
      maintainers: ["Steve DeGele"],
      licenses: ["MIT"],
      links: %{"GitHub" => @source_url}
    ]
  end

  defp docs do
    [
      extras: [
        LICENSE: [title: "License"],
        "README.md": [title: "Overview"]
      ],
      groups_for_modules: [
        Base: [
          ActiveCampaign,
          ActiveCampaign.Config,
          ActiveCampaign.Crud,
          ActiveCampaign.Http
        ],
        Accounts: [
          ActiveCampaign.Account,
          ActiveCampaign.Account.Contact,
          ActiveCampaign.Account.Field,
          ActiveCampaign.Account.FieldValue
        ],
        Addresses: [ActiveCampaign.Address],
        Automations: [ActiveCampaign.Automation],
        Branding: [ActiveCampaign.Branding],
        "Calendar Feeds": [ActiveCampaign.CalendarFeed],
        Campaigns: [
          ActiveCampaign.Campaign,
          ActiveCampaign.Message
        ],
        Contacts: [
          ActiveCampaign.Contact,
          ActiveCampaign.Contact.Automation,
          ActiveCampaign.Contact.CustomField,
          ActiveCampaign.Contact.CustomFieldValue,
          ActiveCampaign.Contact.EmailActivity,
          ActiveCampaign.Contact.Status,
          ActiveCampaign.Contact.Tag
        ],
        "Custom Objects": [
          ActiveCampaign.CustomObject.Record,
          ActiveCampaign.CustomObject.Schema
        ],
        Deals: [
          ActiveCampaign.Deal,
          ActiveCampaign.Deal.Contact,
          ActiveCampaign.Deal.Field,
          ActiveCampaign.Deal.FieldValue,
          ActiveCampaign.Deal.Group,
          ActiveCampaign.Deal.Role,
          ActiveCampaign.Deal.Stage,
          ActiveCampaign.Deal.Status
        ],
        "Deepdata Integrations": [
          ActiveCampaign.Connection,
          ActiveCampaign.Ecom.Customer,
          ActiveCampaign.Ecom.Order,
          ActiveCampaign.Ecom.OrderProduct
        ],
        Forms: [ActiveCampaign.Form],
        Lists: [ActiveCampaign.List],
        Notes: [ActiveCampaign.Note],
        "Saved Responses": [ActiveCampaign.SavedResponse],
        Scores: [ActiveCampaign.Score],
        Segments: [ActiveCampaign.Segment],
        Settings: [ActiveCampaign.Setting],
        "Site & Event Tracking": [
          ActiveCampaign.Tracking.Event,
          ActiveCampaign.Tracking.Site
        ],
        Tags: [ActiveCampaign.Tag],
        Tasks: [
          ActiveCampaign.Task,
          ActiveCampaign.Task.Outcome,
          ActiveCampaign.Task.Type
        ],
        "Task Types and Outcomes Relations": [
          ActiveCampaign.Task.TypeOutcomeRelation
        ],
        "Task Reminders/Notifications": [
          ActiveCampaign.Task.Reminder
        ],
        Templates: [ActiveCampaign.Template],
        Users: [ActiveCampaign.User, ActiveCampaign.Group],
        Webhooks: [ActiveCampaign.Webhook]
      ],
      main: "readme",
      source_url: @source_url,
      formatters: ["html"]
    ]
  end
end
