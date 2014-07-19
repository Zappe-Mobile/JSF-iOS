//
//  EventsCell.m
//  JaipurShoppingFestival
//
//  Created by Roman Khan on 06/07/14.
//  Copyright (c) 2014 Zappe. All rights reserved.
//

#import "EventsCell.h"

@implementation EventsCell
@synthesize eventNameLabel;

- (void)awakeFromNib
{
    // Initialization code
    self.backgroundColor = [UIColor whiteColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
