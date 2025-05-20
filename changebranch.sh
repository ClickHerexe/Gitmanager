#!/bin/bash
read -p "Branch: " branch

if git branch --list "$branch" >/dev/null 2>&1; then
    git checkout "$branch"
else
    git checkout -b "$branch"
fi
