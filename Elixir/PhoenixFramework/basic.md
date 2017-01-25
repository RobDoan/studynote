* [Command lines](#common-command-lines)


******

## Common Command Lines

- `mix phoenix.new <AppName> --no-brunch ` : create new phoenix project, don't not use brunch for static asset building.
(phoenix uses [brunch](http://brunch.io/) as default assets tool building)

  + **--module** - the name of the base module in the generated skeleton
  + **--database** - specify the database adapter for ecto.

- `mix phoenix.server` : run phoenix server
- `iex -S mix phoenix.server`: same as `rails console` in rails, and this command also run server
- `mix do deps.{get, compile}`: pull down and compile application dependencies
