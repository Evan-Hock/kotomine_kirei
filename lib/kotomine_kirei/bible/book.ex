defmodule KotomineKirei.Bible.Book do
  @moduledoc """
  Schema for books of the bible.
  """
  @moduledoc since: "0.0.1"

  use Ecto.Schema

  @primary_key false
  schema "books" do
    field :id, :integer, primary_key: true
    field :language, :string, primary_key: true
    field :name, :string
  end
end
