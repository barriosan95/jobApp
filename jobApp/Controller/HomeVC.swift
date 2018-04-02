//
//  HomeVC.swift
//  jobApp
//
//  Created by Andres Barrios on 11/26/17.
//  Copyright © 2017 Andres Barrios. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    
    

    @IBOutlet weak var applyorpass: UIImageView!
    @IBOutlet weak var jobPost: UIView!
    @IBOutlet weak var companyLogo: UIImageView!
    @IBOutlet weak var jobPositionLabel: UILabel!
    @IBOutlet weak var jobLocationLabel: UILabel!
    
    var divisor : CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        divisor = (view.frame.width / 2) / 0.61
        
        //make round edges on view
        jobPost.layer.cornerRadius = 10.0
        jobPost.clipsToBounds = true
        jobPost.dropShadow()
        
        self.createJobCard()
        
        
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func panCard(_ sender: UIPanGestureRecognizer) {
        
        //Allow for card to move around
        let card = sender.view!
        let point = sender.translation(in: view)
        card.center = CGPoint(x:view.center.x + point.x, y: view.center.y + point.y)
        
        let xFromCenter = card.center.x - view.center.x

        
        card.transform = CGAffineTransform(rotationAngle: xFromCenter/divisor) //in radians
        
        
        if (xFromCenter > 0){
            //card dragged to right
            applyorpass.image = #imageLiteral(resourceName: "check mark.png")
            applyorpass.tintColor = UIColor.green
            
        } else {
            //card dragged to left
            applyorpass.image = #imageLiteral(resourceName: "x mark")
            applyorpass.tintColor = UIColor.red
            
        }
        
        applyorpass.alpha = abs(xFromCenter) / view.center.x
        
        
        //Reset card to center when released and continue animation off-screen
        if (sender.state == UIGestureRecognizerState.ended){
            
            if (card.center.x < 75){
                //Move to the left
                UIView.animate(withDuration: 0.3, animations: {
                    card.center = CGPoint(x: card.center.x - 200, y: card.center.y + 75)
                    card.alpha = 0
                    
                    
                })
                
                
                return
                
                
            } else if ( card.center.x > view.frame.width - 75){
                //Move right
                UIView.animate(withDuration: 0.3, animations: {
                    card.center = CGPoint(x: card.center.x + 200, y: card.center.y + 75)
                    card.alpha = 0
                    
                })
                
                return
                
            }
            
            resetCard()
        }
        
        
    }
    
    
    @IBAction func resetJobBtn(_ sender: Any) {
        resetCard()
    }
    @IBAction func seeJobInfoBtn(_ sender: Any) {
        performSegue(withIdentifier: "HomeVC_to_JobInfoVC", sender: Any?.self)
    }
    
    func resetCard(){
        UIView.animate(withDuration: 0.2) {
            self.jobPost.center = self.view.center
            self.applyorpass.alpha = 0
            self.jobPost.alpha = 1
            self.jobPost.transform = CGAffineTransform.identity
        }
    }
    
    func createJobCard(){
        
        let job = Job(jobTitle: "Software Engineer",companyName: "Bloomberg")
        job.job_City = "New York City"
        job.job_State = "NY"
        jobPositionLabel.text = job.job_Title
        jobLocationLabel.text = job.jobLocation(city: job.job_City!, state: job.job_State!)
        
    }
    
    
    //back to user profile vc
    @IBAction func leftSwipe(_ sender: UISwipeGestureRecognizer) {
        
        performSegue(withIdentifier: "HomeVC_to_UserProfileVC", sender: Any?.self)
    }
    
    
    


}
