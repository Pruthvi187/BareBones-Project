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

@interface ViewController ()<DHSRemoveModalVCDelegate>

@property (nonatomic, strong) DHSActivityVC *activityVC;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //Sample usage of the color pool.
    // TODO: Remove this when not needed.
    UIColor *primaryColor = [[DHSColorPool defaultColorPool] primaryColor];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    self.definesPresentationContext = YES;

}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    self.activityVC = [DHSActivityVC new];
    self.activityVC.modalCloseDelegate = self;
    [self.activityVC.view setFrame:self.view.bounds];
    [self addChildViewController:self.activityVC];
    [self.activityVC didMoveToParentViewController:self];
    
    [self.view addSubview:self.activityVC.view];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - DHSRemoveModalVC

-(void) removeModalVC {
    
    if (self.activityVC != nil) {
        
        [self.activityVC willMoveToParentViewController:nil];
        [self.activityVC.view removeFromSuperview];
        [self.activityVC removeFromParentViewController];
        self.activityVC = nil;
    }
    
}



@end
