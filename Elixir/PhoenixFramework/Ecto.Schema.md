* [Command Lines](#command-lines)
* [Unique Validation](#unique-validation)

- [Doc](https://hexdocs.pm/ecto/Ecto.Schema.html#schema/2)
- Ecto.Schema is used to map a data source to Elixir struct.
```elixir
  defmodule User do
    use Ecto.Schema

    schema "users" do
      field :name, :string
      field :age, :integer, default: 0
      has_many :posts, Post
    end
  end
```
- Ecto supports two ID types, called `:id` and `:binary_id`

  + The `:id` type is used when the primary key is an integer
  + the `:binary_id` is used for primary keys in particular binary formats, which may be `Ecto.UUID`

- **Custom types** is a module that implements the `Ecto.Type` behaviour.
- Schemas can also have _**virtual fields**_ by passing the `virtual:` true option. These fields **are not persisted to the database** and can optionally not be type checked by declaring type `:any`


### Command lines
- `mix ecto.drop` : drop database
- `mix ecto.create` : create database
- `mix ecto.gen.migration` : generate migration
- `mix ecto.migrate` : run migration

### Unique Validation
- `unique_constraint(changeset, field, opts \\ [])`
- The unique constraint works by relying on the database to check if the unique constraint has been violated or not and, if so, Ecto converts it into a changeset error.
- In order to use the uniqueness constraint, the first step is to define the unique index in a migration: `create unique_index(:users, [:email])`
