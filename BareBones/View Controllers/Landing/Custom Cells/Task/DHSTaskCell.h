//
//  DHSTaskCell.h
//  BareBones
//
//  Created by Ian Craigmile on 19/5/18.
//  Copyright © 2018 Pruthvi Henly Onkar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DHSTaskCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *taskImage;
@property (weak, nonatomic) IBOutlet UILabel *taskTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *taskDueLabel;
@property (weak, nonatomic) IBOutlet UIButton *viewTaskButton;

@end
