//
//  JSFSponsors.h
//  JaipurShoppingFestival
//
//  Created by Romi on 21/06/14.
//  Copyright (c) 2014 Zappe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface JSFSponsors : NSManagedObject

@property (nonatomic, retain) NSString * sponsorDescription;
@property (nonatomic, retain) NSString * sponsorId;
@property (nonatomic, retain) NSString * sponsorLogo;
@property (nonatomic, retain) NSString * sponsorName;
@property (nonatomic, retain) NSString * sponsorWebsiteURL;

@end
