#!/bin/sh

# technique comes from https://www.atlassian.com/git/tutorials/dotfiles

# clone dots repository
git clone --bare https://github.com/will-rigney/.dots.git "$HOME/.dots"

# set the alias we need
alias dots='/usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME';

# checkout contents
if dots checkout = 0; then
  echo "checked out dots!";
  else
    echo "backing up existing files to .backup";
	# backup potentially conflicting files
	mkdir -p .backup && \
	dots checkout 2>&1 | grep -E "\s+\." | awk "{'print $1'}" | \
	xargs -I{} mv {} .backup/{}
	dots checkout
fi;

# don't show untracked files
dots config --local status.showUntrackedFiles no
