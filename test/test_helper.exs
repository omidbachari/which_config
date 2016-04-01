ExUnit.start

Mix.Task.run "ecto.create", ~w(-r WhichConfig.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r WhichConfig.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(WhichConfig.Repo)

