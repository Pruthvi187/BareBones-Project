//
//  DHSOfficeLocatorVC.m
//  BareBones
//
//  Created by Pruthvi Henly Onkar on 18/5/18.
//  Copyright © 2018 Pruthvi Henly Onkar. All rights reserved.
//

#import "DHSOfficeLocatorVC.h"
#import "DHSOfficeLocatorListDelegate.h"

@interface DHSOfficeLocatorVC ()
@property (weak, nonatomic) IBOutlet UITableView *tView;
@property (nonatomic, strong) DHSOfficeLocatorListDelegate *listDelegate;

@end

@implementation DHSOfficeLocatorVC 

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
    [self.tView registerNib:[UINib nibWithNibName:@"DHSOfficeLocatorCell" bundle:[NSBundle bundleForClass:[DHSOfficeLocatorVC class]]] forCellReuseIdentifier:@"officelocatorcell"];
    self.listDelegate = [DHSOfficeLocatorListDelegate new];
    self.tView.dataSource = self.listDelegate;
    self.tView.delegate = self.listDelegate;
    
    [self.tView reloadData];
    
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
