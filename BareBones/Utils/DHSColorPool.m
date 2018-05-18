//
//  DHSColorPool.m
//  BareBones
//
//  Created by Pruthvi Henly Onkar on 18/5/18.
//  Copyright © 2018 Pruthvi Henly Onkar. All rights reserved.
//

#import "DHSColorPool.h"

#define WWColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.f green:((float)((rgbValue & 0xFF00) >> 8)) / 255.f blue:((float)(rgbValue & 0xFF)) / 255.f alpha:1.f]

@implementation DHSColorPool

static DHSColorPool * _sharedPool;

+ (instancetype)defaultColorPool {
    
    static id _sharedPool = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        _sharedPool = [[self alloc] init];
    });
    
    return _sharedPool;
}

- (instancetype)init {
    
    self = [super init];

    _primaryColor = [UIColor colorWithRed:0.0f / 255.0f green:121.0f / 255.0f blue:202.0f / 255.0f alpha:1.0f];
    _urgentRedColor = [UIColor colorWithRed:212.0f / 255.0f green:8.0f / 255.0f blue:33.0f / 255.0f alpha:1.0f];
    _modalPopOverBGColor = [UIColor colorWithRed:0.0f / 255.0f green:0.0f / 255.0f blue:0.0f / 255.0f alpha:0.85f];
    _nonUrgentGrayColor =  [UIColor colorWithRed:74.0f / 255.0f green:74.0f / 255.0f blue:74.0f / 255.0f alpha:0.79f];
    _settingsBoldFontname = @"BentonSans-Medium";
    
    return self;
}

@end
