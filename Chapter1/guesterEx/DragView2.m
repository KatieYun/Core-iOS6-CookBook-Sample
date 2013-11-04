//
//  DragView2.m
//  guesterEx
//
//  Created by Katie Yun on 2013. 11. 4..
//  Copyright (c) 2013년 Katie Yun. All rights reserved.
//

#import "DragView2.h"

@implementation DragView2

//- (id)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//        // Initialization code
//    }
//    return self;
//}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(id)initWithImage:(UIImage *)image {
    if (self = [super initWithImage:image])
    {
        self.userInteractionEnabled = YES; //user와의 interaction을 위해서는 반드시 YES여야 한다. 하위 view에도 영향을 미친다.
        //GestureRecognizer를 사용하면 touche handler를 사용하지 않고 user interaction을 구현할 수 있다.
        //PanGestureRecognizer는 drag gesture에 반응한다.
        UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
//        UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan2:)];
        
        self.gestureRecognizers = @[panRecognizer];
        
    }
    
    return self;
}
- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // Promote the touched view
    [self.superview bringSubviewToFront:self];
    
    // Remember original location
    previousLocation = self.center;
}
-(void)handlePan:(UIPanGestureRecognizer *) uigr {
    CGPoint translation = [uigr translationInView:self.superview];
    CGPoint newcenter = self.center = CGPointMake(previousLocation.x + translation.x, previousLocation.y + translation.y);

    //이동영역 제한 (부모 view의 경계값으로 설정) 예제 1-4
    float halfx = CGRectGetMidX(self.bounds);
	newcenter.x = MAX(halfx, newcenter.x);
	newcenter.x = MIN(self.superview.bounds.size.width - halfx, newcenter.x);
	
	float halfy = CGRectGetMidY(self.bounds);
	newcenter.y = MAX(halfy, newcenter.y);
	newcenter.y = MIN(self.superview.bounds.size.height - halfy, newcenter.y);

    self.center = newcenter;

}

-(void) handlePan2:(UIPanGestureRecognizer *) uigr {
    if(uigr.state == UIGestureRecognizerStateEnded) {
        CGPoint newCenter = CGPointMake(self.center.x + self.transform.tx, self.center.y + self.transform.ty);
        self.center = newCenter;
        CGAffineTransform theTransform = self.transform;
        theTransform.tx = 0.0f;
        theTransform.ty = 0.0f;
        self.transform = theTransform;
        return;
    }
    
    CGPoint translation = [uigr translationInView:self.superview];
    CGAffineTransform theTransform = self.transform;
    theTransform.tx = translation.x;
    theTransform.ty = translation.y;
    self.transform = theTransform;
}


@end
