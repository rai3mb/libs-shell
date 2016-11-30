#!/bin/bash
DIRETORIO=$1
[ ! -d "$DIRETORIO" ] && exit 1
[ "$2" ] && PADRAO="$2" || PADRAO="[0-9]+\."
find "$DIRETORIO"/. | egrep "$PADRAO" | while read FILE
do
	[ ! -f "$FILE" ] && continue
	NAME=$(basename "$FILE")
	echo "$NAME" | egrep '^[0-9]' && continue
	DIRETORIO=$(dirname -z "$FILE")
	[ ! -d "$DIRETORIO" ] && continue
	N=$(echo $NAME | egrep -o "$PADRAO" | egrep -o '[0-9]+' | egrep -o '[^0][0-9]+')
	NUM=$(printf %04d $N)
	NEW_FILE="$DIRETORIO/${NUM}_${NAME}"
	mv "$FILE" "$NEW_FILE"
done
