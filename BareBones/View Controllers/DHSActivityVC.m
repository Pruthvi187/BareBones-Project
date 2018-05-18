//
//  DHSActivityVC.m
//  BareBones
//
//  Created by Pruthvi Henly Onkar on 18/5/18.
//  Copyright © 2018 Pruthvi Henly Onkar. All rights reserved.
//

#import "DHSActivityVC.h"
#import "DHSColorPool.h"

@interface DHSActivityVC ()

@end

@implementation DHSActivityVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.view setBackgroundColor:[[DHSColorPool defaultColorPool] modalPopOverBGColor]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
