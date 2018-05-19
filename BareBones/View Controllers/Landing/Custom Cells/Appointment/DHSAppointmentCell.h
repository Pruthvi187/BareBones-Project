//
//  DHSAppointmentCell.h
//  BareBones
//
//  Created by Ian Craigmile on 19/5/18.
//  Copyright © 2018 Pruthvi Henly Onkar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DHSAppointmentCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *appointmentTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *appointmentPlaceLabel;

@end
