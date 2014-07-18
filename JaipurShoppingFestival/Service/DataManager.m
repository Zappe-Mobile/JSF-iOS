//
//  DataManager.m
//  JaipurShoppingFestival
//
//  Created by Roman Khan on 21/06/14.
//  Copyright (c) 2014 Zappe. All rights reserved.
//

#import "DataManager.h"
#import "Events.h"
#import "EventImages.h"
#import "EventPartners.h"
#import "PlacesListing.h"
#import "PlaceCategories.h"
#import "ShopsListing.h"
#import "ShopCategories.h"
#import "JSFAlbums.h"
#import "AlbumImages.h"
#import "JSFVideoAlbum.h"
#import "AlbumVideos.h"
#import "JSFPartners.h"
#import "JSFSponsors.h"
#import "JSFRafflesListing.h"
#import "JSFUsedRafflesListing.h"
#import "JSFTestimonials.h"
#import "JSFContactInfo.h"

#define NULL_TO_NIL(obj) ({ __typeof__ (obj) __obj = (obj); __obj == [NSNull null] ? nil : obj; })

@implementation DataManager


/**
 *  Store Events Listing
 *
 *  @param block Data Storage - Success OR Failure
 */
+ (void)storeEventsListingWithDataArray:(NSArray *)dataArray DataBlock:(DataBlock)block
{
 
    for (Events * Object in [DataManager fetchAllEventsListingFromCoreData]) {
        [Object MR_deleteEntity];
    }
    
    [dataArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        Events * eventObj = [Events MR_findFirstByAttribute:@"eventId" withValue:[obj objectForKey:@"event_id"]];
        if (!eventObj) {
            eventObj = [Events MR_createInContext:[NSManagedObjectContext MR_defaultContext]];
            
            if ([obj objectForKey:@"event_id"]!= NULL) {
                eventObj.eventId = [obj objectForKey:@"event_id"];
            }
            else {
                eventObj.eventId = @"";
            }
            
            if ([obj objectForKey:@"event_name"]!= NULL) {
                eventObj.eventName = [obj objectForKey:@"event_name"];
            }
            else {
                eventObj.eventName = @"";
            }
            
            if ([obj objectForKey:@"event_start_date_time"]!= NULL) {
                eventObj.eventStartDateTime = [obj objectForKey:@"event_start_date_time"];
            }
            else {
                eventObj.eventStartDateTime = @"";
            }
            
            if ([obj objectForKey:@"event_end_date_time"]!= NULL) {
                eventObj.eventEndDateTime = [obj objectForKey:@"event_end_date_time"];
            }
            else {
                eventObj.eventEndDateTime = @"";
            }

            if ([obj objectForKey:@"event_ticket_price"]!= NULL) {
                eventObj.eventTicketPrice = [obj objectForKey:@"event_ticket_price"];
            }
            else {
                eventObj.eventTicketPrice = @"";
            }
            
            
            if ([obj objectForKey:@"event_ticket_url"]!= NULL) {
                eventObj.eventTicketURL = [obj objectForKey:@"event_ticket_url"];
            }
            else {
                eventObj.eventTicketURL = @"";
            }
            
            if ([obj objectForKey:@"event_pincode"]!= NULL) {
                eventObj.eventPincode = [obj objectForKey:@"event_pincode"];
            }
            else {
                eventObj.eventPincode = @"";
            }

            if ([obj objectForKey:@"event_venue"]!= NULL) {
                eventObj.eventVenue = [obj objectForKey:@"event_venue"];
            }
            else {
                eventObj.eventVenue = @"";
            }


            if ([obj objectForKey:@"event_description"]!= NULL) {
                eventObj.eventDescription = [obj objectForKey:@"event_description"];
            }
            else {
                eventObj.eventDescription = @"";
            }


            
            NSArray * arrayEventImages = [obj objectForKey:@"images"];
            NSMutableSet *eventImagesSet = [[NSMutableSet alloc] init];
            
            [arrayEventImages enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                
                EventImages * eventImagesObj = [EventImages MR_createInContext:[NSManagedObjectContext MR_defaultContext]];
                
                if ([obj objectForKey:@"image_id"]!= NULL) {
                    eventImagesObj.imageId = [obj objectForKey:@"image_id"];
                }
                else {
                    eventImagesObj.imageId = @"";
                }
                
                if ([obj objectForKey:@"image_url"]!= NULL) {
                    eventImagesObj.imageURL = [obj objectForKey:@"image_url"];
                }
                else {
                    eventImagesObj.imageURL = @"";
                }
                
                if ([obj objectForKey:@"image_heading"]!= NULL) {
                    eventImagesObj.imageHeading = [obj objectForKey:@"image_heading"];
                }
                else {
                    eventImagesObj.imageHeading = @"";
                }
                
                if ([obj objectForKey:@"image_description"]!= NULL) {
                    eventImagesObj.imageDescription = [obj objectForKey:@"image_description"];
                }
                else {
                    eventImagesObj.imageDescription = @"";
                }
                
                [eventImagesSet addObject:eventImagesObj];
                
            }];
            
            [eventObj setValue:eventImagesSet forKey:@"eventsImages"];
            
            
            
            NSArray * arrayEventPartners = [obj objectForKey:@"partners"];
            NSMutableSet *eventPartnerSet = [[NSMutableSet alloc] init];
            
            [arrayEventPartners enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                
                EventPartners * eventPartnersObj = [EventPartners MR_createInContext:[NSManagedObjectContext MR_defaultContext]];
                
                if ([obj objectForKey:@"partner_id"]!= NULL) {
                    eventPartnersObj.partnerId = [obj objectForKey:@"partner_id"];
                }
                else {
                    eventPartnersObj.partnerId = @"";
                }
                
                if ([obj objectForKey:@"partner_logo"]!= NULL) {
                    eventPartnersObj.partnerLogo = [obj objectForKey:@"partner_logo"];
                }
                else {
                    eventPartnersObj.partnerLogo = @"";
                }
                
                if ([obj objectForKey:@"partner_name"]!= NULL) {
                    eventPartnersObj.partnerName = [obj objectForKey:@"partner_name"];
                }
                else {
                    eventPartnersObj.partnerName = @"";
                }
                
                if ([obj objectForKey:@"partner_website_url"]!= NULL) {
                    eventPartnersObj.partnerWebsiteURL = [obj objectForKey:@"partner_website_url"];
                }
                else {
                    eventPartnersObj.partnerWebsiteURL = @"";
                }
                
                [eventPartnerSet addObject:eventPartnersObj];
                
            }];

            [eventObj setValue:eventPartnerSet forKey:@"eventsPartners"];
        }
    }];
    
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreWithCompletion:block];

}


