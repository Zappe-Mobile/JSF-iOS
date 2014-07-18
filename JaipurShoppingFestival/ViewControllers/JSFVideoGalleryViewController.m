//
//  JSFVideoGalleryViewController.m
//  JaipurShoppingFestival
//
//  Created by Shobhit Gupta on 7/12/14.
//  Copyright (c) 2014 Zappe. All rights reserved.
//

#import "JSFVideoGalleryViewController.h"
#import "AlbumVideos.h"
#import "VideoCollectionViewCell.h"
#import "UIImageView+AFNetworking.h"

@interface JSFVideoGalleryViewController ()
{
    __weak IBOutlet UIWebView * webVideo;
    __weak IBOutlet UILabel * lblPhotoName;
    __weak IBOutlet UIButton * btnLike;
    __weak IBOutlet UIButton * btnDislike;
    __weak IBOutlet UIButton * btnShare;
    __weak IBOutlet UIButton * btnFullScreen;
    __weak IBOutlet UIButton * btnPrev;
    __weak IBOutlet UIButton * btnNext;
    
    __weak IBOutlet UICollectionView * collectionViewGallery;
    
    NSMutableArray * arrayAlbumVideos;

}
@end

@implementation JSFVideoGalleryViewController

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
    
    [collectionViewGallery registerNib:[UINib nibWithNibName:@"VideoCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"VideoCollectionViewCell"];

    arrayAlbumVideos = [[NSMutableArray alloc]init];
    arrayAlbumVideos = [[_videoAlbum.albumVideos allObjects]mutableCopy];
    
    AlbumVideos * Object = [arrayAlbumVideos objectAtIndex:0];
    
    NSString * strVideo = [Object.videoYoutubeURL stringByReplacingOccurrencesOfString:@"watch?v=" withString:@"embed/"];
    
    NSString *videoHTML = [NSString stringWithFormat:@"\
                           <html>\
                           <head>\
                           <style type=\"text/css\">\
                           iframe {position:absolute; top:50%%; margin-top:-130px;}\
                           body {background-color:#000; margin:0;}\
                           </style>\
                           </head>\
                           <body>\
                           <iframe width=\"100%%\" height=\"240px\" src=\"%@\" frameborder=\"0\" allowfullscreen></iframe>\
                           </body>\
                           </html>", strVideo];
    
    [webVideo loadHTMLString:videoHTML baseURL:nil];

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
    
    return arrayAlbumVideos.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    VideoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"VideoCollectionViewCell" forIndexPath:indexPath];
    
    AlbumVideos * Object = arrayAlbumVideos[indexPath.row];
    
    NSArray * array = [Object.videoYoutubeURL componentsSeparatedByString:@"="];
    
    NSLog(@"%@",array);
    
    NSString * youtubeID = [array lastObject];
    NSURL *youtubeURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://img.youtube.com/vi/%@/0.jpg",youtubeID]];
                         
    [cell.webScreenshot setImageWithURL:youtubeURL placeholderImage:[UIImage imageNamed:@"placeHolderImage"]];
    
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
    
}


- (IBAction)videoLikeButtonClicked:(id)sender
{
    
}


- (IBAction)videoDislikeButtonClicked:(id)sender
{
    
}

- (IBAction)shareButtonClicked:(id)sender
{
    
}

- (IBAction)expandVideoButtonClicked:(id)sender
{
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end