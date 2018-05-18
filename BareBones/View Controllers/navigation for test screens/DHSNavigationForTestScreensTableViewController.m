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
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"navCell" forIndexPath:indexPath];
 
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"Sign In";
            break;
        case 1:
            cell.textLabel.text = @"AOC";
            break;
        case 2:
            cell.textLabel.text = @"Landing";
            break;
        case 3:
            cell.textLabel.text = @"Modal";
            break;
        case 4:
            cell.textLabel.text = @"Office Locator";
            break;
    }
 
    return cell;
}

#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Create the next view controller.
        switch (indexPath.row) {
        case 0: // welcome
            [self displaySigninVC];
            return;
        case 1: // AOC
            [self displayAOC];
            return;
        case 2: // landing
            break;
        case 3: // modal
            break;
        case 4:
            [self displayOfficeLocator];
            return;
    }
    
    LandingViewController *landingViewController = [[LandingViewController alloc] initWithNibName:@"LandingViewController" bundle:nil];
    
    // Push the view controller.
    [self.navigationController pushViewController:landingViewController animated:YES];
}

- (void) displaySigninVC {
    DHSSignInVC *signInVC = [DHSSignInVC new];
    [self.navigationController pushViewController:signInVC animated:YES];    
}

- (void) displayAOC {
    DHSAocVC *aocVC = [DHSAocVC new];
    [self.navigationController pushViewController:aocVC animated:YES];
}

- (void) displayOfficeLocator {
    DHSOfficeLocatorVC *officeLocatorVC = [DHSOfficeLocatorVC new];
    [self.navigationController pushViewController:officeLocatorVC animated:YES];
}



@end
