defmodule Harald.MixProject do
  use Mix.Project

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  def project do
    [
      app: :harald,
      deps: deps(),
      description: description(),
      docs: docs(),
      elixir: "~> 1.10",
      elixirc_paths: elixirc_paths(Mix.env()),
      package: package(),
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ],
      source_url: "https://github.com/verypossible-labs/harald",
      start_permanent: Mix.env() == :prod,
      test_coverage: [tool: ExCoveralls],
      version: "0.3.0"
    ]
  end

  defp deps do
    [
      {:circuits_uart, "~> 1.3"},
      {:ex_doc, "~> 0.23", only: [:dev], runtime: false},
      {:excoveralls, "~> 0.10", only: [:test], runtime: false},
      {:hook, "~> 0.6.0"},
      {:mix_test_watch, "~> 0.9", only: [:dev], runtime: false},
      {:stream_data, "~> 0.1", only: [:test]}
    ]
  end

  defp description do
    """
    An Elixir Bluetooth HCI data binding.
    """
  end

  defp docs do
    [
      main: "readme",
      extras: []
    ]
  end

  defp elixirc_paths(:test), do: ["test/support", "lib"]

  defp elixirc_paths(_), do: ["lib"]

  defp package do
    [
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/verypossible-labs/harald"}
    ]
  end
end
