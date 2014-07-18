//
//  Events.h
//  JaipurShoppingFestival
//
//  Created by Romi on 03/07/14.
//  Copyright (c) 2014 Zappe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class EventImages, EventPartners;

@interface Events : NSManagedObject

@property (nonatomic, retain) NSString * eventDescription;
@property (nonatomic, retain) NSString * eventEndDateTime;
@property (nonatomic, retain) NSString * eventId;
@property (nonatomic, retain) NSString * eventName;
@property (nonatomic, retain) NSString * eventPincode;
@property (nonatomic, retain) NSString * eventStartDateTime;
@property (nonatomic, retain) NSString * eventTicketPrice;
@property (nonatomic, retain) NSString * eventTicketURL;
@property (nonatomic, retain) NSString * eventVenue;
@property (nonatomic, retain) NSSet *eventsImages;
@property (nonatomic, retain) NSSet *eventsPartners;
@end

@interface Events (CoreDataGeneratedAccessors)

- (void)addEventsImagesObject:(EventImages *)value;
- (void)removeEventsImagesObject:(EventImages *)value;
- (void)addEventsImages:(NSSet *)values;
- (void)removeEventsImages:(NSSet *)values;

- (void)addEventsPartnersObject:(EventPartners *)value;
- (void)removeEventsPartnersObject:(EventPartners *)value;
- (void)addEventsPartners:(NSSet *)values;
- (void)removeEventsPartners:(NSSet *)values;

@end
