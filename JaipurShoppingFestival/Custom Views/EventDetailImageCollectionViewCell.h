//
//  EventDetailCollectionViewCell.h
//  JaipurShoppingFestival
//
//  Created by Roman Khan on 7/13/14.
//  Copyright (c) 2014 Zappe. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Events;
@interface EventDetailImageCollectionViewCell : UICollectionViewCell

- (void)setupCollectionCellWithType:(NSMutableArray *)typeArray withEvent:(Events *)Object;
@end
