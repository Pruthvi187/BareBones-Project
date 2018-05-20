//
//  DHSMainTabsTabBarController.m
//  BareBones
//
//  Created by Ian Craigmile on 18/5/18.
//  Copyright © 2018 Pruthvi Henly Onkar. All rights reserved.
//

#import "DHSMainTabsTabBarController.h"
#import "DHSMainTabsDelegate.h"

// views controlled by the tabs
#import "DHSLandingVC.h"
#import "DHSOfficeLocatorVC.h"

@interface DHSMainTabsTabBarController ()
@property (nonatomic, strong) DHSMainTabsDelegate *mainTabsDelegate;
@end

@implementation DHSMainTabsTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.delegate = self.mainTabsDelegate;
    
    DHSLandingVC *landingVC = [DHSLandingVC new];
    DHSOfficeLocatorVC *officeLocatorVC = [DHSOfficeLocatorVC new];
    
    UINavigationController *landingNC = [[UINavigationController alloc] initWithRootViewController:landingVC];
    landingNC.title = @"Home";

    UINavigationController *officeLocatorNC = [[UINavigationController alloc] initWithRootViewController:officeLocatorVC];
    officeLocatorNC.title = @"Office";
    

    NSMutableArray *controllerArray = [NSMutableArray arrayWithCapacity:5];
    
    [controllerArray insertObject:landingNC atIndex:0];
    [controllerArray insertObject:officeLocatorNC atIndex:1];

    self.viewControllers = controllerArray;
}

@end
