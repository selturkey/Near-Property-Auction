Demo-Near-Property-Listing
==================

This smart contract was initialized with [create-near-app] template code with assemblyscript.


Quick Start
===========

To run this project locally:

1. Prerequisites: Make sure you've installed [Node.js] ≥ 12
   * `npm`
   * Current version of `Node.js`
   * `yarn` to install:  `npm install --global yarn` (or just npm i -g yarn)
   * Install near-cli on terminal :  `npm install --global near-cli`
   * `near --version` check version and installation done

1. Clone this repo:
```
      git clone https://github.com/selturkey/Near-Property-Listing-Demo.git
```
2. Run command on terminal:
```
      yarn install
```
3. Build Smart Contract:
```
      yarn build:contract
```
3. Deploy the Contract to the live Near Testnet:
```
      yarn dev:deploy:contract
```
Now you deployed the smart contract to the live Near Testnet.


Exploring The Stracture
==================

1. The "backend" code lives in the `/contract` folder.

   ### Folder File Stracture
   
```
contract
│   README.md
│   package.json
|   compile.js
|   ...
│
└───assembly 
│   │   index.ts
│   │   model.ts
|   |   utils.ts
|   |   ...
│   │
│   └───_tests_
│       │   main.spec.ts
│       │   as-pect.d.ts
│       │   ...
│   
└───build
    │   
    │___release
        |
        |   property_listing.wasm

```



Exploring The Code and How to Use
======

After you deploy the contract near create folder `neardev` and under the folder `dev-account` file where we can find the contrat name (contract ID) look like dev-1650691637401-19400424941921

1. Define CONTRACT Variable from terminal bash Linux :
```
      export CONTRACT=dev-1650691637401-19400424941921 
```
2. Define CONTRACT on terminal powershell Windows:
```
      $CONTRACT='dev-1650691637401-19400424941921'
```
3. Login your test wallet account using NEAR-CLI from terminal:
```
      near login
```
3. Call contract methods with your --accountId using NEAR-CLI from terminal:
```
      near call $CONTRACT <FUNCTION> '{Args}' --accountId <YOUR_ACCOUNT_ID>.testnet
```
4. View contract methods with your --accountId using NEAR-CLI from terminal:
```
      near view $CONTRACT <FUNCTION> --accountId <YOUR_ACCOUNT_ID>.testnet
```

Step 1: index.ts Functions CONTRACT Methods
-------------------------------------

| Functions        | ToDo |          
| ------------- |:-------------| 
| create()    | Create add new property to collections |
| getAll() | List All strored properties|  
| getOffset()    |List Partial of stored properties      |   
| getForSale()   |List Only properties For Sale     | 
| getById()      |List property By Id      | 
| updateById()   |Update property details By Id      | 
| deleteById()   |Delete property By Id from collections  |
| deleteOwnerAll()   |Delete account owner all belonging properties from collections  |
| deleteAll()   |Delete All properties from collections  |
| buy()   |Buying Property For Sale and Transfer the amount of property for owner.  | 




Step 2: How to Use Functions
------------------------------------------

1. Call create() function to add new property to collections :
```
near call $CONTRACT create '{"location":"Istanbul","propertyName":"Sel Villa", "bedRooms":3, "bathRooms":2, "sqm":128, "forSale":"true", "price":"21733580199719106607635056" }' --accountId sel.testnet
![Create Function Terminal](/screenshot/CreateFunction.png)
```
2. Define CONTRACT on terminal powershell Windows:
```
      $CONTRACT='dev-1650691637401-19400424941921'
```
3. Login your test wallet account using NEAR-CLI from terminal:
```
      near login
```
3. Call contract methods with your --accountId using NEAR-CLI from terminal:
```
      near call $CONTRACT getAll  --accountId <YOUR_ACCOUNT_ID>.testnet
```
4. View contract methods with your --accountId using NEAR-CLI from terminal:
```
      near view $CONTRACT getAll --accountId <YOUR_ACCOUNT_ID>.testnet
```


Step 2: set contract name in code
---------------------------------

Modify the line in `src/config.js` that sets the account name of the contract. Set it to the account id you used above.

    const CONTRACT_NAME = process.env.CONTRACT_NAME || 'Near-Property-Auction.YOUR-NAME.testnet'


Step 3: deploy!
---------------

One command:

    yarn deploy

As you can see in `package.json`, this does two things:

1. builds & deploys smart contract to NEAR TestNet
2. builds & deploys frontend code to GitHub using [gh-pages]. This will only work if the project already has a repository set up on GitHub. Feel free to modify the `deploy` script in `package.json` to deploy elsewhere.


Troubleshooting
===============

On Windows, if you're seeing an error containing `EPERM` it may be related to spaces in your path. Please see [this issue](https://github.com/zkat/npx/issues/209) for more details.


  [React]: https://reactjs.org/
  [create-near-app]: https://github.com/near/create-near-app
  [Node.js]: https://nodejs.org/en/download/package-manager/
  [jest]: https://jestjs.io/
  [NEAR accounts]: https://docs.near.org/docs/concepts/account
  [NEAR Wallet]: https://wallet.testnet.near.org/
  [near-cli]: https://github.com/near/near-cli
  [gh-pages]: https://github.com/tschaub/gh-pages
