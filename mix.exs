defmodule Bio.Mixfile do
  use Mix.Project

  def project do
    [
      app: :bio,
      version: version(),
      elixir: elixir_versions(),
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      elixirc_paths: elixirc_paths(Mix.env),
      deps: deps(),
      description: description(),
      docs: docs()
    ]
  end

  def application() do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps() do
    [
      # dev deps
      {:ex_doc,  "~> 0.14", only: [:dev]},
    ]
  end


  defp description() do
    ~s"""
    A bioinformatics toolkit
    """
  end

  defp docs() do
    [
    main: "Bio",
    extras: []
    ]
  end

  defp elixir_versions() do
    "~> 1.4"
  end

  defp elixirc_paths(:test) do
    ["lib", "test/support"]
  end
  defp elixirc_paths(_) do
    ["lib"]
  end

  defp package do
    %{
      licenses: ["Apache 2.0"],
      maintainers: ["Stephen Moloney"],
      links: %{ "GitHub" => "https://github.com/stephenmoloney/bio"},
      files: ~w(lib mix.exs CHANGELOG* README* LICENCE*)
     }
  end

  defp version() do
    "0.0.1"
  end

end
