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

//
// Programmatically create a view to be used as the background view of the cell
// Rounded corners with a shadow
//
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat cornerRadius = 10.0;
    CGFloat leftAndRightMargin = 10.0f;
    
    cell.backgroundColor = UIColor.clearColor;
    
    // create a layer for a "background view" for the cell
    CAShapeLayer *newLayer = [[CAShapeLayer alloc] init];
    
    CGMutablePathRef pathRef = CGPathCreateMutable();
    CGRect indentedBounds = CGRectInset(cell.bounds, leftAndRightMargin, 0.0f); // space left and right
    BOOL addSeparatorLine = NO;
    
    // cell rounded and indented rectangle
    if (indexPath.row == 0 && indexPath.row == [tableView numberOfRowsInSection:indexPath.section]-1) { // a section with 1 row
        CGPathAddRoundedRect(pathRef, nil, indentedBounds, cornerRadius, cornerRadius);
    }
    else
    if (indexPath.row == 0) { // top cell
        CGPathMoveToPoint(pathRef, nil, CGRectGetMinX(indentedBounds), CGRectGetMaxY(indentedBounds));
        CGPathAddArcToPoint(pathRef, nil, CGRectGetMinX(indentedBounds), CGRectGetMinY(indentedBounds), CGRectGetMidX(indentedBounds), CGRectGetMinY(indentedBounds), cornerRadius);
        CGPathAddArcToPoint(pathRef, nil, CGRectGetMaxX(indentedBounds), CGRectGetMinY(indentedBounds), CGRectGetMaxX(indentedBounds), CGRectGetMidY(indentedBounds), cornerRadius);
        CGPathAddLineToPoint(pathRef, nil, CGRectGetMaxX(indentedBounds), CGRectGetMaxY(indentedBounds));
        addSeparatorLine = YES;
    }
    else
    if (indexPath.row == [tableView numberOfRowsInSection:indexPath.section]-1) { // bottom cell
        CGPathMoveToPoint(pathRef, nil, CGRectGetMinX(indentedBounds), CGRectGetMinY(indentedBounds));
        CGPathAddArcToPoint(pathRef, nil, CGRectGetMinX(indentedBounds), CGRectGetMaxY(indentedBounds), CGRectGetMidX(indentedBounds), CGRectGetMaxY(indentedBounds), cornerRadius);
        CGPathAddArcToPoint(pathRef, nil, CGRectGetMaxX(indentedBounds), CGRectGetMaxY(indentedBounds), CGRectGetMaxX(indentedBounds), CGRectGetMidY(indentedBounds), cornerRadius);
        CGPathAddLineToPoint(pathRef, nil, CGRectGetMaxX(indentedBounds), CGRectGetMinY(indentedBounds));
    }
    else { // a cell in the middle somewhere
        CGPathAddRect(pathRef, nil, indentedBounds);
        addSeparatorLine = YES;
    }
    newLayer.path = pathRef;
    CFRelease(pathRef);
    
    newLayer.fillColor = [UIColor whiteColor].CGColor;

    // cell shadow
    newLayer.masksToBounds = NO;

    newLayer.shadowOffset = CGSizeMake(0, 3);
    newLayer.shadowColor = [[UIColor blackColor] CGColor]; // TODO
    newLayer.shadowRadius = 2.0f;
    newLayer.shadowOpacity = 0.35f;
    newLayer.shadowPath = [[UIBezierPath bezierPathWithRoundedRect:indentedBounds cornerRadius:cornerRadius] CGPath];
    
    // create a new "background view" using this programmatically created layer
    UIView *roundedShadowView = [[UIView alloc] initWithFrame:indentedBounds];
    [roundedShadowView.layer insertSublayer:newLayer atIndex:0]; // rounded rect with shadow
    roundedShadowView.backgroundColor = nil;
    
    cell.backgroundView = roundedShadowView;
    
    // create a new "cell separator" view
//    if (addSeparatorLine == YES) {
//        CGFloat lineHeight = (1.0f / [UIScreen mainScreen].scale);
//        CGRect separatorRect = CGRectMake(CGRectGetMinX(indentedBounds)+5, indentedBounds.size.height-lineHeight, indentedBounds.size.width-5, lineHeight);
//        UIView *separatorView = [[UIView alloc] initWithFrame:separatorRect];
//        CALayer *lineLayer = [[CALayer alloc] init];
//        lineLayer.frame = separatorRect;
//        lineLayer.backgroundColor = [UIColor redColor].CGColor; // tableView.separatorColor.CGColor;
//        [separatorView.layer insertSublayer:lineLayer atIndex:0];
//        
//        [cell.backgroundView addSubview:separatorView];
//    }
    
//        // shadow: start
//        CALayer *layer = roundedShadowView.layer;
//        layer.masksToBounds = NO;
//        
//        layer.shadowOffset = CGSizeMake(0, 3);
//        layer.shadowColor = [[UIColor blackColor] CGColor]; // TODO
//        layer.shadowRadius = 2.0f;
//        layer.shadowOpacity = 0.35f;
//        layer.shadowPath = [[UIBezierPath bezierPathWithRoundedRect:indentedBounds cornerRadius:cornerRadius] CGPath];
//        
//        CGColorRef bColor = roundedShadowView.backgroundColor.CGColor;
//        roundedShadowView.backgroundColor = [UIColor whiteColor]; // @IC nil;
//        layer.backgroundColor = bColor;
//        // shadow: end
}

@end
