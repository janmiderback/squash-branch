# squash-branch

Bash script to squash a Git branch into one commit using git merge-base.

## Prerequisites

- Git is installed
- Bash environment is available 

On Windows, Git Bash provided with [Git for Windows](https://gitforwindows.org) is recommended.

## Usage

`squash-branch [base-branch] [squash-branch] "commit-message"`

- If `base-branch` is not provided, `master` is used.
- If `squash-branch` is not provided, the current branch is used.
- If only providing one branch argument, the `squash-branch` is set and `base-branch` defaults to `master`.
- The `squash-branch` is always checked out before squashing it.

### Examples

To squash the current branch (default) into one commit using `master` (default) as base branch:

```bash
squash-branch "My squashed commit"
```

To squash branch `my-branch` into one commit using `master` (default) as base branch:

```bash
squash-branch my-branch "My squashed commit"
```

To squash branch `my-branch` into one commit using `my-base-branch` as base branch:

```bash
squash-branch my-base-branch my-branch "My squashed commit"
```

To squash a branch using a multi-line commit message:

```bash
$ squash-branch "My squashed commit header
> and some info on the second line
> and some info on the third line"
```

## Install

Copy the [squash-branch.sh](./squash-branch.sh) script to your local machine, preferrably so that it is available
on your path.

## Bash on Windows

The script should work just fine in Git Bash provided with [Git for Windows](https://gitforwindows.org).
