//
//  DHSActivityVC.h
//  BareBones
//
//  Created by Pruthvi Henly Onkar on 18/5/18.
//  Copyright © 2018 Pruthvi Henly Onkar. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DHSRemoveModalVCDelegate<NSObject>
-(void) removeModalVC;
@end

@interface DHSActivityVC : UIViewController

@property (weak, nonatomic) id<DHSRemoveModalVCDelegate> modalCloseDelegate;

// Methods to display appointment details VC as a modal
- (void) showAppointmentDetails;
- (void) showMissedAppointmentDetails;

@end
