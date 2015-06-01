//
//  TabBarViewController.swift
//  Tumblr
//
//  Created by George Kedenburg on 5/27/15.
//  Copyright (c) 2015 GK3. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController {
    
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var homeBtn: UIButton!
    @IBOutlet weak var searchBtn: UIButton!
    @IBOutlet weak var composeBtn: UIButton!
    @IBOutlet weak var accountBtn: UIButton!
    @IBOutlet weak var trendingBtn: UIButton!
    @IBOutlet weak var exploreNag: UIImageView!
    
    var homeViewController: HomeViewController!
    var searchViewController: SearchViewController!
    var composeViewController: ComposeViewController!
    var accountViewController: AccountViewController!
    var trendingViewController: TrendingViewController!
    
    var tabBtns = []
    var destinations = []
    
    var hasExplored = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBtns = [homeBtn, searchBtn, composeBtn, accountBtn, trendingBtn]
        
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        homeViewController = storyboard.instantiateViewControllerWithIdentifier("HomeViewController") as! HomeViewController
        searchViewController = storyboard.instantiateViewControllerWithIdentifier("SearchViewController") as! SearchViewController
        composeViewController = storyboard.instantiateViewControllerWithIdentifier("ComposeViewController") as! ComposeViewController
        accountViewController = storyboard.instantiateViewControllerWithIdentifier("AccountViewController") as! AccountViewController
        trendingViewController = storyboard.instantiateViewControllerWithIdentifier("TrendingViewController") as! TrendingViewController
        
        
        destinations = [homeViewController, searchViewController, composeViewController, accountViewController, trendingViewController]
        
        for destination in destinations{
            if destination is ComposeViewController{
                
            } else {
                (destination as! UIViewController).view.frame = self.contentView.bounds
            }
            
        }
        
        addChildViewController(homeViewController)
        self.contentView.addSubview(homeViewController.view)
        homeViewController.didMoveToParentViewController(self)
        
        homeBtn.selected = true
        
        UIView.animateWithDuration(1.0, delay:0, options: .Repeat | .Autoreverse, animations: {
            
            
            self.exploreNag.center.y += 5
            
            }, completion: nil)
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func changeTab(sender: UIButton) {
        //for (index, element) in enumerate(list)
        sender.selected = true
        
        if sender == composeBtn{
            composeViewController.view.hidden = false
            addChildViewController(composeViewController)
            self.view.addSubview(composeViewController.view)
            composeViewController.didMoveToParentViewController(self)
        } else {
            for (index, button) in enumerate(tabBtns){
                let destination = destinations[index] as! UIViewController
                if (button as! UIButton) == sender{
                    destination.view.hidden = false
                    addChildViewController(destination)
                    self.contentView.addSubview(destination.view)
                    destination.didMoveToParentViewController(self)
                    
                } else{
                    (button as! UIButton).selected = false
                    destination.view.hidden = true
                }
            }
        }
        
        if sender == searchBtn{
            exploreNag.hidden = true
        } else if sender != composeBtn {
            exploreNag.hidden = false
        }
        
        
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent;
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
