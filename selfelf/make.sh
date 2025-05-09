#!/bin/bash
for f in *.dmp ; do
    a=`basename $f .dmp`
    cut -d'#' -f1 <$f | xxd -p -r >$a
    chmod +x $a

    readelf -a $a
    echo ""
    echo "HEXDUMP"
    echo ""
    hexdump -C $a
    echo ""
    echo "RUNNING PROGRAM"
    echo ""
    ./$a
done