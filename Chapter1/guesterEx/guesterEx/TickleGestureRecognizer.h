//
//  TickleGestureRecognizer.h
//  guesterEx
//
//  Created by Katie Yun on 2013. 11. 4..
//  Copyright (c) 2013년 Katie Yun. All rights reserved.
// http://www.raywenderlich.com/6567/
//

#import <UIKit/UIKit.h>
#import <UIKit/UIGestureRecognizerSubclass.h>

typedef enum {
    DirectionUnknown = 0,
    DirectionLeft,
    DirectionRight
} Direction;

@interface TickleGestureRecognizer : UIGestureRecognizer

@property (assign) int tickleCount;
@property (assign) CGPoint curTickleStart;
@property (assign) Direction lastDirection;

@end
