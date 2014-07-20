//
//  JSFHomeViewController.m
//  JaipurShoppingFestival
//
//  Created by Roman Khan on 21/06/14.
//  Copyright (c) 2014 Zappe. All rights reserved.
//

#import "JSFHomeViewController.h"
#import "JSFEventsViewController.h"
#import "JSFWhatToBuyViewController.h"
#import "JSFWhereToBuyViewController.h"
#import "JSFShopsViewController.h"
#import "JSFRafflesViewController.h"
#import "JSFTestimonialsViewController.h"
#import "JSFPartnersViewController.h"
#import "JSFSponsorsViewController.h"
#import "JSFMegaDrawViewController.h"
#import "JSFPhotoAlbumsViewController.h"
#import "JSFVideoAlbumsViewController.h"
#import "JSFHelpViewController.h"
#import "JSFAboutUsViewController.h"
#import "JSFAboutPatrikaViewController.h"
#import "RequestManager.h"
#import "DataManager.h"
#import "Reachability.h"
#import "SVProgressHUD.h"

@interface JSFHomeViewController ()
{
    __weak IBOutlet UIButton * eventsButton;
    __weak IBOutlet UIButton * whereToShopButton;
    __weak IBOutlet UIButton * whatToShopButton;
    __weak IBOutlet UIButton * shopsButton;
    __weak IBOutlet UIButton * rafflesButton;
    __weak IBOutlet UIButton * testimonialsButton;
    __weak IBOutlet UIButton * partnersButton;
    __weak IBOutlet UIButton * sponsorsButton;
    __weak IBOutlet UIButton * luckyDrawButton;
    __weak IBOutlet UIButton * aboutJSFButton;
    __weak IBOutlet UIButton * aboutPatrikaButton;
    __weak IBOutlet UIButton * helpButton;
    __weak IBOutlet UIButton * imagesButton;
    __weak IBOutlet UIButton * videosButton;
    
    __weak IBOutlet UILabel * eventsLabel;
    __weak IBOutlet UILabel * whereToShopLabel;
    __weak IBOutlet UILabel * whatToShopLabel;
    __weak IBOutlet UILabel * shopsLabel;
    __weak IBOutlet UILabel * rafflesLabel;
    __weak IBOutlet UILabel * testimonialsLabel;
    __weak IBOutlet UILabel * partnersLabel;
    __weak IBOutlet UILabel * sponsorsLabel;
    __weak IBOutlet UILabel * luckyDrawLabel;
    __weak IBOutlet UILabel * aboutJSFLabel;
    __weak IBOutlet UILabel * aboutPatrikaLabel;
    __weak IBOutlet UILabel * helpLabel;
    __weak IBOutlet UILabel * imagesLabel;
    __weak IBOutlet UILabel * videosLabel;
}
@end

@implementation JSFHomeViewController

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
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES];
    [self setAllLabelsAsNormal];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO];
}


