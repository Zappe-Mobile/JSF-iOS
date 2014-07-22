//
//  JSFWhereToBuyDetailViewController.m
//  JaipurShoppingFestival
//
//  Created by rkhan-mbook on 11/07/14.
//  Copyright (c) 2014 Zappe. All rights reserved.
//

#import "JSFWhereToBuyDetailViewController.h"
#import "JSFWhatToBuyViewController.h"
#import "UIImageView+AFNetworking.h"
#import "PlacesListing.h"

@interface JSFWhereToBuyDetailViewController ()
{
    __weak IBOutlet UIImageView * imgShop;
    __weak IBOutlet UILabel * lblShopName;
    __weak IBOutlet UITextView * txtShopDescription;
}
@end

@implementation JSFWhereToBuyDetailViewController

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
    
    [imgShop setImageWithURL:[NSURL URLWithString:_placesListing.placeBanner] placeholderImage:[UIImage imageNamed:@"eventbanner.jpg"]];
    lblShopName.text = _placesListing.placeName;
    txtShopDescription.text = _placesListing.placeDescription;

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


- (IBAction)exploreMoreButtonClicked:(id)sender
{
    JSFWhatToBuyViewController * whatToBuyObj = [[JSFWhatToBuyViewController alloc]initWithPlaceId:_placesListing.placeId];
    [self.navigationController pushViewController:whatToBuyObj animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
