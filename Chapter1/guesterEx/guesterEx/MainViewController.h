//
//  MainViewController.h
//  guesterEx
//
//  Created by Katie Yun on 2013. 11. 4..
//  Copyright (c) 2013년 Katie Yun. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;
@class SecondViewController;


@interface MainViewController : UIViewController
{
    IBOutlet UIButton *btn1;
    IBOutlet UIButton *btn2;
    ViewController *viewController;
    SecondViewController *secondViewController;
}

//@property (retain, nonatomic) IBOutlet UIButton *btn1;
//@property (retain, nonatomic) IBOutlet UIButton *btn2;
-(IBAction)btn1Clicked;
-(IBAction)btn2Clicked;

@end
