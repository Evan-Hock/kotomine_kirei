defmodule KotomineKirei.Bible.Book do
  use Ecto.Schema

  @primary_key false
  schema "books" do
    field :id, :integer, primary_key: true
    field :language, :string, primary_key: true
    field :name, :string
  end
end
