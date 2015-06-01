//
//  ComposeViewController.swift
//  Tumblr
//
//  Created by George Kedenburg on 5/27/15.
//  Copyright (c) 2015 GK3. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {
    
    var tabBar: TabBarViewController!
    
    @IBOutlet weak var button1: UIImageView!
    @IBOutlet weak var button2: UIImageView!
    @IBOutlet weak var button3: UIImageView!
    @IBOutlet weak var button4: UIImageView!
    @IBOutlet weak var button5: UIImageView!
    @IBOutlet weak var button6: UIImageView!
    
    
    var buttonOrigins: [CGPoint] = []
    var buttons = []
    var offScreenOffset = CGFloat(420)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.alpha = 0
        
        if buttons == []{
            buttons = [button2, button5, button3, button1, button4, button6]
            
            for (index, button) in enumerate(buttons){
                buttonOrigins.append(button.center)
                (button as! UIImageView).frame.origin.y += offScreenOffset
            }
            
        }
        
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        view.alpha = 0
        for (index, button) in enumerate(buttons){
            (button as! UIImageView).center = buttonOrigins[index]
            (button as! UIImageView).frame.origin.y += offScreenOffset
        }
        
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.view.alpha = 1
        })
        for (index, button) in enumerate(self.buttons){
            var animDelay = Float(index) * 0.05
            animDelay += 0.2
            UIView.animateWithDuration(0.4, delay: Double(animDelay), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: nil, animations: { () -> Void in
                (button as! UIImageView).center = self.buttonOrigins[index]
                }, completion: nil)
            
        }
    }
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        
    }
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismissCompose(sender: AnyObject) {
        
        UIView.animateWithDuration(0.4, delay: 0.25, options: nil, animations: { () -> Void in
            self.view.alpha = 0
            }) { (animated) -> Void in
                self.willMoveToParentViewController(nil)
                self.view.removeFromSuperview()
                self.removeFromParentViewController()
        }
        
        for (index, button) in enumerate(self.buttons){
            var animDelay = Float(index) * 0.03
            UIView.animateWithDuration(0.3, delay: Double(animDelay), usingSpringWithDamping: 40, initialSpringVelocity: 0, options: nil, animations: {
                
                (button as! UIImageView).center.y -= self.offScreenOffset
                
                }, completion: nil)
            
        }
        
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
