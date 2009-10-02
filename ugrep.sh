#!/bin/sh

GREP_FOR=$1

# Set file separator to deal with spaces
O=$IFS
IFS=$'\n'

for file in `find . -type f | xargs -I {} file {} | grep UTF-16 | cut -f1 -d\:`
	do iconv -f UTF-16 -t UTF-8 "${file}" | grep -iH --label=${file} ${GREP_FOR}
done

# Reset file separator
IFS=$O