//
//  JSFRafflesListing.h
//  JaipurShoppingFestival
//
//  Created by Roman Khan on 21/06/14.
//  Copyright (c) 2014 Zappe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface JSFRafflesListing : NSManagedObject

@property (nonatomic, retain) NSString * raffleCategoryId;
@property (nonatomic, retain) NSString * raffleId;
@property (nonatomic, retain) NSString * raffleNumber;
@property (nonatomic, retain) NSString * raffleStatus;
@property (nonatomic, retain) NSString * raffleUserEnteredPlaceId;
@property (nonatomic, retain) NSString * raffleUserEnteredShopId;
@property (nonatomic, retain) NSString * raffleUserNumber;
@property (nonatomic, retain) NSString * raffleUserShoppingAmount;
@property (nonatomic, retain) NSString * shopId;

@end
