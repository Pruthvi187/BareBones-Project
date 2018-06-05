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
@property (weak, nonatomic) IBOutlet UILabel *textHeaderViewLabel;
@property (strong, nonatomic) IBOutlet UIView *textHeaderView;
@property (strong, nonatomic) IBOutlet UIView *tasksHeaderView;
@property (strong, nonatomic) IBOutlet UIView *paymentsHeaderView;
@end

@implementation DHSLandingListDelegate
CGFloat sectionHeaderHeight = 60.0f;

- (IBAction)showVPH:(id)sender {
    NSLog(@"showVPH()");
}

#pragma mark - UITableViewDataSource

#pragma mark - UITableViewDelegate

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return sectionHeaderHeight;
}

//
// Custom headers: with the odd badge or button, as well as text
//
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *sectionHeaderView;
    switch (section) {
        case paymentsSection:
            [[NSBundle mainBundle] loadNibNamed:@"DHSPaymentsSectionHeader" owner:self options:nil];
            sectionHeaderView = self.paymentsHeaderView;
            break;
        case tasksSection:
            [[NSBundle mainBundle] loadNibNamed:@"DHSTasksSectionHeader" owner:self options:nil];
            sectionHeaderView = self.tasksHeaderView;
            if (self.numTasks > 0) { // add a badge
            }
            break;
        case appointmentSection:
            [[NSBundle mainBundle] loadNibNamed:@"DHSTextSectionHeader" owner:self options:nil];
            sectionHeaderView = self.textHeaderView;
            self.textHeaderViewLabel.text = @"Next Appointment";
            break;
        case frequentlyUsedSection:
            [[NSBundle mainBundle] loadNibNamed:@"DHSTextSectionHeader" owner:self options:nil];
            sectionHeaderView = self.textHeaderView;
            self.textHeaderViewLabel.text = @"Frequently Used";
            break;
    }
    return sectionHeaderView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger numRows;
    if (section == tasksSection) {
        numRows = self.numTasks;
    }
    else {
        numRows = 1;
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
    NSInteger hgt = 0;
    switch (indexPath.section) {
        case paymentsSection:
            hgt = 130;
            break;
        case tasksSection:
            hgt = 70;
            break;
        case appointmentSection:
            hgt = 70;
            break;
        case frequentlyUsedSection:
            hgt = 120;
            break;
    }
    return hgt;
}

@end
