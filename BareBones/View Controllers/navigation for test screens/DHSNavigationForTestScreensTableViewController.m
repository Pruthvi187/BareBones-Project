//
//  DHSNavigationForTestScreensTableViewController.m
//  BareBones
//
//  Created by Ian Craigmile on 18/5/18.
//  Copyright © 2018 Pruthvi Henly Onkar. All rights reserved.
//

#import "DHSNavigationForTestScreensTableViewController.h"


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
            cell.textLabel.text = @"Welcome";
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
    MainTabsViewController *mainTabsViewController;
    
    switch (indexPath.row) {
        case 0: // main tabs
            // must present this modally
            mainTabsViewController = [[MainTabsViewController alloc] initWithNibName:@"MainTabsViewController" bundle:nil];
            mainTabsViewController.modalPresentationStyle = UIModalPresentationOverFullScreen;
            [self presentViewController:mainTabsViewController animated:NO completion:nil];
            break;
            
        case 1: // welcome
            break;
            
        case 2: // AOC
            break;
            
        case 3: // landing
            landingViewController = [[LandingViewController alloc] initWithNibName:@"LandingViewController" bundle:nil];
            [self.navigationController pushViewController:landingViewController animated:YES];
            break;
    }

}

@end