/**
 *  Store Places Listing
 *
 *  @param block Data Storage - Success OR Failure
 */
+ (void)storePlacesListingWithDataArray:(NSArray *)dataArray DataBlock:(DataBlock)block
{
    
    for (PlacesListing * Object in [DataManager fetchAllPlacesListingFromCoreData]) {
        [Object MR_deleteEntity];
    }
    
    NSLog(@"%@",dataArray);
    
    [dataArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        PlacesListing * shopObj = [PlacesListing MR_findFirstByAttribute:@"placeId" withValue:[obj objectForKey:@"place_id"]];
        if (!shopObj) {
            shopObj = [PlacesListing MR_createInContext:[NSManagedObjectContext MR_defaultContext]];
            
            if ([obj objectForKey:@"place_id"]!= NULL) {
                shopObj.placeId = [obj objectForKey:@"place_id"];
            }
            else {
                shopObj.placeId = @"";
            }
            
            if ([obj objectForKey:@"place_name"]!= NULL) {
                shopObj.placeName = [obj objectForKey:@"place_name"];
            }
            else {
                shopObj.placeName = @"";
            }
            
            if ([obj objectForKey:@"place_address"]!= NULL) {
                shopObj.placeAddress = [obj objectForKey:@"place_address"];
            }
            else {
                shopObj.placeAddress = @"";
            }
            
            if ([obj objectForKey:@"place_banner"]!= NULL) {
                shopObj.placeBanner = [obj objectForKey:@"place_banner"];
            }
            else {
                shopObj.placeBanner = @"";
            }
            
            if ([obj objectForKey:@"place_description"]!= NULL) {
                shopObj.placeDescription = [obj objectForKey:@"place_description"];
            }
            else {
                shopObj.placeDescription= @"";
            }
            
            
            if ([obj objectForKey:@"place_pincode"]!= NULL) {
                shopObj.placePincode = [obj objectForKey:@"place_pincode"];
            }
            else {
                shopObj.placePincode = @"";
            }
            
            
            NSArray * arrayShopsCategories = [obj objectForKey:@"categories"];
            NSMutableSet *shopsCategorySet = [[NSMutableSet alloc] init];
            
            [arrayShopsCategories enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                
                PlaceCategories * shopsCategoryObj = [PlaceCategories MR_createInContext:[NSManagedObjectContext MR_defaultContext]];
                
                if ([obj objectForKey:@"category_id"]!= NULL) {
                    shopsCategoryObj.categoryId = [obj objectForKey:@"category_id"];
                }
                else {
                    shopsCategoryObj.categoryId = @"";
                }
                
                if ([obj objectForKey:@"category_name"]!= NULL) {
                    shopsCategoryObj.categoryName = [obj objectForKey:@"category_name"];
                }
                else {
                    shopsCategoryObj.categoryName = @"";
                }
                
                if ([obj objectForKey:@"category_description"]!= NULL) {
                    shopsCategoryObj.categoryDescription = [obj objectForKey:@"category_description"];
                }
                else {
                    shopsCategoryObj.categoryDescription = @"";
                }
                
                [shopsCategorySet addObject:shopsCategoryObj];
                
            }];
            
            [shopObj setValue:shopsCategorySet forKey:@"placesCategories"];
            
        }
    }];
    
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreWithCompletion:block];

}


