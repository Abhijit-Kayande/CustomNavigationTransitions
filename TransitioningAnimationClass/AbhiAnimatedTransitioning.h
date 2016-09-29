//
//  AbhiAnimatedTransitioning.h
//  AnimatedTransioning
//
//  Created by ABS on 11/12/14.
//  Copyright (c) 2014 ABS. All rights reserved.
//




#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,ABTransitionType){
    ABTransitionType1 = 1,
    ABTransitionType2,
    ABTransitionType3,
    ABTransitionType4,
    ABTransitionType5,
    ABTransitionType6,
    ABTransitionType7,
    ABTransitionType8,
};

@interface AbhiAnimatedTransitioning : NSObject <UIViewControllerAnimatedTransitioning>
{
    
    
    
}

@property (nonatomic) BOOL reverse;

@property (nonatomic) ABTransitionType Type;  //1 to 8

@property (nonatomic,strong) UIView *TransitionView;



@end
