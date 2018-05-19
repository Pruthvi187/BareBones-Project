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

@interface DHSNavigationForTestScreensTableViewController ()

@end

@implementation DHSNavigationForTestScreensTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
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
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"navCell" forIndexPath:indexPath];
 
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"Main Tabs";
            break;
        case 1:
            cell.textLabel.text = @"Sign In";
            break;
        case 2:
            cell.textLabel.text = @"AOC";
            break;
        case 3:
            cell.textLabel.text = @"Landing";
            break;
    }
 
    return cell;
}

#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Create the next view controller.
    LandingViewController *landingViewController;
    LandingTableViewController *landingTableViewController;
    MainTabsTabBarController *mainTabsTabBarController;
    AppDelegate *appDelegate;
    
    switch (indexPath.row) {
        case 0: // main tabs
            appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;

//            mainTabsTabBarController = [[MainTabsTabBarController alloc] initWithNibName:@"MainTabsTabBarViewController" bundle:nil];
            
            landingViewController = [[LandingViewController alloc] initWithNibName:@"LandingViewController" bundle:nil];

            appDelegate.window.rootViewController = landingViewController;
            // note: landing vc works here with root view controller
        
            break;
            
        case 1: // sign in
            [self displaySigninVC];
            break;
            
        case 2: // AOC
            [self displayAOC];
            return;
            
        case 3: // landing
//            landingViewController = [[LandingViewController alloc] initWithNibName:@"LandingViewController" bundle:nil];
            
            landingTableViewController = [[LandingTableViewController alloc] initWithNibName:@"LandingTableViewController" bundle:nil];
            [self.navigationController pushViewController:landingTableViewController animated:YES];
            break;
    }
}

- (void) displaySigninVC {
    DHSSignInVC *signInVC = [DHSSignInVC new];
    [self.navigationController pushViewController:signInVC animated:YES];    
}

- (void) displayAOC {
    DHSAocVC *aocVC = [DHSAocVC new];
    [self.navigationController pushViewController:aocVC animated:YES];
}


@end
