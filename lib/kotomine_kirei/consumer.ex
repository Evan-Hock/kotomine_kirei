defmodule KotomineKirei.Consumer do
  @moduledoc """
  Discord consumer.
  """
  @moduledoc since: "0.0.1"

  use Nostrum.Consumer

  def handle_event({:READY, _data, _ws_state}) do
    case Nosedrum.Storage.Dispatcher.add_command("kireichallenge", KotomineKirei.Commands.KireiChallenge, :global) do
      {:ok, _} -> IO.puts("Successfully registered kireichallenge")
      e -> IO.inspect(e, label: "An error occurred while registering kireichallenge")
    end
  end

  def handle_event({:INTERACTION_CREATE, interaction, _ws_state}),
    do: Nosedrum.Storage.Dispatcher.handle_interaction(interaction)
end
