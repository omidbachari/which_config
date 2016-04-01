defmodule WhichConfig.Config do
  use WhichConfig.Web, :model

  @derive { Poison.Encoder, only: [:owner, :config_handle] }

  schema "configs" do
    field :owner, :string
    field :config_handle, :string

    timestamps
  end

  @required_fields ~w(owner config_handle)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
