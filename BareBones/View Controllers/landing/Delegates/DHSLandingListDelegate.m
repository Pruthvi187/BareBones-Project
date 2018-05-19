//
//  DHSLandingListDelegate.m
//  BareBones
//
//  Created by Ian Craigmile on 19/5/18.
//  Copyright © 2018 Pruthvi Henly Onkar. All rights reserved.
//

#import "DHSLandingListDelegate.h"
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

@interface DHSLandingListDelegate()
@property (nonatomic) NSInteger numTasks;
@end

@implementation DHSLandingListDelegate

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *sectionTitle;
    switch (section) {
        case paymentsSection:
            sectionTitle = @"Payments";
            break;
        case tasksSection:
            sectionTitle = @"Tasks";
            break;
        case appointmentSection:
            sectionTitle = @"Next Appointment";
            break;
        case 3:
            sectionTitle = @"Frequently Used";
            break;
    }
    return sectionTitle;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger numRows = 0;
    switch (section) {
    case paymentsSection:
        numRows = 1;
        break;
    case tasksSection:
        numRows = 2;
        break;
    case appointmentSection:
        numRows = 1;
        break;
    case 3:
        numRows = 1;
        break;
    }
    return numRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *reuseIdentifier;
    UITableViewCell *cell;
    
    switch (indexPath.section) {
        case paymentsSection:
            reuseIdentifier = @"paymentscell";
            cell = (DHSPaymentsCell *)[tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];

            break;
        case tasksSection:
            reuseIdentifier = @"taskcell";
            cell = (DHSTaskCell *)[tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
            break;
        case appointmentSection:
            reuseIdentifier = @"appointmentcell";
            cell = (DHSAppointmentCell *)[tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
            break;
        case frequentlyUsedSection:
            reuseIdentifier = @"frequentlyusedcell";
            cell = (DHSFrequentlyUsedCell *)[tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
            break;
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger hgt;
    switch (indexPath.section) {
        case paymentsSection:
            hgt = 150;
            break;
        case tasksSection:
            hgt = 80;
            break;
        default:
            hgt = 180;
            break;
    }
    return hgt;
}

@end
