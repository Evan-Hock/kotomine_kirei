defmodule KotomineKirei.Bible.Translation do
  @moduledoc """
  Schema for Bible translations.
  """
  @moduledoc since: "0.0.1"

  use Ecto.Schema

  schema "translations" do
    field :name, :string
    field :language, :string
  end
end
