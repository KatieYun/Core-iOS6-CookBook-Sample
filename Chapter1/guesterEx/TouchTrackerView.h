//
//  TouchTrackerView.h
//  guesterEx
//
//  Created by Katie Yun on 2013. 11. 4..
//  Copyright (c) 2013년 Katie Yun. All rights reserved.
//

#import <UIKit/UIKit.h>
#define IS_IPAD	(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

@interface TouchTrackerView : UIView {
    UIBezierPath *path;
}

@end
