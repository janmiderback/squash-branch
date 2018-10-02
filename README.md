# squash-branch

Bash script to squash the current Git branch into one commit using git merge-base.

## Prerequisites

- Git is installed
- Bash environment is available

On Windows, Git Bash provided with [Git for Windows](https://gitforwindows.org) is recommended.

## Usage

`squash-branch [base-branch] "commit-message"`

If `base-branch` is not provided, `master` is used.

### Examples

To squash the current branch into one commit using `master` (default) as base branch:

```bash
squash-branch "My squashed commit"
```

To squash the current branch into one commit using `my-base-branch` as base branch:

```bash
squash-branch my-base-branch "My squashed commit"
```

To squash a the current branch using a multi-line commit message:

```bash
$ squash-branch "My squashed commit header
> and some info on the second line
> and some info on the third line"
```

## Install

Copy the [squash-branch.sh](./squash-branch.sh) script to your local machine, preferrably so that it is available
on your path.
