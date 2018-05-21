//
//  DHSPaymentsCell.m
//  BareBones
//
//  Created by Ian Craigmile on 19/5/18.
//  Copyright © 2018 Pruthvi Henly Onkar. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "DHSPaymentsCell.h"

@implementation DHSPaymentsCell

- (void)awakeFromNib {
    [super awakeFromNib];

    // [self configureBackingView];
}

//- (void)configureBackingView {
//    CALayer *layer = self.backingView.layer;
//    layer.cornerRadius = 15.0f;
//    layer.masksToBounds = NO;
//
//    layer.shadowOffset = CGSizeMake(0, 3);
//    layer.shadowColor = [[UIColor blackColor] CGColor]; // TODO
//    layer.shadowRadius = 2.0f;
//    layer.shadowOpacity = 0.35f;
//    layer.shadowPath = [[UIBezierPath bezierPathWithRoundedRect:layer.bounds cornerRadius:layer.cornerRadius] CGPath];
//
//    CGColorRef bColor = self.backingView.backgroundColor.CGColor;
//    self.backingView.backgroundColor = nil;
//    layer.backgroundColor = bColor;
//}

//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//
//    // Configure the view for the selected state
//}

@end
