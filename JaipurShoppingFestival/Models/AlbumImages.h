//
//  AlbumImages.h
//  JaipurShoppingFestival
//
//  Created by Romi on 21/06/14.
//  Copyright (c) 2014 Zappe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class JSFAlbums;

@interface AlbumImages : NSManagedObject

@property (nonatomic, retain) NSString * photoDescription;
@property (nonatomic, retain) NSString * photoDislikes;
@property (nonatomic, retain) NSString * photoHeading;
@property (nonatomic, retain) NSString * photoId;
@property (nonatomic, retain) NSString * photoLikes;
@property (nonatomic, retain) NSString * photoURL;
@property (nonatomic, retain) JSFAlbums *albums;

@end
