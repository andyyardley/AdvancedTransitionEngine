//
//  ATEAnimator.m
//  Advanced Transition Engine
//
//  Created by Andy on 06/10/2015.
//  Copyright © 2015 niveusrosea. All rights reserved.
//

#import "ATEAnimator.h"
#import <ATEAnimatedViewControllerTransition.h>

@interface ATEAnimator ()

@property (nonatomic, weak) UINavigationController *navigationController;

@end

@implementation ATEAnimator

//- (instancetype)init//(navigationController: UINavigationController)
//{
//    return [super init];
//   // super.init()
//   // self.navigationController = navigationController
//}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.3f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    
    UIViewController<ATEAnimatedViewControllerTransition> *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController<ATEAnimatedViewControllerTransition> *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    ATETransitionState fromState;
    ATETransitionState toState;
    
    if (self.forward)
    {
        fromState = ATETransitionStateForwardExit;
        toState = ATETransitionStateForwardEntry;
    }
    else
    {
        fromState = ATETransitionStateReverseExit;
        toState = ATETransitionStateReverseEntry;
    }
    
    [fromViewController transitionViewLayoutForState:fromState percentage:0.f];
    [toViewController transitionViewLayoutForState:toState percentage:0.f];
    
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIView *containerView = [transitionContext containerView];
    
    [containerView addSubview:fromView];
    
    if (!self.forward)
        [containerView insertSubview:toView atIndex:0];
    else
        [containerView addSubview:toView];
    
    /////
    
    if ([toViewController respondsToSelector:@selector(keysForViewsToTransition)] && [fromViewController respondsToSelector:@selector(transitionViewForKey:)])
    {
        NSArray *keyForViews = [toViewController keysForViewsToTransition];
        for (NSString *key in keyForViews)
        {
            UIView *originalTransitionView = [fromViewController transitionViewForKey:key];
            originalTransitionView.hidden = YES;
            UIView *transitionView = [originalTransitionView copy];
            [containerView addSubview:transitionView];
            [containerView bringSubviewToFront:transitionView];
            [transitionView removeConstraints:transitionView.constraints];
            transitionView.translatesAutoresizingMaskIntoConstraints = NO;
            if (transitionView)
            {
                CGRect finalFrame = [toViewController frameforTransitionViewWithKey:key];
                [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
                    transitionView.frame = finalFrame;
                    NSLog(@"%@", transitionView);
                } completion:^(BOOL finished) {
                    [transitionView removeFromSuperview];
                    [toViewController transitionViewsForKeys:@{key: transitionView}];
                }];
            }
        }
    }
    
    /////
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        [fromViewController transitionViewLayoutForState:fromState percentage:1.f];
        [toViewController transitionViewLayoutForState:toState percentage:1.f];
    } completion:^(BOOL finished) {
        [fromView removeFromSuperview];
        BOOL cancelled = [transitionContext transitionWasCancelled];
        [transitionContext completeTransition:(!cancelled)];
    }];
}

@end
