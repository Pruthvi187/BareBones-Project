//
//  DHSSignInVC.m
//  BareBones
//
//  Created by Alexander Jaroszewicz on 18/5/18.
//  Copyright © 2018 Pruthvi Henly Onkar. All rights reserved.
//

#import "DHSSignInVC.h"
#import "DHSColorPool.h"
#import "DHSAocVC.h"

@interface DHSSignInVC ()
@property (weak, nonatomic) IBOutlet UILabel *welcomeLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *logoImage;
@property (weak, nonatomic) IBOutlet UIImageView *officeLocatorImage;
@property (weak, nonatomic) IBOutlet UIButton *signinButton;
@property (weak, nonatomic) IBOutlet UIButton *notYouButton;

@end

@implementation DHSSignInVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[[DHSColorPool defaultColorPool] primaryColor]];
    [self applyAccessibility];
    
}

- (void)applyAccessibility {
    // add accessibility to images
    self.logoImage.isAccessibilityElement = YES;
    self.logoImage.accessibilityValue = @"Express Plus Centrelink Logo";
    
    self.officeLocatorImage.isAccessibilityElement = YES;
    self.officeLocatorImage.accessibilityValue = @"Office Locator";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)signInButtonAction:(id)sender {
    DHSAocVC *aocVC = [DHSAocVC new];
    aocVC.modalTransitionStyle = UIModalPresentationPopover;
//    [self.navigationController pushViewController:aocVC animated:YES];
    [self presentViewController:aocVC animated:YES completion:nil];
    
}
- (IBAction)notYouButtonAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
