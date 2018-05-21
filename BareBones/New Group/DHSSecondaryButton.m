//
//  DHSSecondaryButton.m
//  BareBones
//
//  Created by Alexander Jaroszewicz on 21/5/18.
//  Copyright © 2018 Pruthvi Henly Onkar. All rights reserved.
//

#import "DHSSecondaryButton.h"

@implementation DHSSecondaryButton

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self _setup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self _setup];
    }
    return self;
    
}

- (void) _setup {
    CGRect buttonFrame = self.frame;
    buttonFrame.size = CGSizeMake(148, 48);
    self.frame = buttonFrame;
    self.layer.borderColor = UIColor.lightGrayColor.CGColor;
    self.layer.backgroundColor = DHSColorPool.defaultColorPool.whiteColor.CGColor;
    self.layer.cornerRadius = 4.0;
    self.layer.borderWidth = 1.0;
    [self setTitleColor:UIColor.blackColor forState:UIControlStateNormal];}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


@end
