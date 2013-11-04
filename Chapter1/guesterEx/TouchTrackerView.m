//
//  TouchTrackerView.m
//  guesterEx
//
//  Created by Katie Yun on 2013. 11. 4..
//  Copyright (c) 2013년 Katie Yun. All rights reserved.
//

#import "TouchTrackerView.h"

@implementation TouchTrackerView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.multipleTouchEnabled = NO;
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(void) drawRect:(CGRect)rect {
    [path stroke];
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    path = [UIBezierPath bezierPath];
    path.lineCapStyle = IS_IPAD? 8.0f : 4.0f;
    UITouch *touch = [touches anyObject];
    [path moveToPoint:[touch locationInView:self]];
}

-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
	[path addLineToPoint:[touch locationInView:self]];
	[self setNeedsDisplay];
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
//    UITouch *touch = [touches anyObject];
//	[path addLineToPoint:[touch locationInView:self]];
//	[self setNeedsDisplay];
    [self touchesMoved:touches withEvent:event];
}

-(void) touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    [self touchesEnded:touches withEvent:event];}

@end
