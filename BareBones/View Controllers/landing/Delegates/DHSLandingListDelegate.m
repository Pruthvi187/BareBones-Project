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
        case 0:
            sectionTitle = @"Payments";
            break;
        case 1:
            sectionTitle = @"Tasks";
            break;
        case 2:
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
    case 0:
        numRows = 1;
        break;
    case 1:
        numRows = 2;
        break;
    case 2:
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
        case 0:
            reuseIdentifier = @"paymentscell";
            cell = (DHSPaymentsCell *)[tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];

            break;
        case 1:
            reuseIdentifier = @"taskcell";
            cell = (DHSTaskCell *)[tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
            break;
        case 2:
            reuseIdentifier = @"appointmentcell";
            cell = (DHSAppointmentCell *)[tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
            break;
        case 3:
            reuseIdentifier = @"frequentlyusedcell";
            cell = (DHSFrequentlyUsedCell *)[tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
            break;
    }
    
                return cell;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 180;
}

@end
