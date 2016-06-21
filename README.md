# Dotfiles

## Overview

This repo is a skeleton/template repo for tracking dotfiles.  It
contains a utility [bootstrap]
(https://github.com/jeffaco/dotfiles/blob/master/nix/bootstrap.sh) to
help with managing and updating your dotfiles.

## This repo has several directories to support multiple platforms

Directory | Purpose
--------- | -------
nix | Linux/UNIX platforms (or compatible)
windows | Windows platform

## Using this repo

First, fork this repo into a directory of your choice.

Then, add your dotfiles:

    $ git clone git@github.com:jeffaco/dotfiles.git
    $ cd dotfiles
    $  # edit files
    $  # edit files
    $  # When satisfied with your files:
    $ nix/bootstrap.sh
    $ git push origin master

Finally, to install your dotfiles onto a new system:

    $ cd $HOME
    $ git clone git@github.com:jeffaco/dotfiles.git
    $ dotfiles/nix/bootstrap.sh

## Compatibility

The bootstrap utility has been tested to work properly on Linux, IBM
AIX, HP-UX, Sun Solaris, and Mac OS/X.
