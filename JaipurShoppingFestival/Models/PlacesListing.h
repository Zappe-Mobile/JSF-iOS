//
//  PlacesListing.h
//  JaipurShoppingFestival
//
//  Created by Roman Khan on 21/06/14.
//  Copyright (c) 2014 Zappe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class PlaceCategories;

@interface PlacesListing : NSManagedObject

@property (nonatomic, retain) NSString * placeAddress;
@property (nonatomic, retain) NSString * placeBanner;
@property (nonatomic, retain) NSString * placeDescription;
@property (nonatomic, retain) NSString * placeId;
@property (nonatomic, retain) NSString * placeName;
@property (nonatomic, retain) NSString * placePincode;
@property (nonatomic, retain) NSSet *placesCategories;
@end

@interface PlacesListing (CoreDataGeneratedAccessors)

- (void)addPlacesCategoriesObject:(PlaceCategories *)value;
- (void)removePlacesCategoriesObject:(PlaceCategories *)value;
- (void)addPlacesCategories:(NSSet *)values;
- (void)removePlacesCategories:(NSSet *)values;

@end
