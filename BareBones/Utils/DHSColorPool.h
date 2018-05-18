//
//  DHSColorPool.h
//  BareBones
//
//  Created by Pruthvi Henly Onkar on 18/5/18.
//  Copyright © 2018 Pruthvi Henly Onkar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface DHSColorPool : NSObject

+ (DHSColorPool *)defaultColorPool;

#pragma mark - Color Defintions

@property (nonatomic, strong, readonly) UIColor *primaryColor;
@property (nonatomic, strong, readonly) UIColor *modalPopOverBGColor;

#pragma mark - UIFont Definitions

@property (nonatomic, strong, readonly) NSString *settingsBoldFontname;

@end
