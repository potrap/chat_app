defmodule ChatApp.MixProject do
  use Mix.Project

  def project do
    [
      app: :chat_app,
      version: "0.1.0",
      elixir: "~> 1.17",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application() do
    [
      mod: {ChatApp.Application, []},
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:plug, "~> 1.15.3"},
      {:cowboy, "~> 2.8.0"},
      {:nitro, "~> 8.2.4"},
      {:n2o, "~> 10.12.4"},
      {:syn, "~> 2.1.1"},
      {:faker, "~> 0.17"}
    ]
  end
end
