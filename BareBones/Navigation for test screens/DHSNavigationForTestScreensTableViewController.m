//
//  DHSNavigationForTestScreensTableViewController.m
//  BareBones
//
//  Created by Ian Craigmile on 18/5/18.
//  Copyright © 2018 Pruthvi Henly Onkar. All rights reserved.
//

#import "DHSNavigationForTestScreensTableViewController.h"
#import "DHSSignInVC.h"
#import "DHSAocVC.h"
#import "DHSOfficeLocatorVC.h"
#import "ButtonsViewController.h"
#import "SettingsViewController.h"

@interface DHSNavigationForTestScreensTableViewController ()
@property (nonatomic) NSArray *tableList;
@end

@implementation DHSNavigationForTestScreensTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
self.tableList = @[@"Main Tabs", @"Sign In", @"AoC", @"Landing", @"Office Locator", @"More", @"Buttons", @"Settings"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.tableList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"navCell" forIndexPath:indexPath];
 
    cell.textLabel.text = self.tableList[indexPath.row];
    return cell;
}

#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Create the next view controller.
    DHSMainTabsTabBarController *mainTabsTabBarController;
    AppDelegate *appDelegate;
    
    switch (indexPath.row) {
        case 0: // main tabs
            appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;

            mainTabsTabBarController = [[DHSMainTabsTabBarController alloc] initWithNibName:@"MainTabsTabBarViewController" bundle:nil];

            appDelegate.window.rootViewController = mainTabsTabBarController;
            
            // note: landing vc works here with root view controller
            break;
            
        case 1: // sign in
            [self displaySigninVC];
            return;
            
        case 2: // AOC
            [self displayAOC];
            return;
            
        case 3: // landing
            [self displayLanding];
            return;
            
        case 4: // office locator
            [self displayOfficeLocator];
            return;
            
        case 5: // More
            return;
        case 6:
            [self displayButtons];
            return;
        case 7:
            [self displaySettings];
            return;
    }
}
-(void)displayButtons {
    ButtonsViewController *buttons = [ButtonsViewController new];
    [self.navigationController pushViewController:buttons animated:YES];
}

- (void) displaySigninVC {
    DHSSignInVC *signInVC = [DHSSignInVC new];
    signInVC.modalTransitionStyle = UIModalPresentationFullScreen;
    [self presentViewController:signInVC animated:YES completion:nil];
}

- (void) displayAOC {
    DHSAocVC *aocVC = [DHSAocVC new];
    aocVC.modalTransitionStyle = UIModalPresentationFullScreen;
    [self presentViewController:aocVC animated:YES completion:nil];
}

- (void) displayOfficeLocator {
    DHSOfficeLocatorVC *officeLocatorVC = [DHSOfficeLocatorVC new];
    [self.navigationController pushViewController:officeLocatorVC animated:YES];
}

- (void) displayLanding {
    DHSLandingVC *landingVC = [DHSLandingVC new];
    [self.navigationController pushViewController:landingVC animated:YES];
}

-(void) displaySettings {
    SettingsViewController *settingsVC = [SettingsViewController new];
    [self.navigationController pushViewController:settingsVC animated:YES];
}


@end
