//
//  JSFAlbums.h
//  JaipurShoppingFestival
//
//  Created by rkhan-mbook on 11/07/14.
//  Copyright (c) 2014 Zappe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class AlbumImages;

@interface JSFAlbums : NSManagedObject

@property (nonatomic, retain) NSString * albumDescription;
@property (nonatomic, retain) NSString * albumId;
@property (nonatomic, retain) NSString * albumImage;
@property (nonatomic, retain) NSString * albumName;
@property (nonatomic, retain) NSSet *albumImages;
@end

@interface JSFAlbums (CoreDataGeneratedAccessors)

- (void)addAlbumImagesObject:(AlbumImages *)value;
- (void)removeAlbumImagesObject:(AlbumImages *)value;
- (void)addAlbumImages:(NSSet *)values;
- (void)removeAlbumImages:(NSSet *)values;

@end
