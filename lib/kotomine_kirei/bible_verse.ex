defmodule KotomineKirei.BibleVerse do
  @moduledoc """
  Struct for representing a Discord message embed of a Bible Verse.
  """

  use Nostrum.Struct.Embed


  alias Nostrum.Struct.Embed.{Author, Footer, Field}


  @type t ::
    %__MODULE__{
      reference: String.t(),
      text: String.t(),
      translation: String.t()
    }


  @enforce_keys [:reference, :text, :translation]
  defstruct [
    :reference,
    :text,
    :translation
  ]


  @impl true
  @spec author(t) :: Author.t
  def author(_) do
    %Author{
      name: "Kotomine Kirei",
      url: "https://www.youtube.com/watch?v=Rv95HOdN2ks"
    }
  end


  @impl true
  @spec color(t) :: non_neg_integer
  def color(_),
    do: 0x482873


  @impl true
  @spec title(t) :: String.t
  def title(_),
    do: "Your bible verse"


  @impl true
  @spec fields(t) :: list(Field.t)
  def fields(bible_verse) do
    [
      %Field{
        name: bible_verse.reference,
        value: bible_verse.text
      }
    ]
  end


  @impl true
  @spec footer(t) :: Footer.t
  def footer(bible_verse),
    do: %Footer{text: bible_verse.translation}
end
