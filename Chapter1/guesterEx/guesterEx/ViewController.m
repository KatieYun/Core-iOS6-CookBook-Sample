//
//  ViewController.m
//  guesterEx
//
//  Created by Katie Yun on 2013. 11. 4..
//  Copyright (c) 2013년 Katie Yun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

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

-(void) loadDragView {
    NSString * sampleImageName = @"pinkFlower.png";
    DragView * dragView = [[DragView alloc] initWithImage:[UIImage imageNamed:sampleImageName]];
    [self.view addSubview:dragView];
}
-(void) loadDragView2 {
    NSString * sampleImageName = @"orangeFlower.png";
    DragView2 * dragView = [[DragView2 alloc] initWithImage:[UIImage imageNamed:sampleImageName]];
    [self.view addSubview:dragView];
}

-(void) loadTouchTrackerView {
    //addSubView하지않고 self.view에 자신을 할당함
    self.view = [[TouchTrackerView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
    [self.view setAutoresizingMask:UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth];
    self.view.backgroundColor = [UIColor whiteColor];   //안해주면 화면이 black으로 보여서 실행안된줄 속는다.;;
}

-(void) loadDragView3
{
    NSString * sampleImageName = @"blueFlower.png";
    DragView3 * dragView = [[DragView3 alloc] initWithImage:[UIImage imageNamed:sampleImageName]];
    [self.view addSubview:dragView];
}

-(void) loadBackButton {
    
    self.backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.backButton.backgroundColor = [UIColor yellowColor];
    
    [self.backButton setTitle:@"Back" forState:UIControlStateNormal];
    [self.backButton addTarget:self action:@selector(backbuttonPressed) forControlEvents:UIControlEventTouchUpInside];
    self.backButton.frame = CGRectMake(200, 400, 40, 24);
    [self.view addSubview:self.backButton];
}

-(void) loadView
{
    [super loadView];   //안해주면 무한반복;;;;
    self.view.backgroundColor = [UIColor whiteColor];
    [self loadBackButton];
    
    //1. 예제 1-1
//    [self loadDragView];
    //2. 예제 1-2
//    [self loadDragView2];
    
    //예제 1-7
//    [self loadTouchTrackerView];
    //예제 1-14
    [self loadDragView3];
    
}

-(void) backbuttonPressed {
    NSLog(@"backbuttonPressed");
    [self.view removeFromSuperview];
}

@end
