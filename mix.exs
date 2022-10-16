defmodule DesigningDataIntensiveApplications.MixProject do
  use Mix.Project

  def project do
    [
      app: :designing_data_intensive_applications,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),

      # Docs
      name: "Designing Data Intensive Applications",
      source_url: "https://github.com/oliveigah/BN-designing-data-intensive-applications",
      homepage_url:
        "https://techfromscratch.com.br/book-notes/designing-data-intensive-applications",
      docs: [
        # The main page in the docs
        main: "chapter_1",
        extras: [
          "./lib/chapters/chapter_1.md"
        ]
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, "~> 0.27", only: :dev, runtime: false}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
