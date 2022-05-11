#!/usr/bin/env bash
set -e

[ -z "$CONTRACT" ] && echo "Missing \$CONTRACT environment variable" && exit 1
[ -z "$OWNER" ] && echo "Missing \$OWNER environment variable" && exit 1

echo
echo 'Call create() function to add new property to the contract'
echo
echo "Sample Use"
echo "--------------------------------------------"
echo
echo near call $CONTRACT create '{"location":"istanbul","propertyName":"Taksim Blue Point", "bedRooms":3, "bathRooms":2, "sqm":155, "price":"25000000000000", "forSale":"true" }' --accountId $OWNER
echo
echo "--------------------------------------------"
echo
echo near call $CONTRACT create '{"location": "'"$1"'", "propertyName": "'"$2"'", "bedRooms": "'$3'", "bathRooms": "'$4'","sqm": "'$5'","price": "'"$6"'", "forSale": "'$7'"}' --accountId $OWNER
echo
echo
echo \$CONTRACT is $CONTRACT
echo \$OWNER is $OWNER
echo \$1 is [ $1 ] '(location)'
echo \$2 is [ $2 ] '(propertyName)' 
echo \$3 is [ $3 ] '(bedRooms)'
echo \$4 is [ $4 ] '(bathRooms)'
echo \$5 is [ $5 ] '(sqm)'
echo \$6 is [ $6 ] '(price)'
echo \$7 is [ $7 ] '(forSale)'
echo
echo "--------------------------------------------"
echo
echo

near call $CONTRACT create '{"location": "'"$1"'", "propertyName": "'"$2"'", "bedRooms": '$3', "bathRooms": '$4',"sqm": '$5',"price": "'"$6"'", "forSale": "'$7'"}' --accountId $OWNER