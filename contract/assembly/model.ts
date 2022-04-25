// contract/assembly/model.ts


import { PersistentUnorderedMap, math, u128, context, PersistentSet, RNG, storage, logging, ContractPromiseBatch} from "near-sdk-as";
import { AccountId, Balance, Money } from "./utils";



// random numbers
const random =new RNG<u32>(100,1000);

// Mapped Properties
export const properties = new PersistentUnorderedMap<u32, Property>("properties");

export const propertyIds = new PersistentSet<u32>("propertyIds");

// Use storage to keep accountId
storage.set<AccountId>("accountId", context.sender);


@nearBindgen
export class Property {
  id: u32;
  location:string;
  propertyName:string;
  bedRooms: u8;
  bathRooms: u8;
  sqm: u32;
  forSale:string;
  price: Money;
  owner: string;  
  

  constructor(location:string, propertyName: string, bedRooms:u8, bathRooms:u8, sqm:u8, forSale:string, price:Money ) {   
    this.id = math.hash32<string>(((random.next()).toString())+propertyName);
    this.location=location;
    this.propertyName=propertyName;
    this.bedRooms = bedRooms;
    this.bathRooms= bathRooms;
    this.sqm=sqm;
    this.forSale = forSale;
    this.price=price;
    this.owner= context.sender;

  }


  // ADD Property
  
  static addProperty(location:string, propertyName: string, bedRooms:u8, bathRooms:u8, sqm:u8, forSale:string, price:Money): Property {
    
    //check price and sqm should be bigger than 0
    assert(price>u128.Zero && sqm >0, 'Property price and sqm must be bigger than zero.');
    
    
    
    // create a new Property
    const property = new Property(location, propertyName, bedRooms, bathRooms, sqm, forSale, price);

    // INSERT property.
    propertyIds.add(property.id);
    properties.set(property.id, property);
    
    //log for web
    
    logging.log(propertyName + `Create Success. Created Owner is ${storage.getSome<AccountId>("accountId")}`);
    return property;
  }

  // VIEW All Properties

  static getProperties(): Property[] {
    let offset= 0;
    let limit=properties.length;
  
    return properties.values(offset, offset + limit);
    
  
    }

  // Get Limited Properties for paging 

  static getPropertiesOffset(offset:u32, limit:u32): Property[] {
         
      return properties.values(offset, offset + limit);
      
    
  }

  // VIEW Property by ID

  static getPropertyById(id:u32): Property{
  
  return properties.getSome(id);
  }

  //Get Properties For Sale Only
  static getPropertiesForSale(): Property[]{

    const listForSale: Property[]=new Array<Property>();
    const Ids: u32[] = propertyIds.values(); 

    for(let i=0; i<Ids.length; i++){
      if(this.getPropertyById(Ids[i]).forSale=='true') {
        
       listForSale.push(this.getPropertyById(Ids[i]));

      }


    }

    return listForSale;
  }



  static updatePropertyByid(id:u32, update:Property):Property{
    
    const property= this.getPropertyById(id);
   
    
    // Assert Control property owner to update
    assert(property.owner==context.sender,`You are not owner of this property.You can not update property details.Created Owner is not ${storage.getSome<AccountId>("accountId")}`);
    
    
    property.location=update.location ? update.location : property.location;
    property.bedRooms=update.bedRooms ? update.bedRooms : property.bedRooms;
    property.bathRooms=update.bathRooms ? update.bathRooms : property.bathRooms;
    property.sqm=update.sqm > 0 ? update.sqm : property.sqm;
    property.price=update.price && update.price > u128.Zero ? update.price : property.price;
    property.forSale=update.forSale ? update.forSale : property.forSale;
    
    properties.set(id,property);

    return property;
  }



// Delete by Property ID
static deletePropertyById(id:u32):void{

const property= this.getPropertyById(id);

// check owner of property
assert(property.owner==context.sender,'You are not owner of this property.You can not delete it.');

properties.delete(id);
propertyIds.delete(id);

}


  // Delete Owners belonged All Properties
static deleteOwnerAllProperties(): void {

  const Ids: u32[] = propertyIds.values(); 
  //delete only owned properties from collections

  for(let i=0; i<Ids.length; i++){
    if(this.getPropertyById(Ids[i]).owner==context.sender) {
      
     
      properties.delete(Ids[i]);
      propertyIds.delete(Ids[i]);

    }


  }

  }
  
// Delete All Properties in the collections 
  
static deleteAllProperties():void{

  properties.clear();
  propertyIds.clear();
  
  }

 static buyProperty(id:u32, buyingPrice:Money) : Property {

    const buyer=context.sender;
    const buyerAccountBalance: Balance= context.accountBalance;
    const property=this.getPropertyById(id);
    const propertyOwner= property.owner;

    // check account balance enough
    
    assert(buyerAccountBalance >= property.price,`Your account balance is not enought to buy this property. Check your account and add more money to ${storage.getSome<AccountId>("accountId")}`);
    
    // check buying price must be same sell price or higher
    
    assert(buyingPrice >= property.price, 'You should offer equal to sale price or more to buy this property');

    assert(buyer != propertyOwner, 'You are already owner of property you can not buy your property higher price');
    
    assert(property.forSale == 'true','Property is not for sale');
    
    // transfer money to seller and property to buyer

    ContractPromiseBatch.create(propertyOwner).transfer(buyingPrice);

    property.owner=buyer;
    property.forSale='false';
    property.price=buyingPrice;
    properties.set(id,property);

    return property;

  

}


}