//
//  InfoModalViewController.m
//  Chapter2
//
//  Created by Katie Yun on 2013. 11. 19..
//  Copyright (c) 2013년 Katie Yun. All rights reserved.
//

#import "InfoModalViewController.h"

@interface InfoModalViewController ()

@end

@implementation InfoModalViewController

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

-(void)loadView
{
    [super loadView];
    self.view.backgroundColor = [UIColor whiteColor];
	self.navigationController.navigationBar.tintColor = COOKBOOK_PURPLE_COLOR;
    self.navigationItem.rightBarButtonItem = BARBUTTON(@"Done", @selector(done:));
    
    self.title = @"Info";
}

-(void) done:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
