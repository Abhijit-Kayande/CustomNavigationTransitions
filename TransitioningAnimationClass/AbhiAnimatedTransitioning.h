//
//  AbhiAnimatedTransitioning.h
//  AnimatedTransioning
//
//  Created by ABS on 11/12/14.
//  Copyright (c) 2014 ABS. All rights reserved.
//




#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AbhiAnimatedTransitioning : NSObject <UIViewControllerAnimatedTransitioning>
{

    

}

@property (nonatomic) BOOL reverse;

@property (nonatomic) int Type;  //1 to 7

@property (nonatomic,strong) UIView *TransitionView;



@end
