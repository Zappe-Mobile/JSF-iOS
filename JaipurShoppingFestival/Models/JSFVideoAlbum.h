//
//  JSFVideoAlbum.h
//  JaipurShoppingFestival
//
//  Created by Roman Khan on 7/12/14.
//  Copyright (c) 2014 Zappe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class AlbumVideos;

@interface JSFVideoAlbum : NSManagedObject

@property (nonatomic, retain) NSString * videoAlbumDescription;
@property (nonatomic, retain) NSString * videoAlbumId;
@property (nonatomic, retain) NSString * videoAlbumImage;
@property (nonatomic, retain) NSString * videoAlbumName;
@property (nonatomic, retain) NSSet *albumVideos;
@end

@interface JSFVideoAlbum (CoreDataGeneratedAccessors)

- (void)addAlbumVideosObject:(AlbumVideos *)value;
- (void)removeAlbumVideosObject:(AlbumVideos *)value;
- (void)addAlbumVideos:(NSSet *)values;
- (void)removeAlbumVideos:(NSSet *)values;

@end
