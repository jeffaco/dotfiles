# Dotfiles

## Overview

This repo is a skeleton/template repo for tracking dotfiles.  It
contains a utility [bootstrap]
(https://github.com/jeffaco/msft-dotfiles/blob/master/bootstrap.sh) to
help with managing and updating your dotfiles.

## Using this repo

First, fork this repo into a directory of your choice.

Then, add your dotfiles:

    $ git clone git@github.com:jeffaco/msft-dotfiles.git dotfiles
    $ cd .dotfiles
    $  # edit files
    $  # edit files
    $  # When satisfied with your files:
    $ dotfiles/bootstrap.sh
    $ git push origin master

Finally, to install your dotfiles onto a new system:

    $ cd $HOME
    $ git clone git@github.com:jeffaco/msft-dotfiles.git dotfiles
    $ dotfiles/bootstrap.sh

## Compatibility

The bootstrap utility has been tested to work properly on Linux, IBM
AIX, HP-UX, and Sun Solaris.
