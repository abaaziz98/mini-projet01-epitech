defmodule Gotham.Times.Workingtime do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Poison.Encoder, except: [:user]}
  schema "workingtimes" do
    field :end, :naive_datetime
    field :start, :naive_datetime
    belongs_to :user, Gotham.Accounts.User, on_replace: :update

    timestamps()
  end

  @doc false
  def changeset(workingtime, attrs) do
    workingtime
    |> cast(attrs, [:start, :end])
    |> cast_assoc(:user, with: &Gotham.Accounts.User.changeset/2)
    |> validate_required([:start, :end, :user])
    #|> validate_format(~N[:end], ~r/(\d{4})-(\d{2})-(\d{2}) (\d{2}):(\d{2}):(\d{2})/)
    #|> validate_format(~N[:start], ~r/(\d{4})-(\d{2})-(\d{2}) (\d{2}):(\d{2}):(\d{2})/)
  end
end
