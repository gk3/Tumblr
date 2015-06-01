//
//  HomeViewController.swift
//  Tumblr
//
//  Created by George Kedenburg on 5/27/15.
//  Copyright (c) 2015 GK3. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var spinner: UIImageView!
    @IBOutlet weak var loginImage: UIImageView!
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var loginInput: UITextField!
    
    var loginViewOrigin: CGPoint!
    override func viewDidLoad() {
        super.viewDidLoad()
        var transform = CGAffineTransformMakeDegreeRotation(0)
        spinner.transform = transform
        UIView.animateWithDuration(4.0, delay:0, options: .Repeat | .CurveLinear, animations: {
            
           var transform = CGAffineTransformMakeDegreeRotation(180)
            self.spinner.transform = transform
            
            }, completion: nil)
        
        loginViewOrigin = loginView.center
        loginView.center.y += 420
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doLogin(sender: AnyObject) {
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.85, initialSpringVelocity: 0, options: nil, animations: { () -> Void in
            self.loginView.center = self.loginViewOrigin
        }, completion: nil)
        loginInput.becomeFirstResponder()
    }

    @IBAction func cancelLogin(sender: AnyObject) {
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.85, initialSpringVelocity: 0, options: nil, animations: { () -> Void in
            self.loginView.center.y += 420
            }, completion: nil)
        view.endEditing(true)
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
