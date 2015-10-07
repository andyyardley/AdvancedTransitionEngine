//
//  FirstViewController.swift
//  Advanced Transition Engine
//
//  Created by Andy on 06/10/2015.
//  Copyright © 2015 niveusrosea. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, ATEAnimatedViewControllerTransition
{
    
    @IBOutlet var demoTransitionView: DemoTransitionView!
    
    func transitionViewLayoutForState(transitionState: ATETransitionState, percentage percantage: CGFloat)
    {
        
    }

    func transitionViewForKey(key: String) -> UIView?
    {
        if key == "DemoView"
        {
            return demoTransitionView
        }
        return nil
    }
    
    func keysForViewsToTransition() -> [AnyObject]?
    {
        return ["DemoView"]
    }
    
    func transitionViewsForKeys(keysAndTransitionViews: [NSObject : AnyObject])
    {
        guard let keysAndTransitionViews = keysAndTransitionViews as? [String: UIView] else
        {
            return
        }
        if let _ = keysAndTransitionViews["DemoView"] as? DemoTransitionView
        {
            demoTransitionView.hidden = false
        }
    }
    
    func frameforTransitionViewWithKey(key: String) -> CGRect
    {
        return demoTransitionView.frame
    }
    
}
