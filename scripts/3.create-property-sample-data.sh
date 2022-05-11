#!/usr/bin/env bash
set -e

[ -z "$CONTRACT" ] && echo "Missing \$CONTRACT environment variable" && exit 1
[ -z "$OWNER" ] && echo "Missing \$OWNER environment variable" && exit 1

echo
echo 'Call create() function to add new property to the contract'
echo
echo "Sample Use"
echo "--------------------------------------------"
echo near call $CONTRACT create '{"location":"istanbul","propertyName":"Taksim Blue Point", "bedRooms":3, "bathRooms":2, "sqm":155, "price":"25000000000000", "forSale":"true" }' --accountId sel.testnet
echo
echo
echo \$CONTRACT is $CONTRACT
echo \$OWNER is $OWNER
echo \$1 is [ 'istanbul' ] '(location)'
echo \$2 is [ 'Taksim Blue Point'] '(propertyName)' 
echo \$3 is [ 3 ] '(bedRooms)'
echo \$4 is [ 2 ] '(bathRooms)'
echo \$5 is [ 155 ] '(sqm)'
echo \$6 is [ '25000000000000' ] '(price)'
echo \$7 is [ 'true' ] '(forSale)'
echo
echo "--------------------------------------------"
echo
echo

near call $CONTRACT create '{"location":"istanbul","propertyName":"Taksim Blue Point", "bedRooms":3, "bathRooms":2, "sqm":155, "price":"25000000000000", "forSale":"true" }' --accountId $OWNER

echo