/**
 *  Store Shops Listing
 *
 *  @param block Data Storage - Success OR Failure
 */
+ (void)storeShopsListingWithDataArray:(NSArray *)dataArray DataBlock:(DataBlock)block
{
    NSLog(@"%@",dataArray);
    
    [dataArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        ShopsListing * shopObj = [ShopsListing MR_findFirstByAttribute:@"shopId" withValue:[obj objectForKey:@"shop_id"]];
        if (!shopObj) {
            shopObj = [ShopsListing MR_createInContext:[NSManagedObjectContext MR_defaultContext]];
            
            if ([obj objectForKey:@"shop_id"]!= NULL) {
                shopObj.shopId = [obj objectForKey:@"shop_id"];
            }
            else {
                shopObj.shopId = @"";
            }
            
            if ([obj objectForKey:@"shop_name"]!= NULL) {
                shopObj.shopName = [obj objectForKey:@"shop_name"];
            }
            else {
                shopObj.shopName = @"";
            }
            
            if ([obj objectForKey:@"shop_address"]!= NULL) {
                shopObj.shopAddress = [obj objectForKey:@"shop_address"];
            }
            else {
                shopObj.shopAddress = @"";
            }
            
            if ([obj objectForKey:@"shop_image"]!= NULL) {
                shopObj.shopImage = [obj objectForKey:@"shop_image"];
            }
            else {
                shopObj.shopImage = @"";
            }
            
            if ([obj objectForKey:@"shop_owner_name"]!= NULL) {
                shopObj.shopOwnerName = [obj objectForKey:@"shop_owner_name"];
            }
            else {
                shopObj.shopOwnerName= @"";
            }
            
            
            if ([obj objectForKey:@"shop_pincode"]!= NULL) {
                shopObj.shopPincode = [obj objectForKey:@"shop_pincode"];
            }
            else {
                shopObj.shopPincode = @"";
            }
            
            if ([obj objectForKey:@"place_id"]!= NULL) {
                shopObj.placeId = [obj objectForKey:@"place_id"];
            }
            else {
                shopObj.placeId = @"";
            }
            
            
            
            NSArray * arrayShopsCategories = [obj objectForKey:@"categories"];
            NSMutableSet *shopsCategorySet = [[NSMutableSet alloc] init];
            
            [arrayShopsCategories enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                
                ShopCategories * shopsCategoryObj = [ShopCategories MR_createInContext:[NSManagedObjectContext MR_defaultContext]];
                
                if ([obj objectForKey:@"category_id"]!= NULL) {
                    shopsCategoryObj.categoryId = [obj objectForKey:@"category_id"];
                }
                else {
                    shopsCategoryObj.categoryId = @"";
                }
                
                if ([obj objectForKey:@"category_name"]!= NULL) {
                    shopsCategoryObj.categoryName = [obj objectForKey:@"category_name"];
                }
                else {
                    shopsCategoryObj.categoryName = @"";
                }
                
                if ([obj objectForKey:@"category_description"]!= NULL) {
                    shopsCategoryObj.categoryDescription = [obj objectForKey:@"category_description"];
                }
                else {
                    shopsCategoryObj.categoryDescription = @"";
                }
                
                [shopsCategorySet addObject:shopsCategoryObj];
                
            }];
            
            [shopObj setValue:shopsCategorySet forKey:@"shopsCategories"];
            
        }
    }];
    
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreWithCompletion:block];

}


