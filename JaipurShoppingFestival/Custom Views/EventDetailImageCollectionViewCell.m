//
//  EventDetailCollectionViewCell.m
//  JaipurShoppingFestival
//
//  Created by Roman Khan on 7/13/14.
//  Copyright (c) 2014 Zappe. All rights reserved.
//

#import "EventDetailImageCollectionViewCell.h"
#import "EventDetailCollectionViewCellItemImage.h"
#import "EventDetailCollectionViewCellItemPartner.h"
#import "EventDetailCollectionViewCellItemVideo.h"
#import "Events.h"
#import "UIImageView+AFNetworking.h"
#import "EventImages.h"

@interface EventDetailImageCollectionViewCell () <UICollectionViewDataSource,UICollectionViewDelegate>
{
    IBOutlet UICollectionView * eventsDetailCollectionView;
    
    NSMutableArray * arrayEventImages;
    NSMutableArray * arrayEventPartners;
    NSMutableArray * arrayEventVideos;
    
    NSMutableArray * arrayEventImageURL;
    
    NSMutableArray * detailTypeArray;
    
    
}
@end

@implementation EventDetailImageCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    arrayEventImages = [[NSMutableArray alloc]init];
    arrayEventPartners = [[NSMutableArray alloc]init];
    arrayEventVideos = [[NSMutableArray alloc]init];
    
    arrayEventImageURL = [[NSMutableArray alloc]init];
    
    detailTypeArray = [[NSMutableArray alloc]init];
    
    eventsDetailCollectionView.delegate = self;
    eventsDetailCollectionView.dataSource = self;
    
    [eventsDetailCollectionView registerNib:[UINib nibWithNibName:@"EventDetailCollectionViewCellItemImage" bundle:nil] forCellWithReuseIdentifier:@"EventDetailCollectionViewCellItemImage"];
    [eventsDetailCollectionView registerNib:[UINib nibWithNibName:@"EventDetailCollectionViewCellItemPartner" bundle:nil] forCellWithReuseIdentifier:@"EventDetailCollectionViewCellItemPartner"];
    [eventsDetailCollectionView registerNib:[UINib nibWithNibName:@"EventDetailCollectionViewCellItemVideo" bundle:nil] forCellWithReuseIdentifier:@"EventDetailCollectionViewCellItemVideo"];
  

}

- (void)setupCollectionCellWithType:(NSMutableArray *)typeArray withEvent:(Events *)Object
{
    detailTypeArray = typeArray;
    
    NSLog(@"%@",typeArray);
    for (NSString * String in typeArray) {
        
        if ([String isEqualToString:@"Event Videos"]) {
            
            [arrayEventVideos addObject:[[Object.eventsImages allObjects]mutableCopy]];
        }
        else if ([String isEqualToString:@"Event Images"]) {
            
            arrayEventImages = [[Object.eventsImages allObjects]mutableCopy];
            
            for (EventImages * Object in arrayEventImages) {
                [arrayEventImageURL addObject:Object.imageURL];
            }
        }
        else if ([String isEqualToString:@"Event Partners"]) {
            
            [arrayEventPartners addObject:[[Object.eventsPartners allObjects]mutableCopy]];
        }
    }
    
    NSLog(@"%@",arrayEventImageURL);
    
    [eventsDetailCollectionView reloadData];
}

#pragma mark - UICollectionViewDataSource methods
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 3;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell * collectionCell = nil;
    
    if ([detailTypeArray containsObject:@"Event Images"]) {
        
        EventDetailCollectionViewCellItemImage *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"EventDetailCollectionViewCellItemImage" forIndexPath:indexPath];
        
//        EventImages * Object = [arrayEventImages objectAtIndex:indexPath.row];
         [cell.imgEvent setImageWithURL:[NSURL URLWithString:[arrayEventImageURL objectAtIndex:indexPath.row]] placeholderImage:[UIImage imageNamed:@"eventbanner.jpg"]];

        collectionCell = cell;

    }
    
    if ([detailTypeArray containsObject:@"Event Videos"]) {
        
        EventDetailCollectionViewCellItemVideo *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"EventDetailCollectionViewCellItemVideo" forIndexPath:indexPath];
        
        
        collectionCell = cell;
        
    }

    if ([detailTypeArray containsObject:@"Event Partners"]) {
        
        EventDetailCollectionViewCellItemPartner *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"EventDetailCollectionViewCellItemPartner" forIndexPath:indexPath];
        
        
        collectionCell = cell;
        
    }

    
    
    return collectionCell;
}


- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize size = CGSizeMake(100, 100);
    
    return size;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //! No Functionality As Of Now
    
}

@end
