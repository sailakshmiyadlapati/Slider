//
//  ViewController.swift
//  AnimateConstraintsPriority
//
//  Created by MINI01 ACCELERON2 on 1/24/20.
//  Copyright © 2020 MINI01 ACCELERON2. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var blueView: UIView!
    @IBOutlet var RedView: UIView!
    @IBOutlet var OrangeView: UIView!
  
    @IBOutlet var blueViewLeading: NSLayoutConstraint!
    
    @IBOutlet var redViewLeading: NSLayoutConstraint!
    
    @IBOutlet var orangeViewTrailing: NSLayoutConstraint!
    
    @IBOutlet var blueViewRight: NSLayoutConstraint!
    
    var isLeftAligned = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func animateConstraints(){
         UIView.animate(withDuration: 0.8, animations: {
            // add and remove constraints
//                    if(self.isLeftAligned){
//                        self.view.removeConstraints([self.blueViewLeading, self.redViewLeading])
//                        self.view.addConstraints([self.orangeViewTrailing,self.blueViewRight])
//
//
//                    }
//                    else{
//                         self.view.removeConstraints([self.orangeViewTrailing,self.blueViewRight])
//                         self.view.addConstraints([self.blueViewLeading, self.redViewLeading])
//                    }
            self.blueViewLeading.priority = UILayoutPriority(rawValue: UILayoutPriority.RawValue((self.isLeftAligned) ? 1 : 999))
            print("\(self.blueViewLeading.priority)")
            self.redViewLeading.priority = UILayoutPriority(rawValue: UILayoutPriority.RawValue((self.isLeftAligned) ? 1 : 999))
            self.orangeViewTrailing.priority = UILayoutPriority(rawValue: UILayoutPriority.RawValue((self.isLeftAligned) ? 999 : 1))
            self.blueViewRight.priority = UILayoutPriority(rawValue: UILayoutPriority.RawValue(self.isLeftAligned ? 999 : 1))
            self.view.layoutIfNeeded()
                   })
                    
    }

    @IBAction func onButtonClick(_ sender: Any) {
        isLeftAligned = !isLeftAligned
        animateConstraints()
        
    }
    
}

