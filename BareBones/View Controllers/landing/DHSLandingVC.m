//
//  DHSLandingVC.m
//  BareBones
//
//  Created by Ian Craigmile on 19/5/18.
//  Copyright © 2018 Pruthvi Henly Onkar. All rights reserved.
//

#import "DHSLandingVC.h"
#import "DHSLandingListDelegate.h"

@interface DHSLandingVC ()
@property (weak, nonatomic) IBOutlet UITableView *tView;
@property (nonatomic, strong) DHSLandingListDelegate *listDelegate;

@end

@implementation DHSLandingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setUpTableView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView Setup Methods

- (void) setUpTableView {
    [self.tView registerNib:[UINib nibWithNibName:@"DHSPaymentsCell" bundle:[NSBundle bundleForClass:[DHSLandingVC class]]] forCellReuseIdentifier:@"paymentscell"];
    self.listDelegate = [DHSLandingListDelegate new];
    self.tView.dataSource = self.listDelegate;
    self.tView.delegate = self.listDelegate;
    
    [self.tView reloadData];
    
}

@end
