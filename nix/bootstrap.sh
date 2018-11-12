#!/bin/bash
set -eu

# Set up soft links from files to their destination (in home directory)

# Note: /bin/bash is required for ~/.* expansion in loop below

# Can't use something like 'readlink -e $0' because that doesn't work everywhere
# And HP doesn't define $PWD in a sudo environment, so we define our own
case $0 in
    /*|~*)
        SCRIPT_INDIRECT="$(dirname "$0")"
        ;;
    *)
        PWD="`pwd`"
        SCRIPT_INDIRECT="$(dirname "$PWD/$0")"
        ;;
esac

BASEDIR="$(cd "$SCRIPT_INDIRECT" ; pwd -P)"

for i in "$BASEDIR"/*; do
    [ ! -d "$i" ] && continue

    for j in "$i"/*; do
        FILEDIR="$(dirname "$j")"
        FILE="$(basename "$j")"
        BASEFILE="$HOME/.$FILE"
 
        if [ -h "$BASEFILE" ]; then
           echo "Updating link : $BASEFILE"
           rm "$BASEFILE"
        elif [ -d "$BASEFILE" ]; then
           echo "Replacing directory: $BASEFILE (saving old version)"
           SAVE_NAME="$BASEFILE.dotfiles.sav"
           if [ -e "$SAVE_NAME" ]; then
              SAVE_NAME="$SAVE_NAME.$(date +'%s')"
           fi
           mv "$BASEFILE" "$SAVE_NAME"
        elif [ -e "$BASEFILE" ]; then
            # if it exists but isn't a directory or a link,
            # assume it is a file. Doesn't seem worth it
            # to try to handle other things (e.g. unix sockets)
            # specially.
            echo "Replacing file: $BASEFILE"
            rm "$BASEFILE"
        else
            echo "Creating link: $BASEFILE"
        fi

        ln -s "$j" "$BASEFILE"
    done
done

# Make a pass deleting stale links, if any
for i in ~/.*; do
    [ ! -h "$i" ] && continue

    # We have a link: Is it stale? If so, delete it ...
    # Since we can't use readlink, assume that if the link is
    # not pointing to a file or a directory that it is stale.
    if [ ! -f "$i" -a ! -d "$i" ]; then
        echo "Deleting stale link: $i"
        rm "$i"
    fi
done
