- **Procfile**: It should be named Procfile exactly, and not anything else. If we want to use another name,
we need to run with `-f` option. Example: `foreman start alpha -f Procfile.express`. However, if we deploy to
heroku, heroku will not know this file.
- A Procfile contains a number of process type declarations, each on a new line.
- Declare process types: `<process_type>: <command>`
  + <process type> – an alphanumeric string, is a name for your command, such as web, worker, urgentworker, clock, etc
  + <command> – a command line to launch the process, such as `rake jobs:work`.
- **.env** file:  if this file exists in current directory, default environment will be read from it.
This file should contain key/value pairs, separated by _=_
- **.foreman** file: if this file exists in the current directory, default options will be read from it. This file should be in YAML format with the long option name as keys.