- (IBAction)eventsButtonClicked:(id)sender
{
    eventsLabel.textColor = [UIColor colorWithRed:163.0f/255.0f green:44.0f/255.0f blue:103.0f/255.0f alpha:1.0];
    [eventsButton setImage:[UIImage imageNamed:@"select_deshicon01"] forState:UIControlStateNormal];
    
    if ([[Reachability reachabilityForInternetConnection]isReachable]) {
        
        [SVProgressHUD showWithStatus:@"Loading" maskType:SVProgressHUDMaskTypeBlack];
        [[RequestManager sharedManager]getEventsListingWithCompletionBlock:^(BOOL result, id resultObject) {
            
            [SVProgressHUD dismiss];
            if (result) {
                
                [DataManager storeEventsListingWithDataArray:[resultObject objectForKey:@"event"] DataBlock:^(BOOL success, NSError *error) {
                    
                    if (success) {
                        
                        JSFEventsViewController * eventsObj = [[JSFEventsViewController alloc]init];
                        [self.navigationController pushViewController:eventsObj animated:YES];
                        
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

- (IBAction)whereToShopButtonClicked:(id)sender
{
    whereToShopLabel.textColor = [UIColor colorWithRed:163.0f/255.0f green:44.0f/255.0f blue:103.0f/255.0f alpha:1.0];
    [whereToShopButton setImage:[UIImage imageNamed:@"select_deshicon02"] forState:UIControlStateNormal];

    if ([[Reachability reachabilityForInternetConnection]isReachable]) {
        
        [SVProgressHUD showWithStatus:@"Loading" maskType:SVProgressHUDMaskTypeBlack];
        [[RequestManager sharedManager]getPlacesListingWithCompletionBlock:^(BOOL result, id resultObject) {
            
            [SVProgressHUD dismiss];
            if (result) {
                
                [DataManager storePlacesListingWithDataArray:[resultObject objectForKey:@"place"] DataBlock:^(BOOL success, NSError *error) {
                    
                    if (success) {
                        
                        JSFWhereToBuyViewController * whereToBuyObj = [[JSFWhereToBuyViewController alloc]init];
                        [self.navigationController pushViewController:whereToBuyObj animated:YES];

                    }
                    else {
                        
                    }
                }];
            }
            else {
                
            }
        }];
    }
}

- (IBAction)whatToShopButtonClicked:(id)sender
{
    whatToShopLabel.textColor = [UIColor colorWithRed:163.0f/255.0f green:44.0f/255.0f blue:103.0f/255.0f alpha:1.0];
    [whatToShopButton setImage:[UIImage imageNamed:@"select_deshicon03"] forState:UIControlStateNormal];
    
    if ([[Reachability reachabilityForInternetConnection]isReachable]) {
        
        [SVProgressHUD showWithStatus:@"Loading" maskType:SVProgressHUDMaskTypeBlack];
        [[RequestManager sharedManager]getShopsListingWithCompletionBlock:^(BOOL result, id resultObject) {
            
            [SVProgressHUD dismiss];
            if (result) {
                
                [DataManager storeShopsListingWithDataArray:[resultObject objectForKey:@"shop"] DataBlock:^(BOOL success, NSError *error) {
                    
                    if (success) {
                        
                        JSFWhatToBuyViewController * whatToBuyObj = [[JSFWhatToBuyViewController alloc]init];
                        [self.navigationController pushViewController:whatToBuyObj animated:YES];
                        
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

- (IBAction)shopsButtonClicked:(id)sender
{
    shopsLabel.textColor = [UIColor colorWithRed:163.0f/255.0f green:44.0f/255.0f blue:103.0f/255.0f alpha:1.0];
    [shopsButton setImage:[UIImage imageNamed:@"select_deshicon04"] forState:UIControlStateNormal];

 }

- (IBAction)rafflesButtonClicked:(id)sender
{
    rafflesLabel.textColor = [UIColor colorWithRed:163.0f/255.0f green:44.0f/255.0f blue:103.0f/255.0f alpha:1.0];
    [rafflesButton setImage:[UIImage imageNamed:@"select_deshicon05"] forState:UIControlStateNormal];

    if ([[Reachability reachabilityForInternetConnection]isReachable]) {
        
        [SVProgressHUD showWithStatus:@"Loading" maskType:SVProgressHUDMaskTypeBlack];
        [[RequestManager sharedManager]getJSFRafflesWithCompletionBlock:^(BOOL result, id resultObject) {
            
            [SVProgressHUD dismiss];
            if (result) {
                
                [DataManager storeJSFRafflesWithDataArray:[resultObject objectForKey:@"raffles"] DataBlock:^(BOOL success, NSError *error) {
                    
                    if (success) {
                        
                        JSFRafflesViewController * rafflesObj = [[JSFRafflesViewController alloc]init];
                        [self.navigationController pushViewController:rafflesObj animated:YES];

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

- (IBAction)testimonialsButtonClicked:(id)sender
{
    testimonialsLabel.textColor = [UIColor colorWithRed:163.0f/255.0f green:44.0f/255.0f blue:103.0f/255.0f alpha:1.0];
    [testimonialsButton setImage:[UIImage imageNamed:@"select_deshicon06"] forState:UIControlStateNormal];

    if ([[Reachability reachabilityForInternetConnection]isReachable]) {
        
        [SVProgressHUD showWithStatus:@"Loading" maskType:SVProgressHUDMaskTypeBlack];
        [[RequestManager sharedManager]getJSFTestimonialsWithCompletionBlock:^(BOOL result, id resultObject) {
            
            [SVProgressHUD dismiss];
            if (result) {
                
                [DataManager storeJSFTestimonialsWithDataArray:[resultObject objectForKey:@"testimonials"] DataBlock:^(BOOL success, NSError *error) {
                    
                    if (success) {
                        
                        JSFTestimonialsViewController * testimonialsObj = [[JSFTestimonialsViewController alloc]init];
                        [self.navigationController pushViewController:testimonialsObj animated:YES];

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

- (IBAction)partnersButtonClicked:(id)sender
{
    partnersLabel.textColor = [UIColor colorWithRed:163.0f/255.0f green:44.0f/255.0f blue:103.0f/255.0f alpha:1.0];
    [partnersButton setImage:[UIImage imageNamed:@"select_deshicon07"] forState:UIControlStateNormal];

    if ([[Reachability reachabilityForInternetConnection]isReachable]) {
        
        [SVProgressHUD showWithStatus:@"Loading" maskType:SVProgressHUDMaskTypeBlack];
        [[RequestManager sharedManager]getJSFPartnersWithCompletionBlock:^(BOOL result, id resultObject) {
            
            [SVProgressHUD dismiss];
            if (result) {
                
                [DataManager storeJSFPartnersWithDataArray:[resultObject objectForKey:@"partner"] DataBlock:^(BOOL success, NSError *error) {
                    
                    if (success) {
                        
                        JSFPartnersViewController * partnersObj = [[JSFPartnersViewController alloc]init];
                        [self.navigationController pushViewController:partnersObj animated:YES];

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


- (IBAction)sponsorsButtonClicked:(id)sender
{
    sponsorsLabel.textColor = [UIColor colorWithRed:163.0f/255.0f green:44.0f/255.0f blue:103.0f/255.0f alpha:1.0];
    [sponsorsButton setImage:[UIImage imageNamed:@"select_deshicon08"] forState:UIControlStateNormal];

    if ([[Reachability reachabilityForInternetConnection]isReachable]) {
        
        [SVProgressHUD showWithStatus:@"Loading" maskType:SVProgressHUDMaskTypeBlack];
        [[RequestManager sharedManager]getJSFSponsorsWithCompletionBlock:^(BOOL result, id resultObject) {
            
            [SVProgressHUD dismiss];
            if (result) {
                
                [DataManager storeJSFSponsorsWithDataArray:[resultObject objectForKey:@"sponsor"] DataBlock:^(BOOL success, NSError *error) {
                    
                    if (success) {
                        
                        JSFSponsorsViewController * sponsorsObj = [[JSFSponsorsViewController alloc]init];
                        [self.navigationController pushViewController:sponsorsObj animated:YES];

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

- (IBAction)megaLuckyDrawButtonClicked:(id)sender
{
    luckyDrawLabel.textColor = [UIColor colorWithRed:163.0f/255.0f green:44.0f/255.0f blue:103.0f/255.0f alpha:1.0];
    [luckyDrawButton setImage:[UIImage imageNamed:@"select_deshicon09"] forState:UIControlStateNormal];

    JSFMegaDrawViewController * megaDrawObj = [[JSFMegaDrawViewController alloc]init];
    [self.navigationController pushViewController:megaDrawObj animated:YES];
}

- (IBAction)aboutJSFButtonClicked:(id)sender
{
    aboutJSFLabel.textColor = [UIColor colorWithRed:163.0f/255.0f green:44.0f/255.0f blue:103.0f/255.0f alpha:1.0];
    [aboutJSFButton setImage:[UIImage imageNamed:@"select_deshicon10"] forState:UIControlStateNormal];

    JSFAboutUsViewController * aboutJSFObj = [[JSFAboutUsViewController alloc]init];
    [self.navigationController pushViewController:aboutJSFObj animated:YES];
}

- (IBAction)aboutPatrikaButtonClicked:(id)sender
{
    aboutPatrikaLabel.textColor = [UIColor colorWithRed:163.0f/255.0f green:44.0f/255.0f blue:103.0f/255.0f alpha:1.0];
    [aboutPatrikaButton setImage:[UIImage imageNamed:@"select_deshicon11"] forState:UIControlStateNormal];

    JSFAboutPatrikaViewController * patrikaObj = [[JSFAboutPatrikaViewController alloc]init];
    [self.navigationController pushViewController:patrikaObj animated:YES];
}

- (IBAction)helpButtonClicked:(id)sender
{
    helpLabel.textColor = [UIColor colorWithRed:163.0f/255.0f green:44.0f/255.0f blue:103.0f/255.0f alpha:1.0];
    [helpButton setImage:[UIImage imageNamed:@"select_deshicon12"] forState:UIControlStateNormal];

    JSFHelpViewController * helpObj = [[JSFHelpViewController alloc]init];
    [self.navigationController pushViewController:helpObj animated:YES];
}

- (IBAction)imagesGalleryButtonClicked:(id)sender
{
    imagesLabel.textColor = [UIColor colorWithRed:163.0f/255.0f green:44.0f/255.0f blue:103.0f/255.0f alpha:1.0];
    [imagesButton setImage:[UIImage imageNamed:@"select_deshicon13"] forState:UIControlStateNormal];

    if ([[Reachability reachabilityForInternetConnection]isReachable]) {
        
        [SVProgressHUD showWithStatus:@"Loading" maskType:SVProgressHUDMaskTypeBlack];
        [[RequestManager sharedManager]getJSFPhotosWithCompletionBlock:^(BOOL result, id resultObject) {
            
            [SVProgressHUD dismiss];
            if (result) {
                
                [DataManager storeJSFPhotosWithDataArray:[resultObject objectForKey:@"album"] DataBlock:^(BOOL success, NSError *error) {
                    
                    if (success) {
                        
                        JSFPhotoAlbumsViewController * photoObj = [[JSFPhotoAlbumsViewController alloc]init];
                        [self.navigationController pushViewController:photoObj animated:YES];

                    }
                    else {
                        
                    }
                }];
            }
            else {
                
            }
        }];
    }
}

- (IBAction)videoGalleryButtonClicked:(id)sender
{
    videosLabel.textColor = [UIColor colorWithRed:163.0f/255.0f green:44.0f/255.0f blue:103.0f/255.0f alpha:1.0];
    [videosButton setImage:[UIImage imageNamed:@"select_deshicon14"] forState:UIControlStateNormal];

    if ([[Reachability reachabilityForInternetConnection]isReachable]) {
        
        [SVProgressHUD showWithStatus:@"Loading" maskType:SVProgressHUDMaskTypeBlack];
        [[RequestManager sharedManager]getJSFVideosWithCompletionBlock:^(BOOL result, id resultObject) {
            
            [SVProgressHUD dismiss];
            if (result) {
                
                [DataManager storeJSFVideosWithDataArray:[resultObject objectForKey:@"videoalbum"] DataBlock:^(BOOL success, NSError *error) {
                    
                    if (success) {
                        
                        JSFVideoAlbumsViewController * videoObj = [[JSFVideoAlbumsViewController alloc]init];
                        [self.navigationController pushViewController:videoObj animated:YES];

                    }
                    else {
                        
                    }
                }];
            }
            else {
                
            }
        }];
    }
}

- (void)setAllLabelsAsNormal
{
    eventsLabel.textColor = [UIColor whiteColor];
    whereToShopLabel.textColor = [UIColor whiteColor];
    whatToShopLabel.textColor = [UIColor whiteColor];
    shopsLabel.textColor = [UIColor whiteColor];
    rafflesLabel.textColor = [UIColor whiteColor];
    testimonialsLabel.textColor = [UIColor whiteColor];
    partnersLabel.textColor = [UIColor whiteColor];
    sponsorsLabel.textColor = [UIColor whiteColor];
    luckyDrawLabel.textColor = [UIColor whiteColor];
    aboutJSFLabel.textColor = [UIColor whiteColor];
    aboutPatrikaLabel.textColor = [UIColor whiteColor];
    helpLabel.textColor = [UIColor whiteColor];
    imagesLabel.textColor = [UIColor whiteColor];
    videosLabel.textColor = [UIColor whiteColor];

    
    [eventsButton setImage:[UIImage imageNamed:@"deshicon01"] forState:UIControlStateNormal];
    [whereToShopButton setImage:[UIImage imageNamed:@"deshicon02"] forState:UIControlStateNormal];
    [whatToShopButton setImage:[UIImage imageNamed:@"deshicon03"] forState:UIControlStateNormal];
    [shopsButton setImage:[UIImage imageNamed:@"deshicon04"] forState:UIControlStateNormal];
    [rafflesButton setImage:[UIImage imageNamed:@"deshicon05"] forState:UIControlStateNormal];
    [testimonialsButton setImage:[UIImage imageNamed:@"deshicon06"] forState:UIControlStateNormal];
    [partnersButton setImage:[UIImage imageNamed:@"deshicon07"] forState:UIControlStateNormal];
    [sponsorsButton setImage:[UIImage imageNamed:@"deshicon08"] forState:UIControlStateNormal];
    [luckyDrawButton setImage:[UIImage imageNamed:@"deshicon09"] forState:UIControlStateNormal];
    [aboutJSFButton setImage:[UIImage imageNamed:@"deshicon10"] forState:UIControlStateNormal];
    [aboutPatrikaButton setImage:[UIImage imageNamed:@"deshicon11"] forState:UIControlStateNormal];
    [helpButton setImage:[UIImage imageNamed:@"deshicon12"] forState:UIControlStateNormal];
    [imagesButton setImage:[UIImage imageNamed:@"deshicon13"] forState:UIControlStateNormal];
    [videosButton setImage:[UIImage imageNamed:@"deshicon14"] forState:UIControlStateNormal];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
