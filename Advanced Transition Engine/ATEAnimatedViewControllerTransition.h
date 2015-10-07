//
//  ATEAnimatedViewControllerTransition.h
//  Advanced Transition Engine
//
//  Created by Andy on 06/10/2015.
//  Copyright © 2015 niveusrosea. All rights reserved.
//

#import <UIKit/UIKit.h>

#ifndef ATEAnimatedViewControllerTransition_h
#define ATEAnimatedViewControllerTransition_h

@protocol ATEAnimatedViewTransition;

typedef NS_ENUM(NSUInteger, ATETransitionState) {
    ATETransitionStateForwardEntry     = 0,
    ATETransitionStateForwardExit      = 1,
    ATETransitionStateReverseEntry     = 2,
    ATETransitionStateReverseExit      = 3
};

@protocol ATEAnimatedViewControllerTransition <NSObject>

@required

- (void)transitionViewLayoutForState:(ATETransitionState)transitionState percentage:(CGFloat)percantage;

@optional

- (nullable NSArray *)keysForViewsToTransition; // Called on the to view controller to establish which views in can receive
- (CGRect)frameforTransitionViewWithKey:(nonnull NSString *)key; // Called on the to view controller to get the final position of the transition views
- (nullable UIView<ATEAnimatedViewTransition> *)transitionViewForKey:(nonnull NSString *)key; // **Returns a copy** Called on the from view controller for each key supported by the to view controller
- (void)transitionViewsForKeys:(nonnull NSDictionary *)keysAndTransitionViews; // Called on the to view controller once all the available views have been collected from the from controller

@end

#endif /* ATEAnimatedViewControllerTransition_h */
