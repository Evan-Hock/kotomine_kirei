defmodule KotomineKirei.Commands.KireiChallenge do
  @moduledoc """
  /kireichallenge slash command.

  Accepts up to one argument: the desired Bible translation, which
  is restricted to the translations that exist in the database.
  """
  @moduledoc since: "0.0.1"

  alias KotomineKirei.Bible
  alias KotomineKirei.Bible.{Translation, Book}
  alias KotomineKirei.Embed.BibleVerse


  @behaviour Nosedrum.ApplicationCommand


  @impl true
  @doc false
  @spec description :: String.t
  def description,
    do: "Generates a random Bible verse."


  @impl true
  @doc false
  @spec type :: :slash
  def type,
    do: :slash


  @impl true
  @doc false
  @spec options :: [Nosedrum.ApplicationCommand.option]
  def options do
    [
      %{
        type: :string,
        name: "translation",
        description: "The translation to pull from",
        required: false,
        choices:
          Bible.all(Translation)
          |> Enum.map(&%{name: &1.name, value: &1.id})
      }
    ]
  end


  @impl true
  @doc false
  @spec command(interaction :: Nostrum.Struct.Interaction.t) :: Nosedrum.ApplicationCommand.response
  def command(interaction) do
    %{verse: verse, translation: translation} =
      case interaction.data.options do
        [%{name: "translation", value: value} | _] ->
          translation = Bible.get!(Translation, value)
          verse = Bible.random_verse(translation)
          %{verse: verse, translation: translation}
        _ ->
          verse = Bible.random_verse()
          translation = Bible.get!(Translation, verse.translation_id)
          %{verse: verse, translation: translation}
      end

    book =
      Bible.get!(Book, [id: verse.book_id, language: translation.language])

    embed =
      %BibleVerse{
        reference: "#{book.name} #{verse.chapter}:#{verse.verse}",
        text: verse.text,
        translation: translation.name
      }

    [
      embeds: [embed]
    ]
  end
end
