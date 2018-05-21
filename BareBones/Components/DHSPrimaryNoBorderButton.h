//
//  DHSPrimaryNoBorderButton.h
//  BareBones
//
//  Created by Alexander Jaroszewicz on 21/5/18.
//  Copyright © 2018 Pruthvi Henly Onkar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "DHSColorPool.h"
#import "Constants.h"

IB_DESIGNABLE
@interface DHSPrimaryNoBorderButton : UIButton
@property (nonatomic, readonly)  UIColor *backgroundColor;
@property (nonatomic, readonly)  UIColor *borderColor;
@property (nonatomic, readonly)  CGFloat cornerRadius;
@property (nonatomic, readonly)  CGFloat borderWidth;
@end
