- To clone angular-cli and use it on local instead of install it from remote.
  + clone angular-cli to local
  + go to folder just clone run `npm link`. This will create a symlink to node-modules global.
  + Then go to project want to use angular-cli local, run `npm link angluar-cli`
- `ng help <command>` to see help and options of commands.
- `ng new ProjectName -dir project_folder_name --style=sass`: create new project and set directory name: `project_folder_name`, default style: `scss`
- `ng set defaults.styleExt scss` : set the default style on an existing project
