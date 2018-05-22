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
    [self setTabBarItemsAndControllers];
}

- (void)setTabBarItemsAndControllers {
    UIColor *navColour = [UIColor colorWithRed:0.0f / 255.0f green:121.0f / 255.0f blue:202.0f / 255.0f alpha:1.0f]; // 0079CA
    [[UINavigationBar appearance] setBarTintColor: navColour];
    [[UINavigationBar appearance] setTranslucent:NO];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    DHSLandingVC *landingVC = [DHSLandingVC new];
    UINavigationController *landingNC = [[UINavigationController alloc] initWithRootViewController:landingVC];
    landingNC.title = @"Home";
    landingNC.tabBarItem.image = [UIImage imageNamed:@"home"];
    
    DHSOfficeLocatorVC *profileVC = [DHSOfficeLocatorVC new];
    UINavigationController *profileNC = [[UINavigationController alloc] initWithRootViewController:profileVC];
    profileNC.title = @"Profile";
    profileNC.tabBarItem.image = [UIImage imageNamed:@"user"];
    
    DHSOfficeLocatorVC *inboxVC = [DHSOfficeLocatorVC new];
    UINavigationController *inboxNC = [[UINavigationController alloc] initWithRootViewController:inboxVC];
    inboxNC.title = @"Inbox";
    inboxNC.tabBarItem.image = [UIImage imageNamed:@"envelope"];
    
    DHSOfficeLocatorVC *assistantVC = [DHSOfficeLocatorVC new];
    UINavigationController *assistantNC = [[UINavigationController alloc] initWithRootViewController:assistantVC];
    assistantNC.title = @"Assistant";
    assistantNC.tabBarItem.image = [UIImage imageNamed:@"comments"];
    
    DHSOfficeLocatorVC *moreVC = [DHSOfficeLocatorVC new];
    UINavigationController *moreNC = [[UINavigationController alloc] initWithRootViewController:moreVC];
    moreNC.title = @"More";
    moreNC.tabBarItem.image = [UIImage imageNamed:@"bars"];
    
    NSMutableArray *controllerArray = [NSMutableArray arrayWithCapacity:5];
    
    [controllerArray insertObject:landingNC atIndex:0];
    [controllerArray insertObject:profileNC atIndex:1];
    [controllerArray insertObject:inboxNC atIndex:2];
    [controllerArray insertObject:assistantNC atIndex:3];
    [controllerArray insertObject:moreNC atIndex:4];
    
    self.viewControllers = controllerArray;
}

@end
