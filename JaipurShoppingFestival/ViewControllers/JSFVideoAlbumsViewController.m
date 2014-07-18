//
//  JSFVideoGalleryViewController.m
//  JaipurShoppingFestival
//
//  Created by Roman Khan on 21/06/14.
//  Copyright (c) 2014 Zappe. All rights reserved.
//

#import "JSFVideoAlbumsViewController.h"
#import "DataManager.h"
#import "MediaCell.h"
#import "UIImageView+AFNetworking.h"
#import "JSFVideoAlbum.h"
#import "JSFVideoGalleryViewController.h"

@interface JSFVideoAlbumsViewController ()
{
    IBOutlet UITableView * tblVideoAlbums;
    
    NSMutableArray * arrayVideoAlbums;
}
@end

@implementation JSFVideoAlbumsViewController

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
    
    arrayVideoAlbums = [[NSMutableArray alloc]init];
    arrayVideoAlbums = [DataManager fetchAllJSFVideosFromCoreData];
    
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

#pragma mark - Table View Delegate Methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    // This will create a "invisible" footer
    return 0.01f;
}

- (UIView *)tableView:(UITableView *)tv viewForFooterInSection:(NSInteger)section
{
    return [UIView new];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [arrayVideoAlbums count];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    cell.backgroundColor = [UIColor clearColor];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    MediaCell * cell=(MediaCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"MediaCell" owner:nil options:nil];
        cell = (MediaCell *)[nib objectAtIndex:0];
        
        cell.backgroundView.backgroundColor = [UIColor whiteColor];
        cell.selectedBackgroundView = [[UIView alloc] initWithFrame:CGRectZero];
        cell.selectedBackgroundView.backgroundColor = [UIColor clearColor];
        
        
    }
    
    JSFVideoAlbum * Object = arrayVideoAlbums[indexPath.row];
    cell.lblMediaName.text = Object.videoAlbumName;
    cell.lblMediaDescription.text = Object.videoAlbumDescription;
    [cell.imgMedia setImageWithURL:[NSURL URLWithString:Object.videoAlbumImage] placeholderImage:[UIImage imageNamed:@"eventbanner.jpg"]];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    JSFVideoGalleryViewController * videoGalleryObj = [[JSFVideoGalleryViewController alloc]init];
    videoGalleryObj.videoAlbum = arrayVideoAlbums[indexPath.row];
    [self.navigationController pushViewController:videoGalleryObj animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
