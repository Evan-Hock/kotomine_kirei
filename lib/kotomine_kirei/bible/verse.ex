defmodule KotomineKirei.Bible.Verse do
  alias KotomineKirei.Bible.{Book, Translation}

  use Ecto.Schema

  @primary_key :false
  schema "verses" do
    belongs_to :translation, Translation, primary_key: true
    belongs_to :book, Book, primary_key: true
    field :verse, :integer, primary_key: true
    field :text, :string
  end
end
