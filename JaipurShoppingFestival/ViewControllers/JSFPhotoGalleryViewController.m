//
//  JSFPhotoGalleryViewController.m
//  JaipurShoppingFestival
//
//  Created by Shobhit Gupta on 7/12/14.
//  Copyright (c) 2014 Zappe. All rights reserved.
//

#import "JSFPhotoGalleryViewController.h"
#import "PhotoCollectionViewCell.h"
#import "AlbumImages.h"
#import "UIImageView+AFNetworking.h"

@interface JSFPhotoGalleryViewController ()
{
    __weak IBOutlet UIImageView * imgGalleryPhoto;
    __weak IBOutlet UILabel * lblPhotoName;
    __weak IBOutlet UIButton * btnLike;
    __weak IBOutlet UIButton * btnDislike;
    __weak IBOutlet UIButton * btnShare;
    __weak IBOutlet UIButton * btnFullScreen;
    __weak IBOutlet UIButton * btnPrev;
    __weak IBOutlet UIButton * btnNext;
    
    __weak IBOutlet UICollectionView * collectionViewGallery;
    
    NSMutableArray * arrayAlbumImages;
}
@end

@implementation JSFPhotoGalleryViewController

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
    
    [collectionViewGallery registerNib:[UINib nibWithNibName:@"PhotoCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"PhotoCollectionViewCell"];

    
    arrayAlbumImages = [[NSMutableArray alloc]init];
    arrayAlbumImages = [[_album.albumImages allObjects]mutableCopy];
    
    NSLog(@"%@",arrayAlbumImages);
    
    imgGalleryPhoto.layer.borderWidth = 2.0;
    imgGalleryPhoto.layer.borderColor = [UIColor colorWithRed:203.0f/255.0f green:123.0f/255.0f blue:69.0f/255.0f alpha:1.0].CGColor;
    imgGalleryPhoto.layer.cornerRadius = 10.0;
    imgGalleryPhoto.layer.masksToBounds = YES;

    
    AlbumImages * Object = arrayAlbumImages[0];
    [imgGalleryPhoto setImageWithURL:[NSURL URLWithString:Object.photoURL] placeholderImage:[UIImage imageNamed:@"eventbanner.jpg"]];
    lblPhotoName.text = Object.photoHeading;
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
    
    return arrayAlbumImages.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PhotoCollectionViewCell" forIndexPath:indexPath];
    
    AlbumImages * Object = arrayAlbumImages[indexPath.row];
    [cell.imgPhoto setImageWithURL:[NSURL URLWithString:Object.photoURL] placeholderImage:[UIImage imageNamed:@"eventbanner.jpg"]];
    return cell;
}


- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize size = CGSizeMake(70, 70);
    
    return size;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //! No Functionality As Of Now
    AlbumImages * Object = arrayAlbumImages[indexPath.item];
    [imgGalleryPhoto setImageWithURL:[NSURL URLWithString:Object.photoURL] placeholderImage:[UIImage imageNamed:@"eventbanner.jpg"]];
    lblPhotoName.text = Object.photoHeading;
    
}

- (IBAction)photoLikeButtonClicked:(id)sender
{
    
}


- (IBAction)photoDislikeButtonClicked:(id)sender
{
    
}

- (IBAction)shareButtonClicked:(id)sender
{
    
}

- (IBAction)expandImageButtonClicked:(id)sender
{
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    imgGalleryPhoto = nil;
    lblPhotoName = nil;
    btnLike = nil;
    btnDislike = nil;
    btnShare = nil;
    btnFullScreen = nil;
    btnPrev = nil;
    btnNext = nil;
    
    collectionViewGallery = nil;

}

@end
