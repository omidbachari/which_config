defmodule WhichConfig.Repo.Migrations.CreateConfig do
  use Ecto.Migration

  def change do
    create table(:configs) do
      add :owner, :string
      add :config_handle, :string

      timestamps
    end

  end
end
