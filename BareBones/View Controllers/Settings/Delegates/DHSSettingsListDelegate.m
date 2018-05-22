//
//  DHSLandingListDelegate.m
//  BareBones
//
//  Created by Ian Craigmile on 19/5/18.
//  Copyright © 2018 Pruthvi Henly Onkar. All rights reserved.
//

#import "DHSSettingsListDelegate.h"


@interface DHSSettingsListDelegate()
@property (nonatomic) NSMutableArray *settingsLabels;
@end

@implementation DHSSettingsListDelegate

- (instancetype)init
{
    self = [super init];
    if (self) {
        const NSArray *a1 = @[@"Theme"];
        const NSArray *a2 = @[@"History", @"Privacy", @"Terms & Conditions"];
        const NSArray *a3 = @[@"Sign Out"];
        
        self.settingsLabels = [NSMutableArray arrayWithObjects:a1, a2, a3, nil];
        
    }
    return self;
}

#pragma mark - UITableViewDataSource

#pragma mark - UITableViewDelegate
    
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.settingsLabels count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.settingsLabels[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [UITableViewCell new];
    cell.textLabel.text = self.settingsLabels[indexPath.section][indexPath.row];
    return cell;
}
@end
    
