//
//  DHSPaymentsCell.h
//  BareBones
//
//  Created by Ian Craigmile on 19/5/18.
//  Copyright © 2018 Pruthvi Henly Onkar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DHSPaymentsCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lastPaymentAmountLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastPaymentSummaryLabel;
@property (weak, nonatomic) IBOutlet UILabel *nextPaymentAmountLabel;
@property (weak, nonatomic) IBOutlet UILabel *nextPaymentSummaryLabel;

@end
