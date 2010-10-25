//
//  PagerViewController.m
//  Pager
//
//  Created by mmlemon on 09/11/28.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "PagerViewController.h"

@implementation PagerViewController

@synthesize btn, gestureBtn, prevBtn, playBtn;
@synthesize stateField;
@synthesize connectSwitch;

-(IBAction) btnDown:(id)sender
{
	isPress = YES;
	prevValue = 0;
	dir = @"";
}
-(IBAction) btnUp:(id)sender
{
	isPress = NO;
	prevValue = 0;
	if( (UIButton*)sender == btn)
	{
		dir = @"prev";
		[sendc send:dir];
	}
	else if((UIButton*)sender == prevBtn) {
		dir = @"next";
		[sendc send:dir];
	}
	else if((UIButton*)sender == playBtn) {
		dir = @"play";
		[sendc send:dir];
	}
}

-(IBAction) processConnect:(id)sender
{
	if([connectSwitch isOn])
	{
		[sendc connect:@"10.0.2.1" toPort:43243];
		stateField.text = @"connect";
	}
	else 
	{
		[sendc close];
		stateField.text = @"disconnect";
	}

}

#pragma mark shake

-(void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration
{
	//NSLog(@"shake");
	if(!isPress)
	   {
		   return;
	   }
	if(acceleration.timestamp - prevTime < 1)
	{
		return;
	}
	BOOL shake = NO;
	//NSLog(@"x:%f, y:%f, z:%f, stamp:%d", acceleration.x, acceleration.y, acceleration.z, acceleration.timestamp);
	
	// zの動きで動作を決定する
	//if( abs(acceleration.z - prevValue) > 0.8)
	//{
	//NSLog(@"value:%f", (acceleration.z - prevValue));
	
		if(acceleration.z - prevValue > 1.5)
		{
			dir = @"prev";
			[sendc send:dir];
			NSLog(@"prev");
		}
		else if(acceleration.z - prevValue < -1.5)
		{
			dir = @"next";
			[sendc send:dir];
			NSLog(@"next");
		}
		 
		shake = YES;
	//}
	
	//dir = @"";
	prevValue = acceleration.z;
	prevTime = acceleration.timestamp;
	
}


/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	sendc = [[TCPSendClient alloc] init];
	[[UIAccelerometer sharedAccelerometer] setUpdateInterval:0.05];
	[[UIAccelerometer sharedAccelerometer] setDelegate:self];
	isPress = NO;
}





/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[connectSwitch release];
	[btn release];
	[prevBtn release];
	[playBtn release];
	[stateField release];
	[super dealloc];
}

@end
