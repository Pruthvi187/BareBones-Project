//
//  DHSTaskCell.m
//  BareBones
//
//  Created by Ian Craigmile on 19/5/18.
//  Copyright © 2018 Pruthvi Henly Onkar. All rights reserved.
//

#import "DHSTaskCell.h"
#import "Constants.h"

@implementation DHSTaskCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

#pragma mark - IBActions

- (IBAction)onViewTask:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIF_VIEW_TASK object:self];
}

@end
