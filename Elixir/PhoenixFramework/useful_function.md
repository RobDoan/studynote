* [Controller](#Controller)
* [Model](#Model)
* [Plug](#Plug)

---------------------------------

# Controllers

#### [`scrub_params/2`](https://hexdocs.pm/phoenix/Phoenix.Controller.html#scrub_params/2)

  - Ensure the required keys exist.
  - Change empty values from the map in params with the required key to `nil`
  ```elixir
    defmodule PhoenixTrello.RegistrationController  do      
      plug :scrub_params, "user" when action in [:create]
    end
  ```

  If the required_key is not present, it will raise **Phoenix.MissingParamError.**

  If you have a params map which looks like: `%{"user" => %{"name" => "foo", "age" => ""}}`
  Then the `age` parameter would be converted to `nil`


#### `put_status/2` - set the HTTP status code of a response
  ```elixir
  def index(conn, _params) do
    conn
    |> put_status(202)
    |> render("index.html")
  end
  ```

  -  *status code* must be valid code.
  - Changing the code will not change the behavior of the response.
  Example: set status code is 404, but then render `index.html`, we will not get
  an error page.


# Model


# Plug

- The basic idea of Plug is to unify the concept of a "connection" that we operate on. This differs from other HTTP middleware layers such as Rack, where the request and response are separated in the middleware stack.
- **Plug function**:
  * Its parameters need to accept a connection struct (%Plug.Conn{}) and options.
  * And it needs to return the connection struct.
  * Using plug function: `plug :<function_name>, options`
  * Example:
  ```elixir
    def put_headers(conn, key_values) do
      Enum.reduce key_values, conn, fn {k, v}, conn ->
        Plug.Conn.put_resp_header(conn, to_string(k), v)
      end
    end
  ```
- **Plug module**:
  * Need to have 2 functions init/1 and call/2
  * init/1 which initializes any arguments or options to be passed to call/2
  * call/2 which carries out the connection transformation. call/2 is just a function plug that we saw earlier
  * Using: `plug <module_name>, options`
  * Example:
  ```elixir
  defmodule HelloPhoenix.Plugs.Locale do
    import Plug.Conn

    @locales ["en", "fr", "de"]

    def init(default), do: default

    def call(%Plug.Conn{params: %{"locale" => loc}} = conn, _default) when loc in @locales do
      assign(conn, :locale, loc)
    end
    def call(conn, default), do: assign(conn, :locale, default)
  end

  defmodule HelloPhoenix.Router do
    use HelloPhoenix.Web, :router

    pipeline :browser do
      plug :accepts, ["html"]    
      plug HelloPhoenix.Plugs.Locale, "en"
    end
  end
  ```
