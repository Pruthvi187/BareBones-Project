//
//  DHSAppointmentModalVC.m
//  BareBones
//
//  Created by Pruthvi Henly Onkar on 6/6/18.
//  Copyright © 2018 Pruthvi Henly Onkar. All rights reserved.
//

#import "DHSAppointmentModalVC.h"

static NSString *appointmentDate = @"Monday 11 December 2017";
static NSString *appointmentTime = @"2:00 PM";
static NSString *contantDetails = @"2-6 Bowes St, Woden ACT 2606";
static NSString *centrelinkName = @"Centrelink Woden";


@interface DHSAppointmentModalVC ()
@property (weak, nonatomic) IBOutlet UILabel *appointmentHeaderLabel;
@property (weak, nonatomic) IBOutlet UILabel *appointmentDetailsLabel;
@property (weak, nonatomic) IBOutlet UILabel *contantDetailsLabel;
@property (weak, nonatomic) IBOutlet UILabel *appointmentTimelabel;
@property (weak, nonatomic) IBOutlet UILabel *centrelinkNameLabel;
@property (weak, nonatomic) IBOutlet UIButton *btnMoreDetails;
@property (weak, nonatomic) IBOutlet UIButton *btnCancelAppointment;
@property (weak, nonatomic) IBOutlet UIButton *btnRescheduleAppointment;
@property (weak, nonatomic) IBOutlet UIButton *missedAppointmentButton;
@property (weak, nonatomic) IBOutlet UIButton *btnAddToCalendar;


@end

@implementation DHSAppointmentModalVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self addAppointmentDetails];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - IBActions

- (IBAction)addAppointmentToCalendar:(id)sender {
}

- (IBAction)rescheduleAppointment:(id)sender {
}

- (IBAction)cancelAppointment:(id)sender {
}

- (IBAction)viewMoreDetails:(id)sender {
}

#pragma mark - Add Appointment Details

- (void) addAppointmentDetails {
    
    [self.appointmentDetailsLabel setText:appointmentDate];
    [self.appointmentTimelabel setText:appointmentTime];
    [self.centrelinkNameLabel setText:centrelinkName];
    [self.contantDetailsLabel setText:contantDetails];
    
}

#pragma mark - Missed Appointment Details

- (void) showMissedAppointment {
    
    self.btnMoreDetails.hidden = YES;
    self.btnCancelAppointment.hidden = YES;
    self.btnAddToCalendar.hidden = YES;
    
    self.missedAppointmentButton.hidden = NO;
    
}






@end
