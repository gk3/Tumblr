//
//  TrendingViewController.swift
//  Tumblr
//
//  Created by George Kedenburg on 5/27/15.
//  Copyright (c) 2015 GK3. All rights reserved.
//

import UIKit

class TrendingViewController: UIViewController {

    @IBOutlet var trendingScroll: UIScrollView!
    @IBOutlet weak var trendingImage: UIImageView!
    @IBOutlet weak var loader: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        var images = UIImage.animatedImageNamed("loading-", duration: 0.5)
        loader.image = images
        trendingImage.alpha = 0
        
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        delay(1, { () -> () in
            UIView.animateWithDuration(0.2, animations: { () -> Void in
                self.loader.alpha = 0
            }, completion: { (animated) -> Void in
                UIView.animateWithDuration(0.2, animations: { () -> Void in
                    self.trendingImage.alpha = 1
                    }, completion: { (animated) -> Void in
                        self.trendingScroll.contentSize = self.trendingImage.image!.size
                })
                
            })
        })
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
