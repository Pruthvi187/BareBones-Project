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
    NSMutableArray *controllerArray = [NSMutableArray arrayWithCapacity:5];
    [controllerArray insertObject:landingVC atIndex:0];
    [controllerArray insertObject:officeLocatorVC atIndex:1];
    self.viewControllers = controllerArray;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
