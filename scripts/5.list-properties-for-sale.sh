#!/usr/bin/env bash
set -e

[ -z "$CONTRACT" ] && echo "Missing \$CONTRACT environment variable" && exit 1
[ -z "$OWNER" ] && echo "Missing \$OWNER environment variable" && exit 1


echo --------------------------------------------------------------------------
echo
echo 'call getForSale() function to view for sale properties stored on the contract'
echo
echo near call $CONTRACT getForSale --accountId $OWNER --gas 300000000000000 --amount 3
echo
echo \$CONTRACT is $CONTRACT
echo
echo --------------------------------------------------------------------------

near call $CONTRACT getForSale --accountId $OWNER --gas 300000000000000 --amount 3