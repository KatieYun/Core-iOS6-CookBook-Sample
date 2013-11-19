//
//  SegmentViewController.m
//  Chapter2
//
//  Created by Katie Yun on 2013. 11. 19..
//  Copyright (c) 2013년 Katie Yun. All rights reserved.
//

#import "SegmentViewController.h"

@interface SegmentViewController ()

@end

@implementation SegmentViewController

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

//UINavigationItem rightBarButtonItem의 action함수
-(void)push:(id)sender
{
    NSString *newTitle = [@"AA*BB*CC*DD" componentsSeparatedByString:@"*"][seg.selectedSegmentIndex];
    
    UIViewController *newController = [[SegmentViewController alloc] init];
    newController.title = newTitle;
    
    [self.navigationController pushViewController:newController animated:YES];
}

- (UILabel *) labelWithTitle: (NSString *) aTitle
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.text = aTitle;
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont fontWithName:@"Futura" size:IS_IPAD ? 18.0f : 12.0f];
    label.numberOfLines = 999;
    label.lineBreakMode = NSLineBreakByWordWrapping;
    
    return label;
}

-(void) loadView
{
    [super loadView];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem =  BARBUTTON(@"Push", @selector(push:));
    
    //A UISegmentedControl object is a horizontal control made of multiple segments
    seg = [[UISegmentedControl alloc] initWithItems:[@"AA*BB*CC*DD" componentsSeparatedByString:@"*"]];
    seg.selectedSegmentIndex = 0;
    [self.view addSubview:seg];
    
    PREPCONSTRAINTS(seg);
    CONSTRAIN(seg, @"H:|-[seg(>=0)]-|");
    CONSTRAIN(seg, @"V:|-100-[seg]");
    
    UILabel *label = [self labelWithTitle:@"Select Title for Pushed Controller"];
    [self.view addSubview:label];
    PREPCONSTRAINTS(label);
    CONSTRAIN(label, @"H:|-[label(>=0)]-|");
    CONSTRAIN(label, @"V:|-70-[label]");
}

@end
