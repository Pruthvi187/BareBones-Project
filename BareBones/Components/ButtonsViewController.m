//
//  ButtonsViewController.m
//  BareBones
//
//  Created by Alexander Jaroszewicz on 22/5/18.
//  Copyright © 2018 Pruthvi Henly Onkar. All rights reserved.
//

#import "ButtonsViewController.h"
#import "DHSColorPool.h"

@interface ButtonsViewController ()

@end

@implementation ButtonsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [DHSColorPool defaultColorPool].primaryColor;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
