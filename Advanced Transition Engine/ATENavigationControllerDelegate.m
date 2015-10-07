//
//  ATENavigationControllerDelegate.m
//  Advanced Transition Engine
//
//  Created by Andy on 06/10/2015.
//  Copyright © 2015 niveusrosea. All rights reserved.
//

#import "ATENavigationControllerDelegate.h"
#import "ATEAnimator.h"
#import "ATEInteractiveTransitioning.h"
#import "ATEAnimatedViewControllerTransition.h"

@implementation ATENavigationControllerDelegate

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    if ([toVC conformsToProtocol:@protocol(ATEAnimatedViewControllerTransition)] && [fromVC conformsToProtocol:@protocol(ATEAnimatedViewControllerTransition)])
    {
        ATEAnimator *animator = [ATEAnimator new];
        animator.forward = operation == UINavigationControllerOperationPush;
        return animator;
    }
    return nil;
}

//- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController
//{
//    return [ATEInteractiveTransitioning new];
//}

@end
