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

```bash
# Squash current branch (default) using 'master' (default) as base branch
squash-branch "My squashed commit"

# Squash branch 'my-branch' using 'master' (default) as base branch
squash-branch my-branch "My squashed commit"   

# Squash branch 'my-branch' using 'my-base-branch' as base branch
squash-branch my-base-branch my-branch "My squashed commit"

# Squash a branch using a multi-line commit message
squash-branch "My squashed commit header
> and some info on the second line
> and some info on the third line"
```

## Install

Copy the [squash-branch.sh](./squash-branch.sh) script to your local machine, preferrably so that it is available
on your path.
