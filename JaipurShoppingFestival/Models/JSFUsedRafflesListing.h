//
//  JSFUsedRafflesListing.h
//  JaipurShoppingFestival
//
//  Created by Romi on 21/06/14.
//  Copyright (c) 2014 Zappe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface JSFUsedRafflesListing : NSManagedObject

@property (nonatomic, retain) NSString * raffleId;
@property (nonatomic, retain) NSString * raffleUserEnteredPlaceId;
@property (nonatomic, retain) NSString * raffleUserEnteredShopId;
@property (nonatomic, retain) NSString * raffleUserPhone;
@property (nonatomic, retain) NSString * raffleUserShoppingAmount;
@property (nonatomic, retain) NSString * raffleUserUniqueNumber;

@end
