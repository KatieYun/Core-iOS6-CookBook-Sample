//
//  SecondViewController.m
//  guesterEx
//
//  Created by Katie Yun on 2013. 11. 4..
//  Copyright (c) 2013년 Katie Yun. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

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
    
    for (UIView * view in self.view.subviews) {
        
        // TODO: Add a custom gesture recognizer too
        TickleGestureRecognizer * recognizer2 = [[TickleGestureRecognizer alloc] initWithTarget:self action:@selector(handleTickle:)];
        recognizer2.delegate = self;
        [view addGestureRecognizer:recognizer2];
        
    }
    
    self.hehePlayer = [self loadWav:@"hehehe1"];
    [self.hehePlayer play];
    NSLog(@"bbbb");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) loadView {
    [super loadView];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self loadBackButton];
    NSString * sampleImageName = @"orangeFlower.png";
    DragView2 * dragView = [[DragView2 alloc] initWithImage:[UIImage imageNamed:sampleImageName]];
    
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

- (AVAudioPlayer *)loadWav:(NSString *)filename {
    NSURL * url = [[NSBundle mainBundle] URLForResource:filename withExtension:@"wav"];
    NSError * error;
    AVAudioPlayer * player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    if (!player) {
        NSLog(@"Error loading %@: %@", url, error.localizedDescription);
    } else {
        [player prepareToPlay];
    }
    return player;
}

//Guesture가 여려개일때 셋팅안해주면, 나중에 add된 recognizer는 씹힌다.;;;
//이미 dragview class에 UIGestureRecognizer 이놈이 하나 구현되어 있다.;;;
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

- (void)handleTickle:(TickleGestureRecognizer *)recognizer {
    [self.hehePlayer play];
}

-(void) backbuttonPressed {
    NSLog(@"SecondViewController.backbuttonPressed");
    [self.view removeFromSuperview];
}

@end
