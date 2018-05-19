//
//  DHSFrequentlyUsedCell.h
//  BareBones
//
//  Created by Ian Craigmile on 19/5/18.
//  Copyright © 2018 Pruthvi Henly Onkar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DHSFrequentlyUsedCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *locationNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *streetAddressLabel;
@property (weak, nonatomic) IBOutlet UILabel *suburbAddressLabel;
@property (weak, nonatomic) IBOutlet UILabel *openDaysLabel;
@property (weak, nonatomic) IBOutlet UILabel *openAddressLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationDistanceLabel;


@end
