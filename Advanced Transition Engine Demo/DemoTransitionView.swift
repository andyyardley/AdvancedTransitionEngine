//
//  DemoTransitionView.swift
//  Advanced Transition Engine
//
//  Created by Andy on 07/10/2015.
//  Copyright © 2015 niveusrosea. All rights reserved.
//

import UIKit

class DemoTransitionView: UIView, ATEAnimatedViewTransition
{

    func copyWithZone(zone: NSZone) -> AnyObject
    {
        let newCopy = DemoTransitionView()
        newCopy.backgroundColor = UIColor.greenColor()
        newCopy.frame = self.frame
        return newCopy;
    }
    
}
