defmodule KotomineKirei.Bible.Translation do
  use Ecto.Schema

  schema "translations" do
    field :name, :string
    field :language, :string
  end
end
