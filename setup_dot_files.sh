#!/bin/bash

cd $HOME
git init
git remote add origin git@github.com:swfc/dotfiles.git
git fetch
git checkout -f master
git submodule update --init --recursive