/**
 *  Store JSF Partners
 *
 *  @param block Data Storage - Success OR Failure
 */
+ (void)storeJSFPartnersWithDataArray:(NSArray *)dataArray DataBlock:(DataBlock)block
{
    
    for (JSFPartners * Object in [DataManager fetchAllJSFPartnersFromCoreData]) {
        [Object MR_deleteEntity];
    }
    
    NSLog(@"%@",dataArray);
    
    [dataArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        JSFPartners * shopObj = [JSFPartners MR_findFirstByAttribute:@"partnerId" withValue:[obj objectForKey:@"partner_id"]];
        if (!shopObj) {
            shopObj = [JSFPartners MR_createInContext:[NSManagedObjectContext MR_defaultContext]];
            
            if ([obj objectForKey:@"partner_id"]!= NULL) {
                shopObj.partnerId = [obj objectForKey:@"partner_id"];
            }
            else {
                shopObj.partnerId = @"";
            }
            
            if ([obj objectForKey:@"partner_logo"]!= NULL) {
                shopObj.partnerLogo = [obj objectForKey:@"partner_logo"];
            }
            else {
                shopObj.partnerLogo = @"";
            }
            
            if ([obj objectForKey:@"partner_name"]!= NULL) {
                shopObj.partnerName = [obj objectForKey:@"partner_name"];
            }
            else {
                shopObj.partnerName = @"";
            }
            
            if ([obj objectForKey:@"partner_website_url"]!= NULL) {
                shopObj.partnerWebsiteURL = [obj objectForKey:@"partner_website_url"];
            }
            else {
                shopObj.partnerWebsiteURL = @"";
            }
            
        }
    }];
    
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreWithCompletion:block];

}


/**
 *  Store JSF Sponsors
 *
 *  @param block Data Storage - Success OR Failure
 */
+ (void)storeJSFSponsorsWithDataArray:(NSArray *)dataArray DataBlock:(DataBlock)block
{
    NSLog(@"%@",dataArray);
    
    for (JSFSponsors * Object in [DataManager fetchAllJSFSponsorsFromCoreData]) {
        [Object MR_deleteEntity];
    }
    
    [dataArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        JSFSponsors *shopObj = [JSFSponsors MR_createInContext:[NSManagedObjectContext MR_defaultContext]];
            
            shopObj.sponsorId = NULL_TO_NIL([obj objectForKey:@"sponsor_id"]);
            
            shopObj.sponsorLogo = NULL_TO_NIL([obj objectForKey:@"sponsor_logo"]);
            
            shopObj.sponsorName = NULL_TO_NIL([obj objectForKey:@"sponsor_name"]);
            
            shopObj.sponsorWebsiteURL = NULL_TO_NIL([obj objectForKey:@"sponsor_website_url"]);
            
            shopObj.sponsorDescription = NULL_TO_NIL([obj objectForKey:@"sponsors_description"]);

            
    }];
    
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreWithCompletion:block];

}


/**
 *  Store JSF Photos
 *
 *  @param block Data Storage - Success OR Failure
 */
