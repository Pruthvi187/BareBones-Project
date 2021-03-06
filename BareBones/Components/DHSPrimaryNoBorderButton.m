//
//  DHSPrimaryNoBorderButton.m
//  BareBones
//
//  Created by Alexander Jaroszewicz on 21/5/18.
//  Copyright © 2018 Pruthvi Henly Onkar. All rights reserved.
//

#import "DHSPrimaryNoBorderButton.h"

@implementation DHSPrimaryNoBorderButton
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
    self.layer.backgroundColor = DHSColorPool.defaultColorPool.primaryColor.CGColor;
    self.layer.cornerRadius = 4.0;
    [self setTitleColor:DHSColorPool.defaultColorPool.whiteColor forState:UIControlStateNormal];}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
