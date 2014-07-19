//
//  EventDetailPartnerCollectionViewCell.m
//  JaipurShoppingFestival
//
//  Created by Roman Khan on 7/19/14.
//  Copyright (c) 2014 Zappe. All rights reserved.
//

#import "EventDetailPartnerCollectionViewCell.h"
#import "EventDetailCollectionViewCellItemPartner.h"
#import "Events.h"
#import "EventPartners.h"

@interface EventDetailPartnerCollectionViewCell () <UICollectionViewDataSource,UICollectionViewDelegate>
{
    IBOutlet UICollectionView * eventsDetailCollectionView;
    
    NSMutableArray * arrayEventPartners;
    
    NSMutableArray * arrayPartnerImageURL;
    
    
    
}
@end

@implementation EventDetailPartnerCollectionViewCell

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
    arrayEventPartners = [[NSMutableArray alloc]init];
    
    arrayPartnerImageURL = [[NSMutableArray alloc]init];
    
    
    eventsDetailCollectionView.delegate = self;
    eventsDetailCollectionView.dataSource = self;
    
    [eventsDetailCollectionView registerNib:[UINib nibWithNibName:@"EventDetailCollectionViewCellItemPartner" bundle:nil] forCellWithReuseIdentifier:@"EventDetailCollectionViewCellItemPartner"];
    
    
}

- (void)setupCollectionCellWithEvent:(Events *)Object
{
    
    arrayEventPartners = [[Object.eventsPartners allObjects]mutableCopy];
    
    for (EventPartners * Object in arrayEventPartners) {
        [arrayPartnerImageURL addObject:Object.partnerLogo];
    }
    
    NSLog(@"%@",arrayPartnerImageURL);
    
    [eventsDetailCollectionView reloadData];
}

#pragma mark - UICollectionViewDataSource methods
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return [arrayPartnerImageURL count];
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    EventDetailCollectionViewCellItemPartner *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"EventDetailCollectionViewCellItemPartner" forIndexPath:indexPath];
    
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
