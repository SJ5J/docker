#!/bin/bash
# -*- coding: utf-8 -*-

if [ "$NAME" == "" ]; then
    NAME=$(date +%s)
fi

FULL_NAME=${FULL_NAME-$REPO/$NAME}

echo "Building '$NAME' using '$BUILDER' and '$EXEC'"

if [ "$BUILDER" == "Dockerfile" ]; then
    docker build --no-cache -t $FULL_NAME .$EXEC
else
    NAME=$NAME FULL_NAME=$FULL_NAME BUILDER=$BUILDER /repo/$EXEC
fi

docker push $FULL_NAME