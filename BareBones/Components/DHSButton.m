//
//  DHSButton.m
//  BareBones
//
//  Created by Alexander Jaroszewicz on 21/5/18.
//  Copyright © 2018 Pruthvi Henly Onkar. All rights reserved.
//

#import "DHSButton.h"


@implementation DHSButton

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
    self.layer.borderColor = DHSColorPool.defaultColorPool.whiteColor.CGColor;
    self.layer.backgroundColor = DHSColorPool.defaultColorPool.primaryColor.CGColor;
    self.layer.cornerRadius = 4.0;
    self.layer.borderWidth = 1.0;
    [self setTitleColor:DHSColorPool.defaultColorPool.whiteColor forState:UIControlStateNormal];
    
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
//- (void)drawRect:(CGRect)rect {
//    // Drawing code
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    [self.layer setCornerRadius:_cornerRadius];
//    CGRect myFrame = self.bounds;
//    CGRectInset(myFrame, 2, 2);
//    [_borderColor set];
//    [_backgroundColor set];
//    UIRectFrame(myFrame);
//}



@end
