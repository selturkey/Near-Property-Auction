#!/usr/bin/env bash
set -e

[ -z "$CONTRACT" ] && echo "Missing \$CONTRACT environment variable" && exit 1
[ -z "$OWNER" ] && echo "Missing \$OWNER environment variable" && exit 1

echo
echo 'Call buy() function to buying property and transfer amount of price buying price should be higher or equal of sell price of property details on the contract'
echo
echo "Sample Use"
echo "--------------------------------------------"
echo
echo near call $CONTRACT buy '{"id":4049594502,"buyingPrice":"64646465515454654" }' --accountId bereket.testnet
echo
echo "--------------------------------------------"
echo
echo near call $CONTRACT buy '{"id":'$1',"buyingPrice":"'$2'" }' --accountId $3
echo
echo
echo \$CONTRACT is $CONTRACT
echo \$OWNER is $OWNER
echo \$1 is [ $1 ] '(property ID)'
echo \$2 is [ $2 ] '(buying price)'
echo \$3 is [ $3 ] '(property BUYER)'
echo
echo "--------------------------------------------"
echo
echo

near call $CONTRACT buy '{"id":'$1',"buyingPrice":"'$2'" }' --accountId $3