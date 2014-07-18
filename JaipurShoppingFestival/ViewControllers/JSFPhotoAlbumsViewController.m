//
//  JSFPhotoGalleryViewController.m
//  JaipurShoppingFestival
//
//  Created by Roman Khan on 21/06/14.
//  Copyright (c) 2014 Zappe. All rights reserved.
//

#import "JSFPhotoAlbumsViewController.h"
#import "DataManager.h"
#import "MediaCell.h"
#import "JSFAlbums.h"
#import "UIImageView+AFNetworking.h"
#import "JSFPhotoGalleryViewController.h"

@interface JSFPhotoAlbumsViewController ()
{
    IBOutlet UITableView * tblAlbums;
    NSMutableArray * arrayAlbums;
}
@end

@implementation JSFPhotoAlbumsViewController

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
    
    arrayAlbums = [[NSMutableArray alloc]init];
    arrayAlbums = [DataManager fetchAllJSFPhotosFromCoreData];
    
    NSLog(@"%@",arrayAlbums);
    
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
    return [arrayAlbums count];
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
    
    JSFAlbums * Object = arrayAlbums[indexPath.row];
    cell.lblMediaName.text = Object.albumName;
    cell.lblMediaDescription.text = Object.albumDescription;
    [cell.imgMedia setImageWithURL:[NSURL URLWithString:Object.albumImage] placeholderImage:[UIImage imageNamed:@"eventbanner.jpg"]];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    JSFPhotoGalleryViewController * photoGalleryObj = [[JSFPhotoGalleryViewController alloc]init];
    photoGalleryObj.album = arrayAlbums[indexPath.row];
    [self.navigationController pushViewController:photoGalleryObj animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
