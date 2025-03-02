defmodule KotomineKirei.Application do
  @moduledoc """
  Supervisor application for Kotomine Kirei.
  """
  @moduledoc since: "0.1.0"

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      KotomineKirei.Bible,
      KotomineKirei.Consumer,
      {Nosedrum.Storage.Dispatcher, name: Nosedrum.Storage.Dispatcher}
    ]

    options = [strategy: :rest_for_one, name: KotomineKirei.Supervisor]

    Supervisor.start_link(children, options)
  end

  def translations do
    KotomineKirei.Bible.all(KotomineKirei.Bible.Translation)
  end
end
