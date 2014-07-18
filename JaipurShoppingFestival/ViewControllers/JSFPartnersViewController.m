//
//  JSFPartnersViewController.m
//  JaipurShoppingFestival
//
//  Created by Roman Khan on 21/06/14.
//  Copyright (c) 2014 Zappe. All rights reserved.
//

#import "JSFPartnersViewController.h"
#import "PartnerCollectionViewCell.h"
#import "PartnerCollectionHeaderView.h"
#import "DataManager.h"
#import "JSFPartners.h"
#import "UIImageView+AFNetworking.h"

@interface JSFPartnersViewController () <UICollectionViewDataSource,UICollectionViewDelegate>
{
    IBOutlet UICollectionView * partnerCollectionView;
    
    NSMutableArray * arrayPartners;
}
@end

@implementation JSFPartnersViewController

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
    
    partnerCollectionView.delegate = self;
    partnerCollectionView.dataSource = self;
    
    [partnerCollectionView registerNib:[UINib nibWithNibName:@"PartnerCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"PartnerCollectionViewCell"];
    [partnerCollectionView registerNib:[UINib nibWithNibName:@"PartnerCollectionHeaderView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView"];
    
    arrayPartners = [[NSMutableArray alloc]init];
    arrayPartners = [DataManager fetchAllJSFPartnersFromCoreData];
    
    
    NSLog(@"%@",arrayPartners);

    
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
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UICollectionViewDataSource methods
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return arrayPartners.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PartnerCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PartnerCollectionViewCell" forIndexPath:indexPath];
    
    JSFPartners *partners = arrayPartners[indexPath.item];
    
    NSLog(@"%@",partners.partnerLogo);
    
    NSURL * url = [NSURL URLWithString:partners.partnerLogo];
    
    [cell.partnerImage setImageWithURL:url placeholderImage:[UIImage imageNamed:@"eventbanner.jpg"]];
    
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

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    
    if (kind == UICollectionElementKindSectionHeader) {
        PartnerCollectionHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
        headerView.headerLabel.text = @"Partners";
        
        return headerView;
    }
    
    return nil;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    CGSize size = CGSizeMake(320, 30);
    return size; //here supplimentaryViewWidth will be set automatically depending on iPhone/iPad app even if you give any value for this.
}


#pragma mark - Asynchronous Image Download
- (void)downloadImageWithURL:(NSURL *)url completionBlock:(void (^)(BOOL succeeded, UIImage *image))completionBlock
{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                               if ( !error )
                               {
                                   UIImage *image = [[UIImage alloc] initWithData:data];
                                   completionBlock(YES,image);
                               } else{
                                   completionBlock(NO,nil);
                               }
                           }];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
