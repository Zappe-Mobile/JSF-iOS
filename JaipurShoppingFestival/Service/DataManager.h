//
//  DataManager.h
//  JaipurShoppingFestival
//
//  Created by Roman Khan on 21/06/14.
//  Copyright (c) 2014 Zappe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSFBlocks.h"

@interface DataManager : NSObject


/**
 *  Store Events Listing
 *
 *  @param block Data Storage - Success OR Failure
 */
+ (void)storeEventsListingWithDataArray:(NSArray *)dataArray DataBlock:(DataBlock)block;


/**
 *  Store Places Listing
 *
 *  @param block Data Storage - Success OR Failure
 */
+ (void)storePlacesListingWithDataArray:(NSArray *)dataArray DataBlock:(DataBlock)block;


/**
 *  Store Shops Listing
 *
 *  @param block Data Storage - Success OR Failure
 */
+ (void)storeShopsListingWithDataArray:(NSArray *)dataArray DataBlock:(DataBlock)block;


/**
 *  Store JSF Partners
 *
 *  @param block Data Storage - Success OR Failure
 */
+ (void)storeJSFPartnersWithDataArray:(NSArray *)dataArray DataBlock:(DataBlock)block;


/**
 *  Store JSF Sponsors
 *
 *  @param block Data Storage - Success OR Failure
 */
+ (void)storeJSFSponsorsWithDataArray:(NSArray *)dataArray DataBlock:(DataBlock)block;


/**
 *  Store JSF Photos
 *
 *  @param block Data Storage - Success OR Failure
 */
+ (void)storeJSFPhotosWithDataArray:(NSArray *)dataArray DataBlock:(DataBlock)block;


/**
 *  Store JSF Videos
 *
 *  @param block Data Storage - Success OR Failure
 */
+ (void)storeJSFVideosWithDataArray:(NSArray *)dataArray DataBlock:(DataBlock)block;


/**
 *  Store JSF Testimonials
 *
 *  @param block Data Storage - Success OR Failure
 */
+ (void)storeJSFTestimonialsWithDataArray:(NSArray *)dataArray DataBlock:(DataBlock)block;


/**
 *  Store JSF Raffles
 *
 *  @param block Data Storage - Success OR Failure
 */
+ (void)storeJSFRafflesWithDataArray:(NSArray *)dataArray DataBlock:(DataBlock)block;


/**
 *  Store JSF Used Raffles
 *
 *  @param block Data Storage - Success OR Failure
 */
+ (void)storeJSFUsedRafflesWithDataArray:(NSArray *)dataArray DataBlock:(DataBlock)block;


/**
 *  Store JSF Contact Info
 *
 *  @param block Data Storage - Success OR Failure
 */
+ (void)storeJSFContactInfoWithDataArray:(NSArray *)dataArray DataBlock:(DataBlock)block;


/**
 *  List of All Events
 *
 *  @return Array
 */
+ (NSMutableArray *)fetchAllEventsListingFromCoreData;


/**
 *  List of All Places
 *
 *  @return Array
 */
+ (NSMutableArray *)fetchAllPlacesListingFromCoreData;


/**
 *  List of All Shops
 *
 *  @return Array
 */
+ (NSMutableArray *)fetchAllShopsListingFromCoreData;


/**
 *  List of All JSF Partners
 *
 *  @return Array
 */
+ (NSMutableArray *)fetchAllJSFPartnersFromCoreData;


/**
 *  List of All JSF Sponsors
 *
 *  @return Array
 */
+ (NSMutableArray *)fetchAllJSFSponsorsFromCoreData;


/**
 *  List of All JSF Photos
 *
 *  @return Array
 */
+ (NSMutableArray *)fetchAllJSFPhotosFromCoreData;


/**
 *  List of All JSF Videos
 *
 *  @return Array
 */
+ (NSMutableArray *)fetchAllJSFVideosFromCoreData;


/**
 *  List of All JSF Testimonials
 *
 *  @return Array
 */
+ (NSMutableArray *)fetchAllJSFTestimonialsFromCoreData;


/**
 *  List of All JSF Raffles
 *
 *  @return Array
 */
+ (NSMutableArray *)fetchAllJSFRafflesFromCoreData;


/**
 *  List of All JSF Used Raffles
 *
 *  @return Array
 */
+ (NSMutableArray *)fetchAllJSFUsedRafflesFromCoreData;


/**
 *  JSF Contact Info
 *
 *  @return Array
 */
+ (NSMutableArray *)fetchAllJSFContactInfoFromCoreData;


/**
 *  Update Album Images Like
 *
 *  @param photoId Photo Id
 *  @param status  0 OR 1
 *  @param block   Block Returning Success OR Failure
 */
+(void)updateAlbumImagesLikeStatusWithPhotoId:(NSString *)photoId withStatus:(NSNumber *)status withDataBlock:(DataBlock)block;


/**
 *  Update Album Images Dislike
 *
 *  @param photoId Photo Id
 *  @param status  0 OR 1
 *  @param block   Block Returning Success OR Failure
 */
+(void)updateAlbumImagesDislikeStatusWithPhotoId:(NSString *)photoId withStatus:(NSNumber *)status withDataBlock:(DataBlock)block;


/**
 *  Update Album Videos Like
 *
 *  @param videoId Video Id
 *  @param status  0 OR 1
 *  @param block   Block Returning Success OR Failure
 */
+(void)updateAlbumVideosLikeStatusWithVideoId:(NSString *)videoId withStatus:(NSNumber *)status withDataBlock:(DataBlock)block;


/**
 *  Update Album Videos Dislike
 *
 *  @param videoId Video Id
 *  @param status  0 OR 1
 *  @param block   Block Returning Success OR Failure
 */
+(void)updateAlbumVideosDislikeStatusWithVideoId:(NSString *)videoId withStatus:(NSNumber *)status withDataBlock:(DataBlock)block;

@end
