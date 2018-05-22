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

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpTableView];
    [self createCustomNavRightButtons];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(displayTaskAsModal:) name:NOTIF_VIEW_TASK object:nil];
}

- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver: self];
}

- (void)createCustomNavRightButtons {
    NSMutableArray* buttons = [[NSMutableArray alloc] initWithCapacity:3];
    UIBarButtonItem* bi;
    UIImage *img;
    
    img = [UIImage imageNamed:@"help"];
    bi = [[UIBarButtonItem alloc] initWithImage:img style:UIBarButtonItemStylePlain target:self action:@selector(helpPressed)];
    bi.tintColor = [UIColor whiteColor];
    [buttons addObject:bi];
    
    bi = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    [buttons addObject:bi];
    
    img = [UIImage imageNamed:@"setting"];
    bi = [[UIBarButtonItem alloc] initWithImage:img style:UIBarButtonItemStylePlain target:self action:@selector(settingPressed)];
    bi.tintColor = [UIColor whiteColor];
    [buttons addObject:bi];
    
    self.navigationItem.rightBarButtonItems = buttons;
}

-(void)helpPressed {}

-(void)settingPressed {}

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
    
    // TODO: populate UI - access the view model
    self.listDelegate.numTasks = 2;
    self.navigationItem.title = @"John Citizen";
    
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
