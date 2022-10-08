# ActiveCampaign


[![Module Version](https://img.shields.io/hexpm/v/active_campaign.svg)](https://hex.pm/packages/active_campaign)
[![Hex Docs](https://img.shields.io/badge/hex-docs-lightgreen.svg)](https://hexdocs.pm/active_campaign/)
[![License](https://img.shields.io/hexpm/l/active_campaign.svg)](https://github.com/Health-Union/active_campaign/blob/master/LICENSE)
[![Last Updated](https://img.shields.io/github/last-commit/Health-Union/active_campaign.svg)](https://github.com/Health-Union/active_campaign/commits/main)

A thin wrapper around the Active Campaign [version 3 API](https://developers.activecampaign.com/reference/overview).

## Installation

First, add the ActiveCampaign package to your `mix.exs` dependencies:

```elixir
def deps do
  [
    {:active_campaign, "~> 0.2.0"}
  ]
end
```

and run `$ mix deps.get`

## Usage

Put your API key and API URL in your `config.exs` file:

```elixir
config :active_campaign,
  api_key: "myApiKey",
  api_url: "https://example.api-us1.com"
```
