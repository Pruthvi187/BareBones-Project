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

@end

@implementation DHSSignInVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[[DHSColorPool defaultColorPool] primaryColor]];
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
