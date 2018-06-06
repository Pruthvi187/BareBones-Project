//
//  DHSActivityVC.m
//  BareBones
//
//  Created by Pruthvi Henly Onkar on 18/5/18.
//  Copyright © 2018 Pruthvi Henly Onkar. All rights reserved.
//

#import "DHSActivityVC.h"
#import "DHSColorPool.h"
#import "DHSAppointmentModalVC.h"

static NSString *activityText = @"Advise non-lodgement of tax return";
static NSString *activityDetailText = @"Your tax return is due soon and we need to know if you are lodging a tax return for this financial year.\n You may not be required to lodge a tax return if your income is below the tax-free threshold.\nThis applies to 2017 - 2018 Financial Year ";
static NSString *nextAppointmentText = @"Next Appointment";

@protocol DHSRemoveModalVCDelegate;

@interface DHSActivityVC ()
@property (weak, nonatomic) IBOutlet UILabel *activitylabel;
@property (weak, nonatomic) IBOutlet UILabel *priorityLabel;
@property (weak, nonatomic) IBOutlet UIImageView *priorityIcon;
@property (weak, nonatomic) IBOutlet UILabel *taskActivityDetail;
@property (weak, nonatomic) IBOutlet UIView *defaultActivityModal;
@property (weak, nonatomic) IBOutlet UIView *containerView;

@property (nonatomic, strong) DHSAppointmentModalVC *appointmentModalVC;

@end

@implementation DHSActivityVC

#pragma mark - Lifecycle methods
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.view setBackgroundColor:[[DHSColorPool defaultColorPool] modalPopOverBGColor]];

    [self setUpViewDetails];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Methods to setup view and it's details.
- (void) setUpViewDetails {

    [self.activitylabel setText:activityText];
    [self.taskActivityDetail setText:activityDetailText];
    [self showOrHidePriorityMessage:YES withText:self.activitylabel.text];
}


- (void) showOrHidePriorityMessage:(BOOL) isHidden withText:(NSString *) priorityText{
    
    self.priorityIcon.hidden = isHidden;
    self.priorityLabel.textColor = isHidden ? [[DHSColorPool defaultColorPool] nonUrgentGrayColor] : [[DHSColorPool defaultColorPool] urgentRedColor];
    self.priorityLabel.text = priorityText;
}

#pragma mark - IBActions

- (IBAction)closeModal:(id)sender {
    
    if (_modalCloseDelegate && [_modalCloseDelegate respondsToSelector:@selector(removeModalVC)]) {
        [self removeAppointmentVC];
        [_modalCloseDelegate removeModalVC];
    }
    
}

//TODO : Implement these actions
- (IBAction)startTask:(id)sender {
}


- (IBAction)removeThisTask:(id)sender {
}

#pragma mark - Display Appointment Modal

- (void) toggleActivityModal:(BOOL)hidden {
    
    // Hide the default
    self.defaultActivityModal.hidden = hidden;
}

- (void) showAppointmentDetails {
    
    [self toggleActivityModal:YES];
    
    // Set up and add the new VC as a subview to the containerview
    self.appointmentModalVC = [DHSAppointmentModalVC new];
    [self.appointmentModalVC.view setFrame:CGRectMake(self.defaultActivityModal.bounds.origin.x, self.defaultActivityModal.bounds.origin.y, self.defaultActivityModal.bounds.size.width, self.defaultActivityModal.bounds.size.height + 80)];
    [self addChildViewController:self.appointmentModalVC];
    [self.appointmentModalVC didMoveToParentViewController:self];
    [self.activitylabel setText:nextAppointmentText];
    [self.containerView addSubview:self.appointmentModalVC.view];
    
}

- (void) removeAppointmentVC {
    
    if (self.appointmentModalVC != nil) {
        
        [self.appointmentModalVC willMoveToParentViewController:nil];
        [self.appointmentModalVC.view removeFromSuperview];
        [self.appointmentModalVC removeFromParentViewController];
        self.appointmentModalVC = nil;
    }
}


@end
