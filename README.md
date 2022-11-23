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
    {:active_campaign, "~> 0.2"}
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

## HTTP Library
ActiveCampagin comes with [HTTPoison](https://github.com/edgurgel/httpoison) as the default HTTP library. To use it, add `:httpoison` to your dependencies:

```elixir
{:httpoison, "~> 1.4"},
```

You can customize it to use another library via the `:http_library` configuration:

```elixir
config :active_campaign, :http_library, SomeOtherLib
```

This is useful for mocking responses when testing.

## JSON support

ActiveCampaign comes with JSON support out of the box via the [Jason](https://github.com/michalmuskala/jason) library. To use it, add `:jason` to your dependencies:

```elixir
{:jason, "~> 1.0"}
```

You can customize it to use another library via the `:json_library` configuration:

```elixir
config :active_campaign, :json_library, SomeOtherLib
```

Once you change the value, you have to recompile ActiveCampaign, which can be done by cleaning its current build:

```sh
mix deps.clean active_campaign --build
```
