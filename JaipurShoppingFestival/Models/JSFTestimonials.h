//
//  JSFTestimonials.h
//  JaipurShoppingFestival
//
//  Created by Roman Khan on 21/06/14.
//  Copyright (c) 2014 Zappe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface JSFTestimonials : NSManagedObject

@property (nonatomic, retain) NSString * testimonialDescription;
@property (nonatomic, retain) NSString * testimonialHeading;
@property (nonatomic, retain) NSString * testimonialId;
@property (nonatomic, retain) NSString * testimonialImageURL;
@property (nonatomic, retain) NSString * testimonialUserDesignation;
@property (nonatomic, retain) NSString * testimonialUsername;

@end
