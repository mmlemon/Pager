//
//  PagerViewController.h
//  Pager
//
//  Created by mmlemon on 09/11/28.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <math.h>
#import "TCPSendClient.h"

@class TCPSendClient;

@interface PagerViewController : UIViewController<UIAccelerometerDelegate> {
	IBOutlet UIButton *btn;
	IBOutlet UIButton *prevBtn;
	IBOutlet UIButton *playBtn;
	IBOutlet UIButton *gestureBtn;
	IBOutlet UITextField *stateField;
	IBOutlet UISwitch *connectSwitch;
	TCPSendClient *sendc;
	NSString *dir;
	float prevValue;
	BOOL isPress;
	float prevTime;
}

@property(nonatomic, retain) IBOutlet UIButton *btn;
@property(nonatomic, retain) IBOutlet UIButton *gestureBtn;
@property(nonatomic, retain) IBOutlet UIButton *prevBtn;
@property(nonatomic, retain) IBOutlet UIButton *playBtn;
@property(nonatomic, retain) IBOutlet UITextField *stateField;
@property(nonatomic, retain) IBOutlet UISwitch *connectSwitch;

-(IBAction) btnDown:(id)sender;
-(IBAction) btnUp:(id)sender;

-(IBAction) processConnect:(id)sender;

@end

