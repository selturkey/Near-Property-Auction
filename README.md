Demo-Near-Property-Listing
==================

This smart contract was initialized with [create-near-app] template code with assemblyscript.

This demo property listing project solution for the real estate market where the ownner, buyer and broker deal buy and sell properties in trust, fast and clear for owners and buyers or brokers. Bring more trust and more efficient easy way to transfer assets. Todays most of sales has a problem such as who is real owner of property and what is the real price for sale and who is the real buyer not so transparant so many sales are cancelation because of this issues of losing trust and losing time or paying more. This decentralized app will help us to be transparant property buying and selling sytem with blockchain technology at Near Blockchain.Future improvments willbe front end of dApp such as web and mobile apps and governer regulations and DAO to implement.


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

   ### Folder and File Stracture
   
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
```
   ![CreateFunction](/screenshot/create.png)

2. Call getAll() function to `list all` properties stored at collections:
```
   near call $CONTRACT getAll --accountId sel.testnet --amount 3 --gas=75000000000000
```
   ![getAllFunction](/screenshot/getAll.png)

3. Call getOffset() use for `partial list` of properties stored at collections:
```
   near call $CONTRACT getOffset '{"offset":0, "limit": 1}' --accountId sel.testnet
```

4. Call getForSale() use for `list only` properties available `for sale` stored at collections:
```
   near call $CONTRACT getForSale --accountId sel.testnet --amount 3 --gas=75000000000000
```
5. Call getById() get property details by Id key stored at collections:
```
   near call $CONTRACT getById '{"id":4049594502 }' --accountId sel.testnet
```
   ![getByIdFunction](/screenshot/getById.png)

6. Call updateById() use for `update of property data` given by id stored at collections:
```
   near call $CONTRACT updateById '{"id":4049594502,"update":{"price":"54646465515454654", "location":"London","sqm":145}}' --accountId sel.testnet
```
   ![updateById](/screenshot/updateById.png)

7. Call deleteById() `delete property` given by id stored at collections:
```
   near call $CONTRACT deleteById '{"id":4049594502}' --accountId sel.testnet --amount 3 --gas=75000000000000
```

8. Call deleteOwnerAll() use for delete account owner properties stored at collections:
```
  near call $CONTRACT deleteAll  --accountId sel.testnet --amount 3 --gas=75000000000000
```

9. Call deleteAll() use for delete all properties stored at collections:
```
   near call $CONTRACT deleteAll  --accountId sel.testnet --amount 3 --gas=75000000000000
```

10. Call buy() use for `buying property` given by id from owner and transfer amount and ownership between owner and new buyer and update property details to store at collections before buying property another account you have to `create buyer account` and `login` that account too for call buy() function in this Example I created bereket.testnet account and login to buy property:

```
   near call $CONTRACT buy '{"id":4049594502,"buyingPrice":"64646465515454654" }' --accountId bereket.testnet
```
   ![buy](/screenshot/buy.png)


Step 2: models.ts Functions and Property Class
---------------------------------
### Property Class Paramater Type
<br>

| Parameter        | Type           | 
| ------------- |:-------------:|
| id    | u32 | 
| location      | string      |  
| propertyName | string     |   
| bedRooms | u8 |
| bathRooms | u8 |
| sqm | u32 |
| forSale | string |
| price | `Money` |
| owner | string |
<br>

### Property Class Functions

<br>

| Functions        | ToDo |          
| ------------- |:-------------| 
| addProperty()    | Create add new property to collections sqm and price can not be zero.|
| getProperties() | Get All strored properties|  
| getPropertiesOffset()    |Get Partial of stored properties      |   
| getPropertiesForSale()  |Get Only properties For Sale     | 
| getPropertyById()      | Get property By Id      | 
| updatePropertyByid()   |Update property details By Id      | 
| deletePropertyById()   |Delete property By Id from collections check owner of property before delete  |
| deleteOwnerAllProperties() |Delete account owner all belonging properties from collections|
| deleteAllProperties()   |Delete All properties from collections  |
| buyProperty()   |Buying Property For Sale and Transfer the amount of property for owner.  | 




[Thank you For Patika](https://www.patika.dev/tr) Near Boot Camp




Troubleshooting
===============

More information pleasae visit as below:

  [create-near-app](https://github.com/near/create-near-app)<br>

  [Node.js](https://nodejs.org/en/download/package-manager/)<br>

  [NEAR accounts](https://docs.near.org/docs/concepts/account)<br>

  [NEAR Wallet](https://wallet.testnet.near.org/)<br>
  
  [near-cli](https://github.com/near/near-cli)<br>
  