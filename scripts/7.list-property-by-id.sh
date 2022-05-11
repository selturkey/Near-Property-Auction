#!/usr/bin/env bash
set -e

[ -z "$CONTRACT" ] && echo "Missing \$CONTRACT environment variable" && exit 1
[ -z "$OWNER" ] && echo "Missing \$OWNER environment variable" && exit 1


echo --------------------------------------------------------------------------
echo
echo 'call getById() function to view property by id on the contract'
echo
echo near call $CONTRACT getById '{"id":'$1'}' --accountId $OWNER
echo
echo \$CONTRACT is $CONTRACT
echo
echo Property ID is $1
echo --------------------------------------------------------------------------
echo
near call $CONTRACT getById '{"id":'$1'}' --accountId $OWNER

