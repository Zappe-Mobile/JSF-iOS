//
//  WhatToShopCell.h
//  JaipurShoppingFestival
//
//  Created by Roman Khan on 7/20/14.
//  Copyright (c) 2014 Zappe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WhatToShopCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UIImageView * imgShop;
@property (nonatomic, strong) IBOutlet UILabel * lblShopName;
@property (nonatomic, strong) IBOutlet UILabel * lblShopAddress;
@property (nonatomic, strong) IBOutlet UILabel * lblShopPhonePrimary;
@property (nonatomic, strong) IBOutlet UILabel * lblShopPhoneSecondry;
@property (nonatomic, strong) IBOutlet UIButton * btnPhonePrimary;
@end
