//
//  SegmentAppDelegate.m
//  Chapter2
//
//  Created by Katie Yun on 2013. 11. 19..
//  Copyright (c) 2013년 Katie Yun. All rights reserved.
//

#import "SegmentAppDelegate.h"
#import "SegmentViewController.h"
#define COOKBOOK_PURPLE_COLOR [UIColor colorWithRed:0.20392f green:0.19607f blue:0.61176f alpha:1.0f]

@implementation SegmentAppDelegate

-(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[UINavigationBar appearance] setTintColor:COOKBOOK_PURPLE_COLOR];
    
	self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	SegmentViewController *tbvc = [[SegmentViewController alloc] init];
    tbvc.title = @"Root";
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:tbvc];
    self.window.rootViewController = nav;
	[self.window makeKeyAndVisible];
    return YES;
}
@end
