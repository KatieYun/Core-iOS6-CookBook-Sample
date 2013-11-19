//
//  Common.h
//  Chapter2
//
//  Created by Katie Yun on 2013. 11. 19..
//  Copyright (c) 2013년 Katie Yun. All rights reserved.
//

#ifndef Chapter2_Common_h
#define Chapter2_Common_h

#define COOKBOOK_PURPLE_COLOR [UIColor colorWithRed:0.20392f green:0.19607f blue:0.61176f alpha:1.0f]
#define BARBUTTON(TITLE, SELECTOR) [[UIBarButtonItem alloc] initWithTitle:TITLE style:UIBarButtonItemStylePlain target:self action:SELECTOR]

#define IS_IPAD	(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

#endif
