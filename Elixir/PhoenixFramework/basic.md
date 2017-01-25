* [Command lines](#common-command-lines)


******

## Common Command Lines
- `mix phoenix.new <AppName> --no-brunch ` : create new phoenix project, don't not use brunch for static asset building.
(phoenix uses [brunch](http://brunch.io/) as default assets tool building)

  + **--module** - the name of the base module in the generated skeleton
  + **--database** - specify the database adapter for ecto.

- `mix phoenix.server` : run phoenix server
- `iex -S mix`: run IEx (Interactive Elixir)
- `iex -S mix phoenix.server`: same as `rails console` in rails, and this command also run server
- `mix do deps.{get, compile}`: pull down and compile application dependencies
- `mix ecto.create`: create database


## Static Assets
- Static assets are served from `priv/static/` folder.
- The assets are mounted at the root path, so
`priv/static/js/phoenix.js` would be served from `example.com/js/phoenix.js`
- look in `endpoint.ex` we should see:
```Elixir
plug Plug.Static, at: "/", from: :my_app,
                  only: ~w(css images js favicon.ico robots.txt)
```
