//
//  JSFPhotoGalleryViewController.m
//  JaipurShoppingFestival
//
//  Created by Roman Khan on 7/12/14.
//  Copyright (c) 2014 Zappe. All rights reserved.
//

#import "JSFPhotoGalleryViewController.h"
#import "PhotoCollectionViewCell.h"
#import "AlbumImages.h"
#import "UIImageView+AFNetworking.h"
#import "RequestManager.h"
#import "Reachability.h"
#import "SVProgressHUD.h"
#import "DataManager.h"

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
    
    __weak IBOutlet UILabel * lblLikesCount;
    __weak IBOutlet UILabel * lblDislikesCount;
    
    __weak IBOutlet UICollectionView * collectionViewGallery;
    
    NSMutableArray * arrayAlbumImages;
    
    NSInteger selectedIndex;
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
    lblLikesCount.text = Object.photoLikes;
    lblDislikesCount.text = Object.photoDislikes;
    selectedIndex = 0;
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
    lblLikesCount.text = Object.photoLikes;
    lblDislikesCount.text = Object.photoDislikes;
    selectedIndex = indexPath.row;
    
}

- (IBAction)photoLikeButtonClicked:(id)sender
{
    AlbumImages * Object = arrayAlbumImages[selectedIndex];
    if ([Object.photoIsLike intValue] == 0) {
        
        if ([[Reachability reachabilityForInternetConnection]isReachable]) {
            
            [SVProgressHUD showWithStatus:@"Loading" maskType:SVProgressHUDMaskTypeBlack];
            [[RequestManager sharedManager]updatePhotoLikeIncrementWithPhotoId:Object.photoId withCompletionBlock:^(BOOL result, id resultObject) {
                
                [SVProgressHUD dismiss];
                if (result) {
                    NSLog(@"%@",resultObject);
                    lblLikesCount.text = [resultObject objectForKey:@"likes"];
                    NSNumber *yourNumber = [NSNumber numberWithInt:1];
                    [DataManager updateAlbumImagesLikeStatusWithPhotoId:Object.photoId withStatus:yourNumber withDataBlock:^(BOOL success, NSError *error) {
                        
                        if (success) {
                            
                        }
                        else {
                            
                        }
                    }];
                }
                else {
                    
                }
            }];
        }
        else {
            
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Message" message:@"Internet Not Reachable.Please try Again" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alert show];
            
        }

    }
    else {
        
        if ([[Reachability reachabilityForInternetConnection]isReachable]) {
            
            [SVProgressHUD showWithStatus:@"Loading" maskType:SVProgressHUDMaskTypeBlack];
            [[RequestManager sharedManager]updatePhotoLikeDecrementWithPhotoId:Object.photoId withCompletionBlock:^(BOOL result, id resultObject) {
                
                [SVProgressHUD dismiss];
                if (result) {
                    
                    NSLog(@"%@",resultObject);
                    lblLikesCount.text = [resultObject objectForKey:@"likes"];
                    NSNumber *yourNumber = [NSNumber numberWithInt:0];
                    [DataManager updateAlbumImagesLikeStatusWithPhotoId:Object.photoId withStatus:yourNumber withDataBlock:^(BOOL success, NSError *error) {
                        
                        if (success) {
                            
                        }
                        else {
                            
                        }
                    }];
                }
                else {
                    
                }
            }];
             
        }
        else {
            
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Message" message:@"Internet Not Reachable.Please try Again" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alert show];
            
        }

    }
}


- (IBAction)photoDislikeButtonClicked:(id)sender
{
    AlbumImages * Object = arrayAlbumImages[selectedIndex];
    if ([Object.photoIsDislike intValue] == 0) {

        if ([[Reachability reachabilityForInternetConnection]isReachable]) {
            
            [SVProgressHUD showWithStatus:@"Loading" maskType:SVProgressHUDMaskTypeBlack];
            [[RequestManager sharedManager]updatePhotoDislikeIncrementWithPhotoId:Object.photoId withCompletionBlock:^(BOOL result, id resultObject) {
                
                [SVProgressHUD dismiss];
                if (result) {
                    NSLog(@"%@",resultObject);
                    lblDislikesCount.text = [resultObject objectForKey:@"dislikes"];
                    NSNumber *yourNumber = [NSNumber numberWithInt:1];
                    [DataManager updateAlbumImagesDislikeStatusWithPhotoId:Object.photoId withStatus:yourNumber withDataBlock:^(BOOL success, NSError *error) {
                        
                        if (success) {
                            
                        }
                        else {
                            
                        }
                    }];
                }
                else {
                    
                }
            }];
        }
        else {
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Message" message:@"Internet Not Reachable.Please try Again" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alert show];
            
        }

    }
    else {
        
        if ([[Reachability reachabilityForInternetConnection]isReachable]) {
            
            [SVProgressHUD showWithStatus:@"Loading" maskType:SVProgressHUDMaskTypeBlack];
            [[RequestManager sharedManager]updatePhotoDislikeDecrementWithPhotoId:Object.photoId withCompletionBlock:^(BOOL result, id resultObject) {
                
                [SVProgressHUD dismiss];
                if (result) {
                    NSLog(@"%@",resultObject);
                    lblDislikesCount.text = [resultObject objectForKey:@"dislikes"];
                    NSNumber *yourNumber = [NSNumber numberWithInt:0];
                    [DataManager updateAlbumImagesDislikeStatusWithPhotoId:Object.photoId withStatus:yourNumber withDataBlock:^(BOOL success, NSError *error) {
                        
                        if (success) {
                            
                        }
                        else {
                            
                        }
                    }];
                }
                else {
                    
                }
            }];
        }
        else {
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Message" message:@"Internet Not Reachable.Please try Again" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alert show];
 
        }
    }
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
