//
//  SecondViewController.h
//  guesterEx
//
//  Created by Katie Yun on 2013. 11. 4..
//  Copyright (c) 2013년 Katie Yun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "TickleGestureRecognizer.h"
#import "DragView2.h"

@interface SecondViewController : UIViewController<UIGestureRecognizerDelegate>

@property (strong) AVAudioPlayer * hehePlayer;
@property (retain, nonatomic) UIButton *backButton;

- (void)handleTickle:(TickleGestureRecognizer *)recognizer;

@end
