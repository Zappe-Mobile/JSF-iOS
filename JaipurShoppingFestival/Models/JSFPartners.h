//
//  JSFPartners.h
//  JaipurShoppingFestival
//
//  Created by Romi on 21/06/14.
//  Copyright (c) 2014 Zappe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface JSFPartners : NSManagedObject

@property (nonatomic, retain) NSString * partnerId;
@property (nonatomic, retain) NSString * partnerLogo;
@property (nonatomic, retain) NSString * partnerName;
@property (nonatomic, retain) NSString * partnerWebsiteURL;

@end
