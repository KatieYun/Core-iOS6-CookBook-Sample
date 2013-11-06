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
//    UINavigationItem *backBtn = [[UINavigationItem alloc] initWithTitle:@"뒤로"];
//    [self.navigationItem.backBarButtonItem setTitle:@"aaaaa"];
//    NSLog(@"%@", [self.navigationItem rightBarButtonItems]);
}

-(void) viewWillAppear:(BOOL)animated {

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

- (CGPoint) randomFlowerPosition
{
    CGFloat halfFlower = 32.0f; // half of the size of the flower
    
    // The flower must be placed fully within the view. Inset accordingly
    CGSize insetSize = CGRectInset(self.view.bounds, 2*halfFlower, 2*halfFlower).size;
    
    // Return a random position within the inset bounds
    CGFloat randomX = random() % ((int)insetSize.width) + halfFlower;
    CGFloat randomY = random() % ((int)insetSize.height) + halfFlower;
    NSLog(@"%f, %f", randomX, randomY);
    return CGPointMake(randomX, randomY);
}

- (void) layoutFlowers
{
    // Move every flower into a new random place
    [UIView animateWithDuration:0.3f animations: ^(){
        for (UIView *flowerDragger in self.view.subviews)
            flowerDragger.center = [self randomFlowerPosition];}];
}

-(void) loadDragView3
{
    NSString * sampleImageName = @"blueFlower.png";
//    DragView3 * dragView = [[DragView3 alloc] initWithImage:[UIImage imageNamed:sampleImageName]];
//    
//    [self.view addSubview:dragView];
    
    
    
    for (int i = 0; i < 10; i++)
	{
		DragView3 *flowerDragger = [[DragView3 alloc] initWithImage:[UIImage imageNamed:sampleImageName]];
		[self.view addSubview:flowerDragger];
    }
}

-(void) loadBackButton {
    
    self.backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.backButton.backgroundColor = [UIColor yellowColor];
    
    [self.backButton setTitle:@"Back" forState:UIControlStateNormal];
    [self.backButton addTarget:self action:@selector(backbuttonPressed) forControlEvents:UIControlEventTouchUpInside];
    self.backButton.frame = CGRectMake(200, 400, 40, 24);
    [self.view addSubview:self.backButton];
}

- (void) viewDidAppear:(BOOL)animated
{
    [self layoutFlowers];
}

-(void) loadView
{
    [super loadView];   //안해주면 무한반복;;;;
    self.view.backgroundColor = [UIColor blackColor];
    self.title = @"Ex 01~07";
//    [[self.navigationItem backBarButtonItem] setTitle:@"뒤로"];
//    [self loadBackButton];
    
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
