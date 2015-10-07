//
//  ViewController.swift
//  Advanced Transition Engine Demo
//
//  Created by Andy on 05/10/2015.
//  Copyright © 2015 niveusrosea. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ATEAnimatedViewControllerTransition
{

    @IBOutlet var testView: UIView!
    
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
    
}