+ (void)storeJSFPhotosWithDataArray:(NSArray *)dataArray DataBlock:(DataBlock)block
{
    
    for (JSFAlbums * Object in [DataManager fetchAllJSFPhotosFromCoreData]) {
        [Object MR_deleteEntity];
    }
    
    NSLog(@"%@",dataArray);
    
    [dataArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        JSFAlbums * albumObj = [JSFAlbums MR_findFirstByAttribute:@"albumId" withValue:[obj objectForKey:@"album_id"]];
        if (!albumObj) {
            albumObj = [JSFAlbums MR_createInContext:[NSManagedObjectContext MR_defaultContext]];
            
            if ([obj objectForKey:@"album_id"]!= NULL) {
                albumObj.albumId = [obj objectForKey:@"album_id"];
            }
            else {
                albumObj.albumId = @"";
            }
            
            if ([obj objectForKey:@"album_name"]!= NULL) {
                albumObj.albumName = [obj objectForKey:@"album_name"];
            }
            else {
                albumObj.albumName = @"";
            }
            
            if ([obj objectForKey:@"album_image"]!= NULL) {
                albumObj.albumImage = [obj objectForKey:@"album_image"];
            }
            else {
                albumObj.albumImage = @"";
            }
            
            if ([obj objectForKey:@"album_description"]!= NULL) {
                albumObj.albumDescription = [obj objectForKey:@"album_description"];
            }
            else {
                albumObj.albumDescription = @"";
            }
            
            
            NSArray * arrayAlbumPhotos = [obj objectForKey:@"photo"];
            NSMutableSet *albumPhotosSet = [[NSMutableSet alloc] init];
            
            [arrayAlbumPhotos enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                
                AlbumImages * albumPhotosObj = [AlbumImages MR_createInContext:[NSManagedObjectContext MR_defaultContext]];
                
                if ([obj objectForKey:@"photo_id"]!= NULL) {
                    albumPhotosObj.photoId = [obj objectForKey:@"photo_id"];
                }
                else {
                    albumPhotosObj.photoId = @"";
                }
                
                if ([obj objectForKey:@"photo_heading"]!= NULL) {
                    albumPhotosObj.photoHeading = [obj objectForKey:@"photo_heading"];
                }
                else {
                    albumPhotosObj.photoHeading = @"";
                }
                
                if ([obj objectForKey:@"photo_description"]!= NULL) {
                    albumPhotosObj.photoDescription = [obj objectForKey:@"photo_description"];
                }
                else {
                    albumPhotosObj.photoDescription = @"";
                }
                
                if ([obj objectForKey:@"photo_likes"]!= NULL) {
                    albumPhotosObj.photoLikes = [obj objectForKey:@"photo_likes"];
                }
                else {
                    albumPhotosObj.photoLikes = @"";
                }

                if ([obj objectForKey:@"photo_dislikes"]!= NULL) {
                    albumPhotosObj.photoDislikes = [obj objectForKey:@"photo_dislikes"];
                }
                else {
                    albumPhotosObj.photoDislikes = @"";
                }

                if ([obj objectForKey:@"photo_url"]!= NULL) {
                    albumPhotosObj.photoURL = [obj objectForKey:@"photo_url"];
                }
                else {
                    albumPhotosObj.photoURL = @"";
                }
                
                albumPhotosObj.photoIsLike = [NSNumber numberWithInt:0];
                
                albumPhotosObj.photoIsDislike = [NSNumber numberWithInt:0];

                
                [albumPhotosSet addObject:albumPhotosObj];
                
            }];
            
            [albumObj setValue:albumPhotosSet forKey:@"albumImages"];
            
        }
    }];
    
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreWithCompletion:block];

}


/**
 *  Store JSF Videos
 *
 *  @param block Data Storage - Success OR Failure
 */
