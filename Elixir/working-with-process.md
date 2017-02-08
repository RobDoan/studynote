* Process Basic
* Node
* OTP
  + OTP Server - Genserver
  + OTP Supervisors
  + OTP Application


### Process Basic
- **PID**(Process Identifier) could be unique among all process in the world.
- `spawn` function kick off a new process and return a PID.
- `send` function: send a message to process. `send(<PID>, message)`
- `receive` is used to wait for messages.
```Elixir
  receive do
    {:ok, message} ->
      IO.puts message
  end
```
- user `after` to tell `receive` that we want to time out if a response is not received in so many milliseconds.
```Elixir
  receive do
    {:ok, message} ->
      IO.puts message
    after 500 ->
      IO.puts "The greeter has gone away"
  end
```
- To make our process to be able to handle multiple message, we can use [tail recursive](#tail-recursive). Example [here](Examples/spawn/spawn4.exs)
- If we want two processes to share in each other’s pain, we can link them.The `spawn_link` call spawns a process and links it to the caller in one operation.
  + Usually if you use `spawn`, your code don't know when the process die. Actually VM knows and report to console, but in your code, we don't know that. To handle and know when process die, we use `spawn_link`
  + When we use `spawn_link`, if a child process die, it killed the entire application. [Example](Examples/spawn/link2.exs)
  + You can tell Elixir to convert _exist_ signal from link process into a message that you can handle by `trapping` the exist. `Process.flag(:trap_exit, true)` [Example](Examples/spawn/link3.exs)


### Node
- A running Erlang VM, it handles its own events, process, memory, naming services and interprocess communication.
- Set node name: using `--name` or `--sname` options with iex
- `Node.connect <node-name>` to connect a node.
- When we run on local node, first field of PID will be 0, but when we run on remote node, it will be a positive value.
- **Cookie**
  + Before a node let other nodes connect, it will check permission of other nodes by comparing the cookies. You can set a cookie for a node by `--cookie` option if you run the IEX.`iex --sname one --cookie chocolate-chip`
  + When Erlang start, it looks for an `.erlang.cookie` file in your home directory. If it's doesn't exist, Erlang will create one and store a random string in it. It uses that string as the cookie for any node the user starts.
  + Be careful when connecting nodes over the public network - the cookie is transmitted in plain text.
- **:global**
  + `:global.register_name`
  + `:global.whereis_name`

### OTP
- long name: __Open Telecom Platform__
- OTP is actually a bundle that include Erlang, a database(Mnesia), and an innumerable number of libraries. It also defines a structure for your application.
- OTP defines systems in terms of hierachies of applications.
  + A application consist one or more process
  + These process one of a small number of OTP conventions, called **behaviors**
  + each implementation of one of these behaviors will run in its own process
  + special behavior, call supervisor, monitors the health of these processes, and implement strategies to restart these processes if need.

#### OTP Server - Genserver
- [Docs](https://hexdocs.pm/elixir/GenServer.html)
- When we write an OTP server actually we write a module which contains one or more callback functions with standard name. OTP will invoke appropriate callback to handle a particular situation.
- [Examples](Examples/sequence)
  + call -> handle_call/3 (wait for reply)
  + cast -> handle_cast/2 (don't wait for reply)

#### OTP Supervisors
- It manages one or more worker processes. It can also manage other supervisors.
- A supervisor is a process that uses the OTP supervisor behavior. It is given a list of processes to monitors,  tell what to do if a process dies, and how to prevent restart loops.
- to create a supervisor we use `--sup` flag option when create a project `mix new --sup sequence`.

  Nothing looks different if we compare with Sequence we created without `--sup` flag above. Except [__lib/sequence.ex__](Examples/sequence2/lib/sequence2.ex) file.

- List of sequence events of supervisor:
  + When our application start, the `start` function is called.
  + It creates a list of children worker by using `worker` function.
  + Set options
  + Call `Supervisor.start_link` with parameters are list of children worker, and options.
  + Now our supervisor process call the `start_link` function for each of its managed children.
- Manage Process State Across Restarts
  + `use Supervisor`
  + when `Supervisor` call `start_link`, it automatically invokes the `init` callback.
  + Then we will start workers, and pass its PID to the subsupervisor
  + `Supervisor.start_child` to add and run children workers. `Supervisor.start_child(sup, worker(Stack.Stash, [list]))`
-
#### OTP Application
- This application comes from Erlang world. It's not an application that we usually think of a program run or do something.
- In OTP world, an application is a bundle of code that come with descriptor. That descriptor tells the runtime what the dependencies that code has, what global names it registers, ... It's more like a dynamic link library.
- Example when we use __HTTPoision__ library, we actually installed was an independent application.

#### Hot code - Swapping
- we use [`@vsn`](./directives.md#vsn) directive to version our code.
- Then we implement `code_change/3` callback to migrate states.
- `:sys.suspend Sequence.Server`
- `:sys.change_code`
- `:sys.resume Sequence.Server`

#### Task
- Task is a function that run in background
```Elixir
  worker = Task.async(fn -> Fib.of(20) end)
  result = Task.await(worker)
```
- Tasks are implemented as OTP servers, which means we can add them to our application’s supervision tree.

#### [Agent](https://hexdocs.pm/elixir/Agent.html#content)
- Often in _Elixir_ there is a need to share or store state the must be accessed from other processes or the same process at different point of time.
- Elixir modules are basically buckets of functions—they cannot hold state. But processes can hold state. And Elixir comes with a library module called Agent that makes it easy to wrap a process containing state in a nice module interface
- The initial state is set by a function we pass in when we start the agent.
`{ :ok, count } = Agent.start(fn -> 0 end, name: Sum)`
- We can interrogate the state using Agent.get, passing it the agent descriptor and a function. The agent runs the function on its current state and returns the result.`Agent.get(Sum, &(&1))`
- `Agent.update` to change the state held by an agent. `Agent.update(Sum, &(&1+99))`


##### Tail recursive
```
  defmodule Spawn4 do
    def greet do
      receive do
        {sender, msg} ->
          sender, { :ok, "Hello, #{msg}" }
          greet
      end
    end
  end
```
- The recursive greet function might have worried you a little. Every time it
receives a message, it ends up calling itself. In many languages, that adds a
new frame to the stack. After a large number of messages, you might run out
of memory.
- This doesn’t happen in Elixir, as it implements tail-call optimization. If the
very last thing a function does is call itself, there’s no need to make the call.
Instead, the runtime can simply jump back to the start of the function. If the
recursive call has arguments, then these replace the original parameters as
the loop occurs.
- **But beware—the recursive call must be the very last thing executed. For
example, the following code is not tail recursive**
```Elixir
 def factorial(0), do: 1
 def factorial(n), do: n * factorial(n-1)
```
Although the recursive call is physically the last thing in the function, it is
not the last thing executed. The function has to multiply the value it returns
by n.
