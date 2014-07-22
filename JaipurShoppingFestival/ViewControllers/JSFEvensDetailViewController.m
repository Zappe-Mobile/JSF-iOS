//
//  JSFEvensDetailViewController.m
//  JaipurShoppingFestival
//
//  Created by Roman Khan on 06/07/14.
//  Copyright (c) 2014 Zappe. All rights reserved.
//

#import "JSFEvensDetailViewController.h"
#import "EventImages.h"
#import "EventPartners.h"
#import "UIImageView+AFNetworking.h"
#import "PartnerCollectionViewCell.h"
#import "PartnerCollectionHeaderView.h"
#import "EventDetailImageCollectionViewCell.h"
#import "EventDetailVideoCollectionViewCell.h"
#import "EventDetailPartnerCollectionViewCell.h"
#import "EventDetailCollectionHeaderView.h"

@interface HeaderTapRecognizer : UITapGestureRecognizer
@property (nonatomic, assign) NSInteger sectionNumber;
@end

@implementation HeaderTapRecognizer
@end

@interface JSFEvensDetailViewController () <UICollectionViewDataSource,UICollectionViewDelegate,UIGestureRecognizerDelegate>
{
    __weak IBOutlet UIScrollView * scrollBackground;
    __weak IBOutlet UIImageView * imgEvent;
    __weak IBOutlet UIImageView * imgBanner;
    __weak IBOutlet UILabel * eventName;
    __weak IBOutlet UIButton * btnMap;
    __weak IBOutlet UITextView * txtEventDescription;
    __weak IBOutlet UILabel * lblTicketPrice;
    __weak IBOutlet UILabel * eventDate;
    __weak IBOutlet UILabel * eventTime;
    __weak IBOutlet UILabel * eventVenue;
    __weak IBOutlet UIButton * btnBuyTicket;
    
    __weak IBOutlet UICollectionView * eventDetailCollectionView;
    
    NSMutableArray * arrayEventsImages;
    NSMutableArray * arrayEventsPartners;
    NSMutableArray * arrayEventsVideos;
    
    NSMutableArray * arraySectionHeaders;
    
    NSInteger expandedSection;
    BOOL allowsMultipleExpanded;
    NSArray *sectionLabels;
    NSArray *sectionContent;
    NSMutableArray *arrNumberOfRowsForSections;
    NSMutableArray *expandedSectionContent;
    NSMutableArray *collapsedSectionContent;
    
    NSMutableArray * arraySelectedHeaders;
    
    BOOL isImageSetup;

    
}
@end

@implementation JSFEvensDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    scrollBackground.contentSize = CGSizeMake(320, 595);
    
    eventDetailCollectionView.frame = CGRectMake(0, 403, 320, 400);
    
    eventDetailCollectionView.delegate = self;
    eventDetailCollectionView.dataSource = self;
    
    arrNumberOfRowsForSections = [[NSMutableArray alloc]initWithObjects:@"0",@"0",@"0",nil];
    arraySelectedHeaders = [[NSMutableArray alloc]init];
    
    [eventDetailCollectionView registerNib:[UINib nibWithNibName:@"EventDetailImageCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"EventDetailImageCollectionViewCell"];
    [eventDetailCollectionView registerNib:[UINib nibWithNibName:@"EventDetailVideoCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"EventDetailVideoCollectionViewCell"];
    [eventDetailCollectionView registerNib:[UINib nibWithNibName:@"EventDetailPartnerCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"EventDetailPartnerCollectionViewCell"];
    [eventDetailCollectionView registerNib:[UINib nibWithNibName:@"EventDetailCollectionHeaderView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView"];

    
    arrayEventsImages = [[NSMutableArray alloc]init];
    arrayEventsImages = [[_events.eventsImages allObjects]mutableCopy];
    
    arrayEventsPartners = [[NSMutableArray alloc]init];
    arrayEventsPartners = [[_events.eventsPartners allObjects]mutableCopy];
    
    arrayEventsVideos = [[NSMutableArray alloc]init];
    arrayEventsVideos = [[_events.eventsPartners allObjects]mutableCopy];
    
    arraySectionHeaders = [[NSMutableArray alloc]init]; //WithObjects:@"Event Images",@"Event Partners",@"Event Videos",nil];
    
    if (arrayEventsImages.count > 0) {
        [arraySectionHeaders addObject:@"Event Images"];
    }
    
    if (arrayEventsPartners.count > 0) {
        [arraySectionHeaders addObject:@"Event Partners"];
    }
    
    if (arrayEventsVideos.count > 0) {
        [arraySectionHeaders addObject:@"Event Videos"];
    }

    NSLog(@"%@",arraySectionHeaders);
    
    eventName.text = _events.eventName;
    txtEventDescription.text = _events.eventDescription;
    lblTicketPrice.text = _events.eventTicketPrice;
    eventVenue.text = _events.eventVenue;
    eventDate.text = _events.eventStartDateTime;
    eventTime.text = _events.eventEndDateTime;
    if (arrayEventsImages.count > 0) {
        EventImages * Object = [arrayEventsImages objectAtIndex:1];
        [imgEvent setImageWithURL:[NSURL URLWithString:Object.imageURL] placeholderImage:[UIImage imageNamed:@"eventbanner.jpg"]];

    }
    
    imgBanner.image = [UIImage imageNamed:@"bannereffectbg.png"];
    [btnMap setImage:[UIImage imageNamed:@"mapicon"] forState:UIControlStateNormal];
    
    isImageSetup = NO;
    
    [self performSelector:@selector(setOverlayImage) withObject:nil afterDelay:5.0];
}

- (void)setOverlayImage
{
    imgBanner.image = [UIImage imageNamed:@"bannereffectbg.png"];
    [btnMap setImage:[UIImage imageNamed:@"mapicon"] forState:UIControlStateNormal];

}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO];
}

- (IBAction)backButtonClicked:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)homeButtonClicked:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

#pragma mark - UICollectionViewDataSource methods
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return [arraySectionHeaders count];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    for (int i = 0; i<[arraySectionHeaders count]; i++) {
        return [[arrNumberOfRowsForSections objectAtIndex:section] integerValue];
    }
    return 1;

}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    UICollectionViewCell * collectionCell = nil;
    
    if ([arraySelectedHeaders containsObject:@"Event Images"]) {
        
        EventDetailImageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"EventDetailImageCollectionViewCell" forIndexPath:indexPath];
        
        [cell setupCollectionCellWithEvent:_events];
        
        isImageSetup = YES;
        
        collectionCell = cell;
        
        return cell;

    }
    
    if ([arraySelectedHeaders containsObject:@"Event Videos"]) {
        
        EventDetailVideoCollectionViewCell *cell1 = [collectionView dequeueReusableCellWithReuseIdentifier:@"EventDetailVideoCollectionViewCell" forIndexPath:indexPath];
        
        //[cell setupCollectionCellWithType:arraySelectedHeaders withEvent:_events];
        
        collectionCell = cell1;
        
        return cell1;
        
    }

    if ([arraySelectedHeaders containsObject:@"Event Partners"]) {
        
        EventDetailPartnerCollectionViewCell *cell2 = [collectionView dequeueReusableCellWithReuseIdentifier:@"EventDetailPartnerCollectionViewCell" forIndexPath:indexPath];
        
        //[cell setupCollectionCellWithType:arraySelectedHeaders withEvent:_events];
        
        collectionCell = cell2;
        
        return cell2;
        
    }

    

    return 0;
}


- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize size = CGSizeMake(320, 100);
    
    return size;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //! No Functionality As Of Now
    
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    
    if (kind == UICollectionElementKindSectionHeader) {
        EventDetailCollectionHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
        if (indexPath.section %2 == 0) {
            headerView.backgroundColor = [UIColor colorWithRed:174.0f/255.0f green:16.0f/255.0f blue:84.0f/255.0f alpha:1.0];
        }
        else {
            headerView.backgroundColor = [UIColor colorWithRed:219.0f/255.0f green:85.0f/255.0f blue:23.0f/255.0f alpha:1.0];
        }
        
        headerView.headerLabel.text = [arraySectionHeaders objectAtIndex:indexPath.section];
        
        HeaderTapRecognizer *recognizer = [[HeaderTapRecognizer alloc] initWithTarget:self action:@selector(headerTapped:)];
        recognizer.sectionNumber = indexPath.section;
        [recognizer setNumberOfTapsRequired:1];
        [recognizer setNumberOfTouchesRequired:1];
        recognizer.delegate=self;
        [headerView addGestureRecognizer:recognizer];
        
        headerView.tag = indexPath.section;

        
        return headerView;
    }
    
    return nil;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    CGSize size = CGSizeMake(320, 35);
    return size; //here supplimentaryViewWidth will be set automatically depending on iPhone/iPad app even if you give any value for this.
}

/*
 * UIGestureRecognizerDelegate on background view
 */
#pragma mark- UIGestureRecognizerDelegate

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    if ([touch.view isKindOfClass:[UIControl class]]) {
        
        return NO;
    }
    return YES;
}

-(void)headerTapped:(id)sender
{
    HeaderTapRecognizer *htr = sender;
    NSInteger sectionNumber = htr.sectionNumber;
    NSLog(@"Header tapped for index Section %ld",(long)sectionNumber);
        
    
    if (![[arrNumberOfRowsForSections objectAtIndex:sectionNumber] isEqualToString:@"0"]) {
        [arrNumberOfRowsForSections replaceObjectAtIndex:sectionNumber withObject:@"0"];
        [arraySelectedHeaders removeObject:[arraySectionHeaders objectAtIndex:sectionNumber]];

    } else {
        [arrNumberOfRowsForSections replaceObjectAtIndex:sectionNumber withObject:@"1"];
        [arraySelectedHeaders addObject:[arraySectionHeaders objectAtIndex:sectionNumber]];
    }
    
    if (arraySelectedHeaders.count == 0) {
        scrollBackground.contentSize = CGSizeMake(320, 595);
    }
    else if (arraySelectedHeaders.count == 1) {
        scrollBackground.contentSize = CGSizeMake(320, 695);
    }
    else if (arraySelectedHeaders.count == 2) {
        scrollBackground.contentSize = CGSizeMake(320, 795);
    }
    else if (arraySelectedHeaders.count == 3) {
        scrollBackground.contentSize = CGSizeMake(320, 895);
    }
    
    [eventDetailCollectionView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    imgEvent = nil;
    eventName = nil;
    btnMap = nil;
    txtEventDescription = nil;
    lblTicketPrice = nil;
    eventDate = nil;
    eventTime = nil;
    eventVenue = nil;
    btnBuyTicket = nil;
    
    eventDetailCollectionView = nil;

}
@end
