//
//  SettingsViewController.m
//  BareBones
//
//  Created by Alexander Jaroszewicz on 21/5/18.
//  Copyright © 2018 Pruthvi Henly Onkar. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tView;
@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView Setup Methods

//- (void) setUpTableView {
//    [self.tView registerNib:[UINib nibWithNibName:@"DHSOfficeLocatorCell" bundle:[NSBundle bundleForClass:[DHSOfficeLocatorVC class]]] forCellReuseIdentifier:@"officelocatorcell"];
//    self.listDelegate = [DHSOfficeLocatorListDelegate new];
//    self.tView.dataSource = self.listDelegate;
//    self.tView.delegate = self.listDelegate;
//    
//    [self.tView reloadData];
//    
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
