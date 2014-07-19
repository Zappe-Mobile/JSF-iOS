//
//  EventPartners.h
//  JaipurShoppingFestival
//
//  Created by Roman Khan on 03/07/14.
//  Copyright (c) 2014 Zappe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Events;

@interface EventPartners : NSManagedObject

@property (nonatomic, retain) NSString * partnerId;
@property (nonatomic, retain) NSString * partnerLogo;
@property (nonatomic, retain) NSString * partnerName;
@property (nonatomic, retain) NSString * partnerWebsiteURL;
@property (nonatomic, retain) Events *eventsPartner;

@end
