//
//  BNRAppDelegate.h
//  XIBExample
//
//  Created by Joe Conway on 10/3/12.
//  Copyright (c) 2012 Big Nerd Ranch. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BNRViewController;

@interface BNRAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) BNRViewController *viewController;

@end