+ (void)storeJSFVideosWithDataArray:(NSArray *)dataArray DataBlock:(DataBlock)block
{
    
    for (JSFVideoAlbum * Object in [DataManager fetchAllJSFVideosFromCoreData]) {
        [Object MR_deleteEntity];
    }
    
    [dataArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        JSFVideoAlbum * albumObj = [JSFVideoAlbum MR_findFirstByAttribute:@"videoAlbumId" withValue:[obj objectForKey:@"video_album_id"]];
        if (!albumObj) {
            albumObj = [JSFVideoAlbum MR_createInContext:[NSManagedObjectContext MR_defaultContext]];
            
            if ([obj objectForKey:@"video_album_id"]!= NULL) {
                albumObj.videoAlbumId = [obj objectForKey:@"video_album_id"];
            }
            else {
                albumObj.videoAlbumId = @"";
            }
            
            if ([obj objectForKey:@"video_album_name"]!= NULL) {
                albumObj.videoAlbumName = [obj objectForKey:@"video_album_name"];
            }
            else {
                albumObj.videoAlbumName = @"";
            }
            
            if ([obj objectForKey:@"video_album_description"]!= NULL) {
                albumObj.videoAlbumDescription = [obj objectForKey:@"video_album_description"];
            }
            else {
                albumObj.videoAlbumDescription = @"";
            }
            
            if ([obj objectForKey:@"video_album_image"]!= NULL) {
                albumObj.videoAlbumImage = [obj objectForKey:@"video_album_image"];
            }
            else {
                albumObj.videoAlbumImage = @"";
            }
            
            
            NSArray * arrayAlbumPhotos = [obj objectForKey:@"video"];
            NSMutableSet *albumPhotosSet = [[NSMutableSet alloc] init];
            
            [arrayAlbumPhotos enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                
                AlbumVideos * albumPhotosObj = [AlbumVideos MR_createInContext:[NSManagedObjectContext MR_defaultContext]];
                
                if ([obj objectForKey:@"video_id"]!= NULL) {
                    albumPhotosObj.videoId = [obj objectForKey:@"video_id"];
                }
                else {
                    albumPhotosObj.videoId = @"";
                }
                
                if ([obj objectForKey:@"video_heading"]!= NULL) {
                    albumPhotosObj.videoHeading = [obj objectForKey:@"video_heading"];
                }
                else {
                    albumPhotosObj.videoHeading = @"";
                }
                
                if ([obj objectForKey:@"video_description"]!= NULL) {
                    albumPhotosObj.videoDescription = [obj objectForKey:@"video_description"];
                }
                else {
                    albumPhotosObj.videoDescription = @"";
                }
                
                if ([obj objectForKey:@"video_likes"]!= NULL) {
                    albumPhotosObj.videoLikes = [obj objectForKey:@"video_likes"];
                }
                else {
                    albumPhotosObj.videoLikes = @"";
                }
                
                if ([obj objectForKey:@"video_dislikes"]!= NULL) {
                    albumPhotosObj.videoDislikes = [obj objectForKey:@"video_dislikes"];
                }
                else {
                    albumPhotosObj.videoDislikes = @"";
                }
                
                if ([obj objectForKey:@"video_3gp_url"]!= NULL) {
                    albumPhotosObj.video3gpURL = [obj objectForKey:@"video_3gp_url"];
                }
                else {
                    albumPhotosObj.video3gpURL = @"";
                }
                
                if ([obj objectForKey:@"video_mp4_url"]!= NULL) {
                    albumPhotosObj.videoMp4URL = [obj objectForKey:@"video_mp4_url"];
                }
                else {
                    albumPhotosObj.videoMp4URL = @"";
                }

                if ([obj objectForKey:@"video_youtube_url"]!= NULL) {
                    albumPhotosObj.videoYoutubeURL = [obj objectForKey:@"video_youtube_url"];
                }
                else {
                    albumPhotosObj.videoYoutubeURL = @"";
                }
                
                
                [albumPhotosSet addObject:albumPhotosObj];
                
            }];
            
            [albumObj setValue:albumPhotosSet forKey:@"albumVideos"];
            
        }
    }];
    
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreWithCompletion:block];

}


/**
 *  Store JSF Testimonials
 *
 *  @param block Data Storage - Success OR Failure
 */
