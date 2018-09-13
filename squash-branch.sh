#!/usr/bin/env bash
# Squash a branch to its merge base, and commit using provided commit message.
# Usage:
#   squash-branch [squash-branch] "commit-message"
#   
set -e

if [[ $# -lt 1 || $# -gt 3 ]]; then
    echo "Error - Wrong number of arguments"
    exit 1
fi

# TODO: Make it possible to provide base branch as a first argument
#       before squash-branch.
base_branch=master
squash_branch=
commit_message=

if [[ $# -eq 1 ]]; then
    squash_branch=$(git rev-parse --abbrev-ref HEAD)
    message=$1
fi

if [[ $# -eq 2 ]]; then
    squash_branch=$1
    message=$2
fi

echo "Squashing branch: $squash_branch"
echo "Base branch:      $base_branch"
echo "Checking out $squash_branch"
git checkout $squash_branch
git reset $(git merge-base $base_branch $squash_branch)
git add -A
git commit -m "$message"
