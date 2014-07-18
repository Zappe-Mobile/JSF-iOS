//
//  EventImages.h
//  JaipurShoppingFestival
//
//  Created by Romi on 03/07/14.
//  Copyright (c) 2014 Zappe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Events;

@interface EventImages : NSManagedObject

@property (nonatomic, retain) NSString * imageDescription;
@property (nonatomic, retain) NSString * imageHeading;
@property (nonatomic, retain) NSString * imageId;
@property (nonatomic, retain) NSString * imageURL;
@property (nonatomic, retain) Events *eventsImage;

@end
