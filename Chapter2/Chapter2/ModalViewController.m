//
//  ModalViewController.m
//  Chapter2
//
//  Created by Katie Yun on 2013. 11. 19..
//  Copyright (c) 2013년 Katie Yun. All rights reserved.
//

#import "ModalViewController.h"

@interface ModalViewController ()

@end

@implementation ModalViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) action: (id) sender
{
    // Load info controller from storyboard
//    NSString *sourceName = IS_IPAD ? @"Modal~iPad" : @"Modal~iPhone";
//    UIStoryboard *sb = [UIStoryboard storyboardWithName:sourceName bundle:[NSBundle mainBundle]];
//    UINavigationController *navController = [sb instantiateViewControllerWithIdentifier:@"infoNavigationController"];
    InfoModalViewController *imvc = [[InfoModalViewController alloc] init];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:imvc];
    
    // Select the transition style
	int styleSegment = [(UISegmentedControl *)self.navigationItem.titleView selectedSegmentIndex];
	int transitionStyles[4] = {UIModalTransitionStyleCoverVertical, UIModalTransitionStyleCrossDissolve, UIModalTransitionStyleFlipHorizontal, UIModalTransitionStylePartialCurl};
	navController.modalTransitionStyle = transitionStyles[styleSegment];
	
	// Select the presentation style for iPad only
	if (IS_IPAD)
	{
        //        UISegmentedControl* uc = (UISegmentedControl *)Mㅡ[[self.view subviews] lastObject];
        NSLog(@"%@", [[self.view subviews] lastObject]);
        
//		int presentationSegment = [(UISegmentedControl *)[[self.view subviews] lastObject] selectedSegmentIndex];
        int presentationSegment = [(UISegmentedControl *)self.navigationItem.titleView selectedSegmentIndex];
        NSLog(@"%d", presentationSegment);
		int presentationStyles[3] = {UIModalPresentationFullScreen, UIModalPresentationPageSheet, UIModalPresentationFormSheet};
        
		if (navController.modalTransitionStyle == UIModalTransitionStylePartialCurl)
		{
			// Partial curl with any non-full screen presentation raises an exception
			navController.modalPresentationStyle = UIModalPresentationFullScreen;
			[(UISegmentedControl *)[[self.view subviews] lastObject] setSelectedSegmentIndex:0];
		}
		else
			navController.modalPresentationStyle = presentationStyles[presentationSegment];
	}
    
    [self.navigationController presentViewController:navController animated:YES completion:nil];
}

- (void) loadView
{
    [super loadView];
    self.view.backgroundColor = [UIColor whiteColor];
	self.navigationController.navigationBar.tintColor = COOKBOOK_PURPLE_COLOR;
    self.navigationItem.rightBarButtonItem = BARBUTTON(@"Action", @selector(action:));
    
	UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:[@"Slide Fade Flip Curl" componentsSeparatedByString:@" "]];
	segmentedControl.segmentedControlStyle = UISegmentedControlStyleBar;
	self.navigationItem.titleView = segmentedControl;
    
    if (IS_IPAD)
	{
		NSArray *presentationChoices = [NSArray arrayWithObjects:@"Full Screen", @"Page Sheet", @"Form Sheet", nil];
		UISegmentedControl *iPadStyleControl = [[UISegmentedControl alloc] initWithItems:presentationChoices];
		iPadStyleControl.segmentedControlStyle = UISegmentedControlStyleBar;
		iPadStyleControl.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        iPadStyleControl.center = CGPointMake(CGRectGetMidX(self.view.bounds), 22.0f);
		[self.view addSubview:iPadStyleControl];
	}
}


@end
