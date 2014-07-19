//
//  AlbumVideos.h
//  JaipurShoppingFestival
//
//  Created by Roman Khan on 7/19/14.
//  Copyright (c) 2014 Zappe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class JSFVideoAlbum;

@interface AlbumVideos : NSManagedObject

@property (nonatomic, retain) NSString * video3gpURL;
@property (nonatomic, retain) NSString * videoDescription;
@property (nonatomic, retain) NSString * videoDislikes;
@property (nonatomic, retain) NSString * videoHeading;
@property (nonatomic, retain) NSString * videoId;
@property (nonatomic, retain) NSString * videoLikes;
@property (nonatomic, retain) NSString * videoMp4URL;
@property (nonatomic, retain) NSString * videoYoutubeURL;
@property (nonatomic, retain) NSNumber * videoIsLike;
@property (nonatomic, retain) NSNumber * videoIsDislike;
@property (nonatomic, retain) JSFVideoAlbum *albumVids;

@end
