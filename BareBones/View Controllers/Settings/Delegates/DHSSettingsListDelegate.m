//
//  DHSLandingListDelegate.m
//  BareBones
//
//  Created by Ian Craigmile on 19/5/18.
//  Copyright © 2018 Pruthvi Henly Onkar. All rights reserved.
//

#import "DHSSettingsListDelegate.h"
#import "DHSPaymentsCell.h"
#import "DHSTaskCell.h"
#import "DHSAppointmentCell.h"
#import "DHSFrequentlyUsedCell.h"

typedef NS_ENUM(NSInteger, SectionType) {
    paymentsSection,
    tasksSection,
    appointmentSection,
    frequentlyUsedSection
};

@interface DHSSettingsListDelegate()

@end

@implementation DHSSettingsListDelegate
NSMutableArray *settingsLabels;

- (instancetype)init
{
    self = [super init];
    if (self) {
        settingsLabels = @[@[@"Theme"], @[@"History", @"Privacy", @"Terms & Conditions"], @[@"Sign Out"]];
    }
    return self;
}

#pragma mark - UITableViewDataSource

#pragma mark - UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [settingsLabels count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [settingsLabels[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [UITableViewCell new];
    cell.textLabel.text = settingsLabels[indexPath.section][indexPath.row];
    return cell;
}
@end
