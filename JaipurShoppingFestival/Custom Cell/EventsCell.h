//
//  EventsCell.h
//  JaipurShoppingFestival
//
//  Created by Roman Khan on 06/07/14.
//  Copyright (c) 2014 Zappe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventsCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel * eventNameLabel;
@property (nonatomic, strong) IBOutlet UILabel * eventVenueLabel;
@property (nonatomic, strong) IBOutlet UILabel * eventDescriptionLabel;
@property (nonatomic, strong) IBOutlet UILabel * eventMonthLabel;
@property (nonatomic, strong) IBOutlet UILabel * eventDateLabel;

@end
