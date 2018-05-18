//
//  ViewController.m
//  BareBones
//
//  Created by Pruthvi Henly Onkar on 18/5/18.
//  Copyright © 2018 Pruthvi Henly Onkar. All rights reserved.
//

#import "ViewController.h"
#import "DHSColorPool.h"
#import "DHSActivityVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //Sample usage of the color pool.
    // TODO: Remove this when not needed.
    UIColor *primaryColor = [[DHSColorPool defaultColorPool] primaryColor];
    [self.view setBackgroundColor:primaryColor];
    
    self.definesPresentationContext = YES;

}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    DHSActivityVC *activityVC = [DHSActivityVC new];
    activityVC.modalTransitionStyle = UIModalPresentationOverCurrentContext;
    [self presentViewController:activityVC animated:true completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
