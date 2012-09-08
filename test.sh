#!/bin/bash

set -e

[ -d envs ] || mkdir envs
for version in 2 3; do
    [ -d envs/$version ] || virtualenv -p python$version envs/$version
    . envs/$version/bin/activate
    pip install -r requirements.txt --upgrade --use-mirrors
    nosetests
done

