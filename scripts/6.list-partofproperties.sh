#!/usr/bin/env bash
set -e

[ -z "$CONTRACT" ] && echo "Missing \$CONTRACT environment variable" && exit 1
[ -z "$OWNER" ] && echo "Missing \$OWNER environment variable" && exit 1


echo --------------------------------------------------------------------------
echo
echo 'call getOffset() function to view part of properties stored on the contract'
echo
echo near call $CONTRACT getOffset '{"offset":'$1', "limit": '$2'}' --accountId $OWNER --gas 300000000000000 --amount 3
echo
echo \$CONTRACT is $CONTRACT
echo offset $1 and limit $2 
echo --------------------------------------------------------------------------

near call $CONTRACT getOffset '{"offset":'$1', "limit": '$2'}' --accountId $OWNER --gas 300000000000000 --amount 3