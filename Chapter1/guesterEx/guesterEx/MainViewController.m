//
//  MainViewController.m
//  guesterEx
//
//  Created by Katie Yun on 2013. 11. 4..
//  Copyright (c) 2013년 Katie Yun. All rights reserved.
//

#import "MainViewController.h"
#import "ViewController.h"
#import "SecondViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}


-(void) viewWillAppear:(BOOL)animated {
    viewController = [[ViewController alloc] init];
    secondViewController = [[SecondViewController alloc] init];
////    self.navigationController.title = @"Chapter01";
//    [self.navigationItem setTitle:@"뒤로"];
//    NSLog(@"%@", self.navigationItem.title);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) loadView {
    [super loadView];
    self.title = @"Chapter01";
}

-(IBAction)btn1Clicked {
    [self.navigationController pushViewController:viewController animated:TRUE];
}

-(IBAction)btn2Clicked {
    [self.navigationController pushViewController:secondViewController animated:TRUE];
}


@end
