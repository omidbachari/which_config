defmodule WhichConfig.Repo.Migrations.AddConstraintToConfigs do
  use Ecto.Migration

  def change do
    create unique_index(:configs, [:owner])
  end
end
