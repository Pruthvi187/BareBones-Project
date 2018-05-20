//
//  DHSLandingVC.m
//  BareBones
//
//  Created by Ian Craigmile on 19/5/18.
//  Copyright © 2018 Pruthvi Henly Onkar. All rights reserved.
//

#import "DHSLandingVC.h"
#import "DHSLandingListDelegate.h"
#import "DHSActivityVC.h"
#import "Constants.h"

@interface DHSLandingVC()<DHSRemoveModalVCDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tView;
@property (nonatomic, strong) DHSLandingListDelegate *listDelegate;
@property (nonatomic, strong) DHSActivityVC *activityVC;
@end

@implementation DHSLandingVC

//- (void)awakeFromNib {
//    [super awakeFromNib];UITabBarItem *customTab = [[UITabBarItem alloc] initWithTitle:@"Home" image:nil tag:0];
//    self.tabBarItem = customTab;
//    [super awakeFromNib];
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setUpTableView];
    
    self.navigationItem.title = @"John Citizen";
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(displayTaskAsModal:) name:NOTIF_VIEW_TASK object:nil];
}

- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver: self];
}

#pragma mark - Tasks

- (void) displayTaskAsModal: (NSNotification*) notification {
    self.activityVC = [DHSActivityVC new];
    self.activityVC.modalCloseDelegate = self;
    [self.activityVC.view setFrame:self.view.bounds];
    [self addChildViewController:self.activityVC];
    [self.activityVC didMoveToParentViewController:self];
    
    [self.view addSubview:self.activityVC.view];
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

#pragma mark - DHSRemoveModalVCDelegate

- (void) removeModalVC {
    if (self.activityVC != nil) {
        [self.activityVC willMoveToParentViewController:nil];
        [self.activityVC.view removeFromSuperview];
        [self.activityVC removeFromParentViewController];
        self.activityVC = nil;
    }
}

@end
