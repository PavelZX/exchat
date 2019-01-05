defmodule Exchat.Mixfile do
  use Mix.Project

  def project do
    [app: :exchat,
     version: "0.4.1",
     elixir: "~> 1.7",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix, :gettext] ++ Mix.compilers,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     test_coverage: [tool: ExCoveralls],
     preferred_cli_env: preferred_cli_env(),
     aliases: aliases(),
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [mod: {Exchat, []},
     applications: [:phoenix, :phoenix_html, :phoenix_pubsub, :cowboy, :logger, :gettext,
                    :phoenix_ecto, :postgrex, :comeonin, :joken]]
  end

  # Specifies which paths to compile per environment
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  defp aliases do
    [test: ["ecto.create --quiet", "ecto.migrate", "test"]]
  end

  # Specifies your project dependencies
  #
  # Type `mix help deps` for examples and options
  defp deps do
    [{:phoenix, "~> 1.4"},
     {:phoenix_html, "~> 2.13"},
     {:phoenix_live_reload, "~> 1.2", only: :dev},
     {:phoenix_pubsub, "~> 1.1.1"},
     {:phoenix_ecto, ">= 3.2.0 and < 3.5.0"},
     {:postgrex, ">= 0.0.0"},
     {:gettext, "~> 0.13.1"},
     {:ecto, "~> 2.1"},
     {:poison, ">= 0.0.0"},
     {:cowboy, "~> 2.6.1"},
     {:plug_cowboy, "~> 2.0.0"},
     {:comeonin, "~> 4.1.1"},
     {:bcrypt_elixir, "~> 1.1"},
     {:excoveralls, "~> 0.10.3", only: :test},
     {:joken, "~> 1.5.0"}]
  end

  defp preferred_cli_env do
    ["coveralls": :test, "coveralls.detail": :test, "coveralls.html": :test]
  end
end
