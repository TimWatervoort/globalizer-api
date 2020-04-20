# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     GlobalizerApi.Repo.insert!(%GlobalizerApi.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias GlobalizerApi.Repo
alias GlobalizerApi.Directory.Region

Repo.insert! %Region{ name: "greater_sweden", label: "Sweden", continent: "Europe" }

Repo.insert! %Region{ name: "usa_colorado", label: "Colorado", continent: "North America" }

Repo.insert! %Region{ name: "usa_louisiana", label: "Louisiana", continent: "North America" }