+ (void)storeJSFTestimonialsWithDataArray:(NSArray *)dataArray DataBlock:(DataBlock)block
{
    
    for (JSFTestimonials * Object in [DataManager fetchAllJSFTestimonialsFromCoreData]) {
        [Object MR_deleteEntity];
    }
    
    [dataArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        JSFTestimonials * shopObj = [JSFTestimonials MR_findFirstByAttribute:@"testimonialId" withValue:[obj objectForKey:@"testimonial_id"]];
        if (!shopObj) {
            shopObj = [JSFTestimonials MR_createInContext:[NSManagedObjectContext MR_defaultContext]];
            
            if ([obj objectForKey:@"testimonial_id"]!= NULL || [obj objectForKey:@"testimonial_id"]!= [NSNull null]) {
                shopObj.testimonialId = [obj objectForKey:@"testimonial_id"];
            }
            else {
                shopObj.testimonialId = @"";
            }
            
            if ([obj objectForKey:@"testimonial_heading"]!= NULL || [obj objectForKey:@"testimonial_heading"]!= [NSNull null]) {
                shopObj.testimonialHeading = [obj objectForKey:@"testimonial_heading"];
            }
            else {
                shopObj.testimonialHeading = @"";
            }
            
            if ([obj objectForKey:@"testimonial_description"]!= NULL || [obj objectForKey:@"testimonial_description"]!= [NSNull null]) {
                shopObj.testimonialDescription = [obj objectForKey:@"testimonial_description"];
            }
            else {
                shopObj.testimonialDescription = @"";
            }
            
            if ([obj objectForKey:@"testimonial_image_url"]!= NULL || [obj objectForKey:@"testimonial_image_url"]!= [NSNull null]) {
                shopObj.testimonialImageURL = [obj objectForKey:@"testimonial_image_url"];
            }
            else {
                shopObj.testimonialImageURL = @"";
            }
            
            if ([obj objectForKey:@"testimonila_username"]!= NULL || [obj objectForKey:@"testimonila_username"]!= [NSNull null]) {
                shopObj.testimonialUsername = [obj objectForKey:@"testimonila_username"];
            }
            else {
                shopObj.testimonialUsername = @"";
            }
            
            if ([obj objectForKey:@"testimonial_user_designation"]!= NULL || [obj objectForKey:@"testimonial_user_designation"]!= [NSNull null]) {
                shopObj.testimonialUserDesignation = [obj objectForKey:@"testimonial_user_designation"];
            }
            else {
                shopObj.testimonialUserDesignation = @"";
            }

            
            
        }
    }];
    
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreWithCompletion:block];

}


/**
 *  Store JSF Raffles
 *
 *  @param block Data Storage - Success OR Failure
 */
+ (void)storeJSFRafflesWithDataArray:(NSArray *)dataArray DataBlock:(DataBlock)block
{
    [dataArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        JSFRafflesListing * shopObj = [JSFRafflesListing MR_findFirstByAttribute:@"raffleId" withValue:[obj objectForKey:@"raffle_id"]];
        if (!shopObj) {
            shopObj = [JSFRafflesListing MR_createInContext:[NSManagedObjectContext MR_defaultContext]];
            
                shopObj.raffleId = NULL_TO_NIL([obj objectForKey:@"raffle_id"]);
            
                shopObj.raffleNumber = NULL_TO_NIL([obj objectForKey:@"raffle_number"]);

                shopObj.raffleStatus = NULL_TO_NIL([obj objectForKey:@"raffle_status"]);
            
                shopObj.raffleCategoryId = NULL_TO_NIL([obj objectForKey:@"raffle_category_id"]);
            
                shopObj.raffleUserEnteredPlaceId = NULL_TO_NIL([obj objectForKey:@"raffle_user_entered_placeID"]);
            
                shopObj.raffleUserEnteredShopId = NULL_TO_NIL([obj objectForKey:@"raffle_user_entered_shopID"]);
            
                shopObj.raffleUserNumber = NULL_TO_NIL([obj objectForKey:@"raffle_user_number"]);

                shopObj.raffleUserShoppingAmount = NULL_TO_NIL([obj objectForKey:@"raffle_user_shopping_amount"]);

                shopObj.shopId = NULL_TO_NIL([obj objectForKey:@"shop_id"]);

        }
    }];
    
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreWithCompletion:block];

}


