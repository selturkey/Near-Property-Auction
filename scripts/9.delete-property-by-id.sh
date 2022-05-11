#!/usr/bin/env bash
set -e

[ -z "$CONTRACT" ] && echo "Missing \$CONTRACT environment variable" && exit 1
[ -z "$OWNER" ] && echo "Missing \$OWNER environment variable" && exit 1

echo
echo 'Call deleteById() function to update property details on the contract'
echo
echo "Sample Use"
echo "--------------------------------------------"
echo
echo near call $CONTRACT deleteById '{"id":51513213215}' --accountId sel.testnet
echo
echo "--------------------------------------------"
echo
echo near call $CONTRACT deleteById '{"id":'$1'}' --accountId $OWNER
echo
echo
echo \$CONTRACT is $CONTRACT
echo \$OWNER is $OWNER
echo \$1 is [ $1 ] '(propertyID for delete)'
echo
echo "--------------------------------------------"
echo
echo

near call $CONTRACT deleteById '{"id":'$1'}' --accountId $OWNER

