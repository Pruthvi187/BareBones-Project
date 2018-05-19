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

#pragma mark - TableView Setup Methods

- (void) setUpTableView {
    [self.tView registerNib:[UINib nibWithNibName:@"DHSPaymentsCell" bundle:[NSBundle bundleForClass:[DHSLandingVC class]]] forCellReuseIdentifier:@"paymentscell"];
    
    [self.tView registerNib:[UINib nibWithNibName:@"DHSTaskCell" bundle:[NSBundle bundleForClass:[DHSLandingVC class]]] forCellReuseIdentifier:@"taskcell"];

    [self.tView registerNib:[UINib nibWithNibName:@"DHSAppointmentCell" bundle:[NSBundle bundleForClass:[DHSLandingVC class]]] forCellReuseIdentifier:@"appointmentcell"];

    [self.tView registerNib:[UINib nibWithNibName:@"DHSFrequentlyUsedCell" bundle:[NSBundle bundleForClass:[DHSLandingVC class]]] forCellReuseIdentifier:@"frequentlyusedcell"];
    
    self.listDelegate = [DHSLandingListDelegate new];
    self.tView.dataSource = self.listDelegate;
    self.tView.delegate = self.listDelegate;
    
    [self.tView reloadData];
    
}

@end
