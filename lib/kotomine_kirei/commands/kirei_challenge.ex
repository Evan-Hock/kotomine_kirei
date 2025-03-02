defmodule KotomineKirei.Commands.KireiChallenge do
  @moduledoc """
  /kireichallenge slash command.
  """
  @moduledoc since: "0.0.1"

  alias KotomineKirei.Bible
  alias KotomineKirei.Bible.{Translation, Book}
  alias KotomineKirei.Embed.BibleVerse


  @behaviour Nosedrum.ApplicationCommand


  @impl true
  def description,
    do: "Generates a random Bible verse."


  @impl true
  def type,
    do: :slash


  @impl true
  def options do
    [
      %{
        type: :string,
        name: "translation",
        description: "The translation to pull from",
        required: true,
        choices:
          Bible.all(Translation)
          |> Enum.map(&%{name: &1.name, value: &1.id})
      }
    ]
  end


  @impl true
  def command(interaction) do
    translation = Bible.get!(Translation, hd(interaction.data.options).value)

    content = Bible.random_verse(translation)

    book_name =
      Bible.get!(Book, [id: content.book_id, language: translation.language])


    embed =
      %BibleVerse{
        reference: "#{book_name} #{content.chapter}:#{content.verse}",
        text: content.text,
        translation: translation.name
      }

    [
      embeds: [embed]
    ]
  end
end
