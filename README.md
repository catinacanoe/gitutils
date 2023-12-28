vim:ft=markdown

[https://github.com/catinacanoe/gitutils](https://github.com/catinacanoe/gitutils)
`gitutils`, a collection of nice wrapper scripts for git

# Installation

  Clone this repository: `git clone 'https://github.com/catinacanoe/gitutils.git'`.
  All of the functionality is stored inside `main.sh`, so all you need to do is set an alias (or anything equivalent) like this: `alias gitutils="/path/to/repo/gitutils/main.sh"` in your `.bashrc` or `.zshrc`.

## NixOS

   I personally use nixos, and there is a really nice way to install stuff like this. With `home.nix` use:
   `home.packages = [ (pkgs.writeShellScriptBin "gitutils" "/path/to/repo/gitutils/main.sh $@") ];`
   And with `configuration.nix`, use:
   `environment.systemPackages = [ (pkgs.writeShellScriptBin "gitutils" "/path/to/repo/gitutils/main.sh $@") ];`

# Usage

  Similar to `git`, you can just run `gitutils` with an argument which is basically just a subcommand that dictates what happens. These are all of the valid subcommands and their arguments:

## check
   
   (no arguments)
   Just checks if the current directory is part of a git repo, exits with an error if not.

## diff

   Arguments:
   1. (optional) either:
      - number of commits to go back and diff against
      - 'c' to diff against cached files
      - extra argument to git diff
   2. (optional) any extra arguments to pass to the `git diff` command
   3. (optional) same as above, etc ...

   If no arguments are passed, just calls `git diff`. If the first argument is a single digit number (regex `^[0-9]$`), calls `git diff HEAD~{n}` where `{n}` is said first argument (also passes the rest of the arguments to the command). If the first argument is `c`, calls `git diff --cached`, passing through the rest of the arguments. If the first argument is anything else, just calls `git diff` with that argument and any other ones as well.

## init

   Arguments:
   1. url of remote repository to initialize into

   Just makes sure this isn't already a git repo, and then calls all of github's suggested commands to initialize a repo. Creates a branch `main` and adds the remote `origin` with the passed url. Creates an init commit and pushes it.

## status

   (no arguments)

   Tries its best to figure out if this local repository is ahead of, behind, or up to date with the remote. Calls `git fetch` and then uses `git status` to figure this out. See the code `fn/status.sh` to see what all of the cases are, but long story short, any complicated cases (such as local and remote both having new/conflicting commits) are undefined behavior.

## sync

   (no arguments)

   Uses the `status` subcommand to check the current state of the repo. If ahead, calls `git add`, `commit` and `push`. If behind, calls `git pull`. Otherwise, does nothing. Any uncertainty from the `status` subcommand propagates into this subcommand as well.
