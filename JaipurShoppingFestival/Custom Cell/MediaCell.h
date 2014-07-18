//
//  MediaCell.h
//  JaipurShoppingFestival
//
//  Created by Roman Khan on 7/12/14.
//  Copyright (c) 2014 Zappe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MediaCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UIImageView * imgMedia;
@property (nonatomic, strong) IBOutlet UILabel * lblMediaName;
@property (nonatomic, strong) IBOutlet UILabel * lblMediaDescription;
@end
