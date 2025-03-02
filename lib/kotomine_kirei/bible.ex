defmodule KotomineKirei.Bible do
  @moduledoc """
  Repo for Bible-related queries.
  """
  @moduledoc since: "0.0.1"

  import Ecto.Query, only: [first: 1, from: 2]
  import Ecto.Query.API


  alias KotomineKirei.Bible.Verse


  use Ecto.Repo,
    otp_app: :kotomine_kirei,
    adapter: Ecto.Adapters.MyXQL


  @spec random_verse() :: Ecto.Schema.t
  def random_verse() do
    query =
      from v in Verse,
        order_by: fragment("RAND()")

    one!(first(query))
  end

  @spec random_verse(translation_id :: integer) :: Ecto.Schema.t
  def random_verse(translation_id) do
    query =
      from v in Verse,
        where: v.translation_id == ^translation_id,
        order_by: fragment("RAND()")

    one!(first(query))
  end
end
