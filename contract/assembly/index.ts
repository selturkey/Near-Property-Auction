// contract/assembly/index.ts


import { Property } from "./model";
import { Money } from "./utils";



// Call Create function to add new property.
// USE TERMINAL 
// near call $CONTRACT create '{"propertyName":"Sel Villa", "bedRooms":3, "bathRooms":2, "sqm":128, "forSale":"true", "price":"850000" }' --accountId sel.testnet

export function create(location:string, propertyName: string, bedRooms:u8, bathRooms:u8, sqm:u8, forSale:string, price:Money): Property {
  
  
  return Property.addProperty(location, propertyName, bedRooms, bathRooms, sqm, forSale, price);
}

// Call => getAll Function to view properties collection
// USE TERMINAL 
// near call $CONTRACT getAll --accountId sel.testnet --amount 3 --gas=75000000000000


export function getAll(): Property[] {
  
  return Property.getProperties();

}

// Call => getOffset Function to list part of properties collection
// USE TERMINAL 
// near call $CONTRACT getOffset '{"offset":0, "limit": 1}' --accountId sel.testnet --amount 3 --gas=75000000000000


export function getOffset(offset:u32, limit:u32): Property[] {
  
  return Property.getPropertiesOffset(offset,limit);

}

// Call => getForSale function to view property details by forSale.
// USE TERMINAL 
// near call $CONTRACT getForSale --accountId sel.testnet --amount 3 --gas=75000000000000


export function getForSale(): Property[] {
  
  return Property.getPropertiesForSale();

}

// Call => getById function to view property details by id.
// USE TERMINAL 
// near call $CONTRACT getById '{"id":1569959 }' --accountId sel.testnet


export function getById(id:u32): Property {
  
  return Property.getPropertyById(id);

}

// Call => updateById function to view property details by id. Price and sqm must be bigger than 0 and required.
// USE TERMINAL 
// near call $CONTRACT updateById '{"id":4049594502,"update":{"price":"54646465515454654", "location":"London","sqm":145}}' --accountId sel.testnet



export function updateById(id:u32, update:Property): Property {
  
  return Property.updatePropertyByid(id, update);

}

// Call => deleteById function to delete property collections only owner of property can delete. 
// USE TERMINAL 
// near call $CONTRACT deleteById '{"id":32323262032}' --accountId sel.testnet --amount 3 --gas=75000000000000

export function deleteById (id:u32): void {

  Property.deletePropertyById(id);
}


// Call => deleteOwnerAll function to clear all mapped property belongs to owner at collections 
// USE TERMINAL 
// near call $CONTRACT deleteAll  --accountId sel.testnet --amount 3 --gas=75000000000000

export function deleteOwnerAll (): void {

   Property.deleteOwnerAllProperties();
}


// Call => deleteAll function to clear all mapped property collections 
// USE TERMINAL 
// near call $CONTRACT deleteAll  --accountId sel.testnet --amount 3 --gas=75000000000000

export function deleteAll (): void {

  Property.deleteAllProperties();
}

// Call => deleteAll function to clear all mapped property collections 
// USE TERMINAL 
// near call $CONTRACT deleteAll  --accountId sel.testnet --amount 3 --gas=75000000000000

export function buy (id:u32, buyingPrice:Money) : Property {

  return Property.buyProperty(id, buyingPrice);

} 