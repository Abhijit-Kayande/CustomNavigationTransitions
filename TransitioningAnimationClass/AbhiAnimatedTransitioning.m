//
//  AbhiAnimatedTransitioning.m
//  AnimatedTransioning
//
//  Created by ABS on 11/12/14.
//  Copyright (c) 2014 ABS. All rights reserved.
//



#import "AbhiAnimatedTransitioning.h"

static NSTimeInterval const AnimationDuration = 0.7f;


@implementation AbhiAnimatedTransitioning

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
 
    
    [self TransitionsWithContext:transitionContext];
    
    
}

-(void)TransitionsWithContext:(id<UIViewControllerContextTransitioning>)transitionContext
{

    
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *container = [transitionContext containerView];
    
    
    [fromViewController.view setClipsToBounds:YES];
    
    [toViewController.view setClipsToBounds:YES];
    
    [container setClipsToBounds:YES];
    
    
    
    
    switch (_Type) {
        case ABTransitionType1:
        {
            
            if (!self.reverse) {
                
                [toViewController.view setFrame:_TransitionView.frame];
                
                [toViewController.view setBackgroundColor:_TransitionView.backgroundColor];
                
                [container addSubview:toViewController.view];
                
                
                
            }
            else
            {
                
                [container insertSubview:toViewController.view belowSubview:fromViewController.view];
                
                
            }
            
            
            
            [UIView animateWithDuration:0.3 animations:^{
                
                if (!self.reverse) {
                    
                    [toViewController.view setFrame:[[UIScreen mainScreen] bounds]];
                }
                else
                {
                    
                    [fromViewController.view setFrame:_TransitionView.frame];
                    
                }
                
                
            } completion:^(BOOL finished){
                
                
                [transitionContext completeTransition:finished];
                
                
                
            }];
            
            break;
        }
        case ABTransitionType2:
        {
            
            CGFloat travelDistance = [transitionContext containerView].bounds.size.width + 50;
            
            
            CATransform3D Rotate = CATransform3DMakeRotation(M_PI, 0, 1, 0);
            
            
            CATransform3D Slide = CATransform3DMakeTranslation(!_reverse ? travelDistance : -travelDistance, 0, 0);
            
            
            
            
            CATransform3D Transform = CATransform3DConcat(Rotate, Slide);
            
            
            Transform.m34=_reverse? 0.01 : -0.01;
            
            
            
            
            
            
            
            [container addSubview:toViewController.view];
            
            
            toViewController.view.layer.transform = CATransform3DInvert(Transform);
            
            fromViewController.view.layer.transform = CATransform3DIdentity;
            
            
            if (!_reverse) {
                [toViewController.view setBackgroundColor:_TransitionView.backgroundColor];
            }
            
            
            [UIView animateWithDuration:[self transitionDuration:transitionContext]+1 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0.2 options:0x00 animations:^{
                
                
                fromViewController.view.layer.transform = CATransform3DInvert(Slide);
                
                toViewController.view.layer.transform = CATransform3DIdentity;
                
            } completion:^(BOOL finished) {
                
                fromViewController.view.layer.transform = CATransform3DIdentity;
                
                [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
            }];

            
            break;
        }
        case ABTransitionType3:
        {
            
            //CGFloat travelDistance = [transitionContext containerView].bounds.size.width + 50;
            
            
            CATransform3D Rotate = CATransform3DMakeRotation(M_PI, 0, 1, 0);
            
            
//            CATransform3D Slide = CATransform3DMakeTranslation(_reverse ? travelDistance : -travelDistance, 0, 0);
            
            
//            CATransform3D Scale = CATransform3DMakeScale(-1, 1, 1);
            
            
            
            CATransform3D Transform = Rotate;
            
            
            Transform.m34=_reverse? 0.01 : -0.01;
            
            
            
            
            if (!_reverse) {
                [toViewController.view setBackgroundColor:_TransitionView.backgroundColor];
            }
            
            
            [container addSubview:toViewController.view];
            
            
            toViewController.view.layer.transform = CATransform3DInvert(Transform);
            
            toViewController.view.alpha = 0;
            
            
            
            [UIView animateWithDuration:[self transitionDuration:transitionContext]+1 delay:0 usingSpringWithDamping:1.0 initialSpringVelocity:0.2 options:0x00 animations:^{
                
                fromViewController.view.alpha = 0;
                toViewController.view.alpha = 1;
                fromViewController.view.layer.transform = Transform;
                
                toViewController.view.layer.transform = CATransform3DIdentity;
                
            } completion:^(BOOL finished) {
                
                fromViewController.view.layer.transform = CATransform3DIdentity;
                
                [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
            }];

            
            break;
        }
        case ABTransitionType4:
        {
            
            if (self.reverse) {
                [container insertSubview:toViewController.view belowSubview:fromViewController.view];
            }
            else {
                toViewController.view.transform = CGAffineTransformMake(1, 0, 0, 0, 0, 0);
                
                [toViewController.view setBackgroundColor:_TransitionView.backgroundColor];
                
                [container addSubview:toViewController.view];
            }
            
            
            
            [UIView animateWithDuration:0.5 delay:0.2 usingSpringWithDamping:0.9 initialSpringVelocity:0.2 options:UIViewAnimationOptionAllowAnimatedContent animations:^{
                
                
                if (self.reverse) {
                    
                    [fromViewController.view setFrame:CGRectMake(fromViewController.view.frame.origin.x, fromViewController.view.frame.origin.y+(fromViewController.view.frame.size.height/2), fromViewController.view.frame.size.width, fromViewController.view.frame.size.height-(fromViewController.view.frame.size.height/2)*2)];
                    
                    //fromViewController.view.transform = CGAffineTransformMakeScale(0, 0);
                }
                else {
                    toViewController.view.transform = CGAffineTransformIdentity;
                }
                
            } completion:^(BOOL finished){
                
                
                [transitionContext completeTransition:finished];
                
            }];

            
            break;
        }
        case ABTransitionType5:
        {
            
            CGFloat travelDistance = [transitionContext containerView].bounds.size.width + 50;
            
            float angle = _reverse ? -3.14 : 3.14;
            CGAffineTransform Rotate = CGAffineTransformMakeRotation(angle);
            
            CGAffineTransform Slide = CGAffineTransformMakeTranslation (_reverse ? travelDistance : -travelDistance, 0);
            
            //Play With These Values
            //CGAffineTransform Make=CGAffineTransformMake(-1, 0, 0, 1, 0, 0);
            
            
            //Try Combinations From Above
            
            CGAffineTransform travel = CGAffineTransformConcat(Slide, Rotate);
            
            
            if (!_reverse) {
                [toViewController.view setBackgroundColor:_TransitionView.backgroundColor];
            }
            
            
            [container addSubview:toViewController.view];
            toViewController.view.alpha = 0;
            toViewController.view.transform = CGAffineTransformInvert (travel);
            
            
            
            [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 usingSpringWithDamping:1.0 initialSpringVelocity:0.2 options:0x00 animations:^{
                fromViewController.view.transform = travel;
                fromViewController.view.alpha = 0;
                toViewController.view.transform = CGAffineTransformIdentity;
                toViewController.view.alpha = 1;
            } completion:^(BOOL finished) {
                fromViewController.view.transform = CGAffineTransformIdentity;
                [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
            }];

            
            break;
        }
        case ABTransitionType6:
        {
            
            CGFloat travelDistance = [transitionContext containerView].bounds.size.height;
            
            
            
            
            CGAffineTransform Slide = CGAffineTransformMakeTranslation (0, _reverse ? travelDistance : -travelDistance);
            
            
            
            
            
            
            if (!_reverse) {
                [toViewController.view setBackgroundColor:_TransitionView.backgroundColor];
            }
            
            
            
            [container addSubview:toViewController.view];
            
            toViewController.view.transform = CGAffineTransformInvert (Slide);
            
            
            
            [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 usingSpringWithDamping:1.0 initialSpringVelocity:0.2 options:0x00 animations:^{
                fromViewController.view.transform = Slide;
                
                toViewController.view.transform = CGAffineTransformIdentity;
                
            } completion:^(BOOL finished) {
                fromViewController.view.transform = CGAffineTransformIdentity;
                [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
            }];

            
            break;
        }
            case ABTransitionType7:
        {
            
            CGFloat travelDistance = [transitionContext containerView].bounds.size.width + 50;
            
            
            
            
            CGAffineTransform Slide = CGAffineTransformMakeTranslation (_reverse ? travelDistance : -travelDistance, 200);
            
            
            
            
            
            
            if (!_reverse) {
                [toViewController.view setBackgroundColor:_TransitionView.backgroundColor];
            }
            
            
            
            [container addSubview:toViewController.view];
            
            toViewController.view.transform = CGAffineTransformInvert (Slide);
            
            
            
            [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 usingSpringWithDamping:1.0 initialSpringVelocity:0.2 options:0x00 animations:^{
                fromViewController.view.transform = Slide;
                
                toViewController.view.transform = CGAffineTransformIdentity;
               
            } completion:^(BOOL finished) {
                fromViewController.view.transform = CGAffineTransformIdentity;
                [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
            }];
        
        
            break;
        }
            
        case ABTransitionType8:
        {
            
            //Make Small
            
            CGAffineTransform scale = CGAffineTransformMakeScale(0.9, 0.9);
            
            [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:0.2 options:0x00 animations:^{
                
                toViewController.view.transform = scale;
                
                fromViewController.view.transform = scale;
                
            } completion:^(BOOL finished) {
                
                //Make Transition
                
                
                
                CGFloat travelDistance = [transitionContext containerView].bounds.size.width;
                
                
                
                
                CGAffineTransform Slide = CGAffineTransformMakeTranslation (_reverse ? travelDistance : -travelDistance, 0);
                
                
                
                
                
                
                if (!_reverse) {
                    [toViewController.view setBackgroundColor:_TransitionView.backgroundColor];
                }
                
                
                
                [container addSubview:toViewController.view];
                
                toViewController.view.transform = CGAffineTransformInvert (Slide);
                
                [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:0.2 options:0x00 animations:^{
                    fromViewController.view.transform = Slide;
                    
                    toViewController.view.transform = CGAffineTransformIdentity;
                    
                } completion:^(BOOL finished) {
                    fromViewController.view.transform = CGAffineTransformIdentity;
                    [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
                }];
                
                
                
            }];
            
            break;
        }
        default:
        {
            
            //Testing
            
            
            CGFloat travelDistance = [transitionContext containerView].bounds.size.width;
            
            
            
            
            CGAffineTransform Slide = CGAffineTransformMakeTranslation (_reverse ? travelDistance : -travelDistance, 0);
            
            
            
            
            
            
            if (!_reverse) {
                [toViewController.view setBackgroundColor:_TransitionView.backgroundColor];
            }
            
            
            
            [container addSubview:toViewController.view];
            
            toViewController.view.transform = CGAffineTransformInvert (Slide);
            
            
            
            [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 usingSpringWithDamping:1.0 initialSpringVelocity:0.2 options:0x00 animations:^{
                fromViewController.view.transform = Slide;
                
                toViewController.view.transform = CGAffineTransformIdentity;
                
            } completion:^(BOOL finished) {
                fromViewController.view.transform = CGAffineTransformIdentity;
                [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
            }];
            
            
            break;
            
            
            
            
        }
    }

}


- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return AnimationDuration;
}

@end
