//
//  PagerAppDelegate.h
//  Pager
//
//  Created by mmlemon on 09/11/28.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PagerViewController;

@interface PagerAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    PagerViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet PagerViewController *viewController;

@end

