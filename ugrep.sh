#!/bin/sh

GREP_FOR=$1

for f in `find . -type f | xargs -I {} file {} | grep UTF-16 | cut -f1 -d\:`
	do iconv -f UTF-16 -t UTF-8 $f | grep -iH --label=$f ${GREP_FOR}
done
