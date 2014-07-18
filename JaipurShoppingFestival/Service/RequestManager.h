//
//  RequestManager.h
//  JaipurShoppingFestival
//
//  Created by Roman Khan on 21/06/14.
//  Copyright (c) 2014 Zappe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSFBlocks.h"

@interface RequestManager : NSObject


+ (RequestManager *)sharedManager;


/**
 *  Events Listing
 *
 *  @param block Success OR Failure
 */
- (void)getEventsListingWithCompletionBlock:(CompletionBlock)block;


/**
 *  Places Listing
 *
 *  @param block Success OR Failure
 */
- (void)getPlacesListingWithCompletionBlock:(CompletionBlock)block;


/**
 *  Shops Listing
 *
 *  @param block Success OR Failure
 */
- (void)getShopsListingWithCompletionBlock:(CompletionBlock)block;


/**
 *  JSF Partners
 *
 *  @param block Success OR Failure
 */
- (void)getJSFPartnersWithCompletionBlock:(CompletionBlock)block;


/**
 *  JSF Sponsors
 *
 *  @param block Success OR Failure
 */
- (void)getJSFSponsorsWithCompletionBlock:(CompletionBlock)block;


/**
 *  JSF Photos
 *
 *  @param block Success OR Failure
 */
- (void)getJSFPhotosWithCompletionBlock:(CompletionBlock)block;


/**
 *  JSF Videos
 *
 *  @param block Success OR Failure
 */
- (void)getJSFVideosWithCompletionBlock:(CompletionBlock)block;


/**
 *  JSF Testimonials
 *
 *  @param block Success OR Failure
 */
- (void)getJSFTestimonialsWithCompletionBlock:(CompletionBlock)block;


/**
 *  JSF Raffles
 *
 *  @param block Success OR Failure
 */
- (void)getJSFRafflesWithCompletionBlock:(CompletionBlock)block;


/**
 *  JSF Used Raffles
 *
 *  @param block Success OR Failure
 */
- (void)getJSFUsedRafflesWithCompletionBlock:(CompletionBlock)block;


/**
 *  Contact Info
 *
 *  @param block Success OR Failure
 */
- (void)getContactInformationWithCompletionBlock:(CompletionBlock)block;


/**
 *  Photo Like Increment
 *
 *  @param block Success OR Failure
 */
- (void)updatePhotoLikeIncrementWithCompletionBlock:(CompletionBlock)block;


/**
 *  Photo Like Decrement
 *
 *  @param block Success OR Failure
 */
- (void)updatePhotoLikeDecrementWithCompletionBlock:(CompletionBlock)block;


/**
 *  Photo Dislike Increment
 *
 *  @param block Success OR Failure
 */
- (void)updatePhotoDislikeIncrementWithCompletionBlock:(CompletionBlock)block;


/**
 *  Photo Dislike Decrement
 *
 *  @param block Success OR Failure
 */
- (void)updatePhotoDislikeDecrementWithCompletionBlock:(CompletionBlock)block;


/**
 *  Video Like Increment
 *
 *  @param block Success OR Failure
 */
- (void)updateVideoLikeIncrementWithCompletionBlock:(CompletionBlock)block;


/**
 *  Video Like Decrement
 *
 *  @param block Success OR Failure
 */
- (void)updateVideoLikeDecrementWithCompletionBlock:(CompletionBlock)block;


/**
 *  Video Dislike Increment
 *
 *  @param block Success OR Failure
 */
- (void)updateVideoDislikeIncrementWithCompletionBlock:(CompletionBlock)block;


/**
 *  Video Dislike Decrement
 *
 *  @param block Success OR Failure
 */
- (void)updateVideoDislikeDecrementWithCompletionBlock:(CompletionBlock)block;

@end
