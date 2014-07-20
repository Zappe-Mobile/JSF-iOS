//
//  JSFWhatToBuyViewController.m
//  JaipurShoppingFestival
//
//  Created by Roman Khan on 21/06/14.
//  Copyright (c) 2014 Zappe. All rights reserved.
//

#import "JSFWhatToBuyViewController.h"
#import "WhatToShopCell.h"
#import "ShopsListing.h"
#import "ShopCategories.h"
#import "DataManager.h"
#import "UIImageView+AFNetworking.h"

@interface JSFWhatToBuyViewController ()
{
    __weak IBOutlet UIView * viewArea;
    __weak IBOutlet UIView * viewCategory;
    
    __weak IBOutlet UIButton * btnArea;
    __weak IBOutlet UIButton * btnCategory;
    
    __weak IBOutlet UITableView * tblView;
    
    NSMutableArray * arrayShops;
    NSMutableArray * arrayCategories;
}
@end

@implementation JSFWhatToBuyViewController

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
        
    arrayShops = [[NSMutableArray alloc]init];
    arrayShops = [DataManager fetchAllShopsListingFromCoreData];
    
    arrayCategories = [[NSMutableArray alloc]init];
    
    for (ShopsListing * Object in arrayShops) {
        
        arrayCategories  = [[Object.shopsCategories allObjects]mutableCopy];
    }
    
    NSLog(@"%@",arrayCategories);
    
    ShopCategories * Object1 = [arrayCategories objectAtIndex:0];
    NSLog(@"%@",Object1.categoryName);
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
    return 100;
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
    return [arrayShops count];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    cell.backgroundColor = [UIColor clearColor];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    WhatToShopCell * cell=(WhatToShopCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"WhatToShopCell" owner:nil options:nil];
        cell = (WhatToShopCell *)[nib objectAtIndex:0];
        
        cell.backgroundView.backgroundColor = [UIColor whiteColor];
        cell.selectedBackgroundView = [[UIView alloc] initWithFrame:CGRectZero];
        cell.selectedBackgroundView.backgroundColor = [UIColor clearColor];
        
        
    }
    
    ShopsListing * Object = arrayShops[indexPath.row];
    cell.lblShopName.text = Object.shopName;
    cell.lblShopAddress.text = Object.shopAddress;
    [cell.imgShop setImageWithURL:[NSURL URLWithString:Object.shopImage] placeholderImage:[UIImage imageNamed:@"eventbanner.jpg"]];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (IBAction)btnAreaClicked:(id)sender
{
    
}

- (IBAction)btnCategoryClicked:(id)sender
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
