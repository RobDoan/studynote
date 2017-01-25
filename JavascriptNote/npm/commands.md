- [npm config file](#npm-config-file)
- [`npm-link`](#npm-link)
- npm-scope(#npm-scope)


## npm config file
- The four relevant files are:
  + per-project config file (/path/to/my/project/.npmrc)
  + per-user config file (~/.npmrc)
  + global config file ($PREFIX/etc/npmrc)
  + npm builtin config file (/path/to/npm/npmrc)
- _.npmrc_ files can contain sensitive credentials, they must be readable and writable only by your user account (i.e. must have a mode of 0600), otherwise they will be ignored by npm!

## `npm link`
- This command does 2 steps:
  + `npm link (in package dir)`

     this command will create a symlink from **prefix/package_name** to current folder

  + `npm link [<@scope>/]<pkg>[@<version>]`

     this command will create a symlink from local _node_modules_ folder to the global symlink.

  Example:
  ```bash
    cd ~/projects/node-redis    # go into the package directory
    npm link                    # creates global link
    cd ~/projects/node-bloggy   # go into some other package directory.
    npm link redis              # link-install the package
  ```

## npm scope
+ A scope follows the usual rule of package name(url-safe characters, no leading dots or underscores)
+ Scoped packages are installed to a sub-folder of the regular installation folder, e.g. if your other packages are installed in **node_modules/packagename**, scoped modules will be in **node_modules/@myorg/packagename**
