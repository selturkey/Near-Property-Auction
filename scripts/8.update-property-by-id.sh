#!/usr/bin/env bash
set -e

[ -z "$CONTRACT" ] && echo "Missing \$CONTRACT environment variable" && exit 1
[ -z "$OWNER" ] && echo "Missing \$OWNER environment variable" && exit 1

echo
echo 'Call updateById() function to update property details on the contract'
echo
echo "Sample Use SYNTAX JSON Data {'"price"':'"515153515"'\,'"location"':'"Istanbul"'\,'"sqm"':'32'} "
echo "--------------------------------------------"
echo
echo near call $CONTRACT updateById '{"id":4049594502,"update":{"price":"54646465515454654", "location":"London","sqm":145}}' --accountId $3
echo
echo "--------------------------------------------"
echo
echo near call $CONTRACT updateById '{"id":'$1',"update":'$2'}'--accountId $OWNER
echo
echo
echo \$CONTRACT is $CONTRACT
echo \$OWNER is $OWNER
echo \$1 is [ $1 ] '(propertyID)'
echo \$2 is [ $2 ] '(JSON update data)'
echo
echo "--------------------------------------------"
echo
echo
near call $CONTRACT updateById '{"id":'$1',"update":'$2'}' --accountId $OWNER

