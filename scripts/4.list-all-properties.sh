#!/usr/bin/env bash
set -e

[ -z "$CONTRACT" ] && echo "Missing \$CONTRACT environment variable" && exit 1
[ -z "$OWNER" ] && echo "Missing \$OWNER environment variable" && exit 1

echo --------------------------------------------------------------------------
echo
echo 'call getAll() function to view all stored properties on the contract'
echo
echo near call $CONTRACT getAll --accountId $OWNER --gas 300000000000000 --amount 3
echo
echo \$CONTRACT is $CONTRACT
echo
echo --------------------------------------------------------------------------

near call $CONTRACT getAll --accountId $OWNER --gas 300000000000000 --amount 3