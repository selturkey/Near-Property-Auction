#!/usr/bin/env bash

[ -z "$CONTRACT" ] && echo "Missing \$CONTRACT environment variable"
[ -z "$OWNER" ] && echo "Missing \$OWNER environment variable"


echo ------------------------------------------------------------------------------
echo
echo
echo
echo "deleting $CONTRACT and setting $OWNER as beneficiary"
echo
echo
echo
echo ------------------------------------------------------------------------------
echo

near delete $CONTRACT $OWNER

echo ------------------------------------------------------------------------------
echo
echo "cleaning up the ./neardev folder"
echo
echo ------------------------------------------------------------------------------
echo

rm -rf ./neardev

# exit on first error after this point to avoid redeploying with successful build
set -e

echo ------------------------------------------------------------------------------
echo
echo
echo
echo "rebuilding the contract (yarn build:contract)"
echo
echo
echo
echo ------------------------------------------------------------------------------

yarn build:contract

echo ------------------------------------------------------------------------------
echo
echo "redeploying the contract to Near Testnet yarn dev:deploy:contract"
echo
echo ------------------------------------------------------------------------------
echo

yarn dev:deploy:contract

echo ------------------------------------------------------------------------------
echo
echo "run the following commands to define \$CONTRACT variable and \$OWNER variable to use for other bash scripts"
echo
echo 'export CONTRACT=<dev-123-456>'
echo 'export OWNER=<your own account>'
echo
echo ------------------------------------------------------------------------------

exit 0