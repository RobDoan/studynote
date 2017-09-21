- `git archive -o latest.zip HEAD`

  Create a Zip archive that contains the contents of the latest commit on the current branch.
  Output format is inferred by out put file extension

- `git push` with options:
  + `--prune` : remove remote branch if local branch doesn't exists.
  + `-f`: push force
  + `-u` | `--upstream`: For every branch that is up to date or successfully pushed, add upstream (tracking) reference

- `.keep` files are 0 byte files that are there to stop empty folders from being ignored by all sorts of processes.
