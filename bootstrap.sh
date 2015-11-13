#! /bin/sh

# Set up soft links from files to their destination (in home directory)

SCRIPTNAME=`readlink -e $0`
BASEDIR=`dirname $SCRIPTNAME`

for i in $BASEDIR/*; do
    [ ! -d $i ] && continue

    for j in $i/*; do
        FILEDIR=`dirname $j`
        FILE=`basename $j`
        BASEFILE=$HOME/.$FILE
 
        if [ -f $BASEFILE -o -h $BASEFILE ]; then
            echo "Replacing file $BASEFILE"
            rm $BASEFILE
        else
            echo "Creating link $BASEFILE"
        fi

        ln -s $j $BASEFILE
    done
done
