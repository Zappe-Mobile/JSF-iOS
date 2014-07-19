//
//  ShopsListing.h
//  JaipurShoppingFestival
//
//  Created by Roman Khan on 21/06/14.
//  Copyright (c) 2014 Zappe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ShopCategories;

@interface ShopsListing : NSManagedObject

@property (nonatomic, retain) NSString * placeId;
@property (nonatomic, retain) NSString * shopAddress;
@property (nonatomic, retain) NSString * shopId;
@property (nonatomic, retain) NSString * shopImage;
@property (nonatomic, retain) NSString * shopName;
@property (nonatomic, retain) NSString * shopOwnerName;
@property (nonatomic, retain) NSString * shopPincode;
@property (nonatomic, retain) NSSet *shopsCategories;
@end

@interface ShopsListing (CoreDataGeneratedAccessors)

- (void)addShopsCategoriesObject:(ShopCategories *)value;
- (void)removeShopsCategoriesObject:(ShopCategories *)value;
- (void)addShopsCategories:(NSSet *)values;
- (void)removeShopsCategories:(NSSet *)values;

@end