/**
 *  Store JSF Used Raffles
 *
 *  @param block Data Storage - Success OR Failure
 */
+ (void)storeJSFUsedRafflesWithDataArray:(NSArray *)dataArray DataBlock:(DataBlock)block
{
    
}


/**
 *  Store JSF Contact Info
 *
 *  @param block Data Storage - Success OR Failure
 */
+ (void)storeJSFContactInfoWithDataArray:(NSArray *)dataArray DataBlock:(DataBlock)block
{
    
}


/**
 *  List of All Events
 *
 *  @return Array
 */
+ (NSMutableArray *)fetchAllEventsListingFromCoreData
{
    return [Events MR_findAll].mutableCopy;
}


/**
 *  List of All Places
 *
 *  @return Array
 */
+ (NSMutableArray *)fetchAllPlacesListingFromCoreData
{
    return [PlacesListing MR_findAll].mutableCopy;
}


/**
 *  List of All Shops
 *
 *  @return Array
 */
+ (NSMutableArray *)fetchAllShopsListingFromCoreData
{
    return [ShopsListing MR_findAll].mutableCopy;
}


/**
 *  List of All JSF Partners
 *
 *  @return Array
 */
+ (NSMutableArray *)fetchAllJSFPartnersFromCoreData
{
    return [JSFPartners MR_findAll].mutableCopy;
}


/**
 *  List of All JSF Sponsors
 *
 *  @return Array
 */
+ (NSMutableArray *)fetchAllJSFSponsorsFromCoreData
{
    return [JSFSponsors MR_findAll].mutableCopy;
}


/**
 *  List of All JSF Photos
 *
 *  @return Array
 */
+ (NSMutableArray *)fetchAllJSFPhotosFromCoreData
{
    return [JSFAlbums MR_findAll].mutableCopy;
}


/**
 *  List of All JSF Videos
 *
 *  @return Array
 */
+ (NSMutableArray *)fetchAllJSFVideosFromCoreData
{
    return [JSFVideoAlbum MR_findAll].mutableCopy;
}


/**
 *  List of All JSF Testimonials
 *
 *  @return Array
 */
+ (NSMutableArray *)fetchAllJSFTestimonialsFromCoreData
{
    return [JSFTestimonials MR_findAll].mutableCopy;
}


/**
 *  List of All JSF Raffles
 *
 *  @return Array
 */
+ (NSMutableArray *)fetchAllJSFRafflesFromCoreData
{
    return [JSFRafflesListing MR_findAll].mutableCopy;
}


/**
 *  List of All JSF Used Raffles
 *
 *  @return Array
 */
+ (NSMutableArray *)fetchAllJSFUsedRafflesFromCoreData
{
    return [JSFUsedRafflesListing MR_findAll].mutableCopy;
}


/**
 *  JSF Contact Info
 *
 *  @return Array
 */
+ (NSMutableArray *)fetchAllJSFContactInfoFromCoreData
{
    return [JSFContactInfo MR_findAll].mutableCopy;
}

/**
 *  Update Album Images
 *
 *  @param photoId Photo Id
 *  @param status  0 OR 1
 *  @param block   Block Returning Success OR Failure
 */
+(void)updateAlbumImagesLikeStatusWithPhotoId:(NSString *)photoId withStatus:(NSNumber *)status withDataBlock:(DataBlock)block
{
    AlbumImages * albumObj = [AlbumImages MR_findFirstByAttribute:@"photoId" withValue:photoId];
    
    if (albumObj) {
        albumObj.photoIsLike = status;
    }
    
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreWithCompletion:block];
}


/**
 *  Update Album Images Dislike
 *
 *  @param photoId Photo Id
 *  @param status  0 OR 1
 *  @param block   Block Returning Success OR Failure
 */
+(void)updateAlbumImagesDislikeStatusWithPhotoId:(NSString *)photoId withStatus:(NSNumber *)status withDataBlock:(DataBlock)block
{
    AlbumImages * albumObj = [AlbumImages MR_findFirstByAttribute:@"photoId" withValue:photoId];
    
    if (albumObj) {
        albumObj.photoIsDislike = status;
    }
    
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreWithCompletion:block];

}

@end
