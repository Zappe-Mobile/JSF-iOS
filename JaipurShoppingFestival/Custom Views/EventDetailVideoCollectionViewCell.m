//
//  EventDetailVideoCollectionViewCell.m
//  JaipurShoppingFestival
//
//  Created by Roman Khan on 7/19/14.
//  Copyright (c) 2014 Zappe. All rights reserved.
//

#import "EventDetailVideoCollectionViewCell.h"
#import "EventDetailCollectionViewCellItemVideo.h"
#import "Events.h"
#import "EventPartners.h"

@interface EventDetailVideoCollectionViewCell () <UICollectionViewDataSource,UICollectionViewDelegate>
{
    IBOutlet UICollectionView * eventsDetailCollectionView;
    
    NSMutableArray * arrayEventVideos;
    
    NSMutableArray * arrayPartnerVideoURL;
    
    
    
}
@end

@implementation EventDetailVideoCollectionViewCell

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
    arrayEventVideos = [[NSMutableArray alloc]init];
    
    arrayPartnerVideoURL = [[NSMutableArray alloc]init];
    
    
    eventsDetailCollectionView.delegate = self;
    eventsDetailCollectionView.dataSource = self;
    
    [eventsDetailCollectionView registerNib:[UINib nibWithNibName:@"EventDetailCollectionViewCellItemVideo" bundle:nil] forCellWithReuseIdentifier:@"EventDetailCollectionViewCellItemVideo"];
    
    
}

- (void)setupCollectionCellWithEvent:(Events *)Object
{
    
    arrayEventVideos = [[Object.eventsPartners allObjects]mutableCopy];
    
    for (EventPartners * Object in arrayEventVideos) {
        [arrayPartnerVideoURL addObject:Object.partnerLogo];
    }
    
    NSLog(@"%@",arrayPartnerVideoURL);
    
    [eventsDetailCollectionView reloadData];
}

#pragma mark - UICollectionViewDataSource methods
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return [arrayPartnerVideoURL count];
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    EventDetailCollectionViewCellItemVideo *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"EventDetailCollectionViewCellItemVideo" forIndexPath:indexPath];
    
    //  EventImages * Object = [arrayEventImages objectAtIndex:indexPath.row];
    //[cell.imgEvent setImageWithURL:[NSURL URLWithString:[arrayEventImageURL objectAtIndex:indexPath.row]] placeholderImage:[UIImage imageNamed:@"eventbanner.jpg"]];
    
    
    return cell;
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
