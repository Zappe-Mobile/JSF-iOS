//
//  PlaceCategories.h
//  JaipurShoppingFestival
//
//  Created by Romi on 21/06/14.
//  Copyright (c) 2014 Zappe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class PlacesListing;

@interface PlaceCategories : NSManagedObject

@property (nonatomic, retain) NSString * categoryDescription;
@property (nonatomic, retain) NSString * categoryId;
@property (nonatomic, retain) NSString * categoryName;
@property (nonatomic, retain) PlacesListing *placesCategory;

@end
