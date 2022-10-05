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
end
