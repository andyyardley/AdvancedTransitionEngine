//
//  ViewController.swift
//  Advanced Transition Engine Demo
//
//  Created by Andy on 05/10/2015.
//  Copyright © 2015 niveusrosea. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, ATEAnimatedViewControllerTransition
{

    @IBOutlet var testView: UIView!
    @IBOutlet var demoTransitionView: DemoTransitionView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func transitionViewLayoutForState(transitionState: ATETransitionState, percentage percantage: CGFloat)
    {
        var actualPercentage = percantage
        if (transitionState == .ForwardExit || transitionState == .ReverseExit)
        {
            actualPercentage = 1 - percantage
        }
        
        testView.transform = CGAffineTransformMakeTranslation(0, ((view.bounds.size.height + testView.bounds.size.height * 0.5) * (1.0 - actualPercentage)))
        
        view.backgroundColor = UIColor.blueColor().colorWithAlphaComponent(actualPercentage);
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
        if let view = keysAndTransitionViews["DemoView"] as? DemoTransitionView
        {
            demoTransitionView = view
            self.view.addSubview(view)
        }
    }
    
    func frameforTransitionViewWithKey(key: String) -> CGRect
    {
        return CGRectMake(0, 64, 320, 60)
    }
    
}