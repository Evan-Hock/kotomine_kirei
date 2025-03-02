defmodule KotomineKirei.MixProject do
  use Mix.Project

  def project do
    [
      app: :kotomine_kirei,
      version: "0.1.0",
      elixir: "~> 1.17",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      mod: {KotomineKirei.Application, []},
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:nostrum, github: "Kraigie/nostrum", override: true},
      {:nosedrum, github: "jchristgit/nosedrum", override: true},
      {:ecto, "~> 3.12"},
      {:ecto_sql, "~> 3.12"},
      {:myxql, "~> 0.7.0"}
    ]
  end
end
