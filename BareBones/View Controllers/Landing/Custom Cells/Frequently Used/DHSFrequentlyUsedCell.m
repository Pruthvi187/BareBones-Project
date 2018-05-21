//
//  DHSFrequentlyUsedCell.m
//  BareBones
//
//  Created by Ian Craigmile on 19/5/18.
//  Copyright © 2018 Pruthvi Henly Onkar. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "DHSFrequentlyUsedCell.h"

@implementation DHSFrequentlyUsedCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self populateButtons];
}

- (void)populateButtons {
    // self.button1.backgroundColor = [UIColor whiteColor];
    self.button1.layer.borderColor = [UIColor blackColor].CGColor;
    self.button1.layer.borderWidth = 1.0f;
    self.button1.layer.cornerRadius = 10;
    self.button1.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.button1.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.button1 setTitle:@"Upload\nDocuments" forState: UIControlStateNormal];
}

//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//
//    // Configure the view for the selected state
//}

#pragma mark - IBActions

//- (IBAction)startDirections:(id)sender {
//}

@end
