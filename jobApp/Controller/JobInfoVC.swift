//
//  JobInfoVC.swift
//  jobApp
//
//  Created by Andres Barrios on 1/6/18.
//  Copyright © 2018 Andres Barrios. All rights reserved.
//

import UIKit

class JobInfoVC: UIViewController {

    @IBOutlet weak var companyLogo: UIImageView!
    
    //Handle color buttons

    
    @IBOutlet weak var xBtn: UIButton!
    @IBOutlet weak var checkBtn: UIButton!
    
    //Labels
    @IBOutlet weak var job_Title: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var post_Date: UILabel!
    
    //Text Views
    @IBOutlet weak var about_TextView: UITextView!
    @IBOutlet weak var expectations_TextView: UITextView!
    @IBOutlet weak var requirements_TextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //Hide status bar
        UIApplication.shared.isStatusBarHidden = true
        
        xBtn.imageView?.tintColor = UIColor.red
        checkBtn.imageView?.tintColor = UIColor.green
    
     
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func apply(_ sender: Any) {
        print("Applied")
    }
    
    @IBAction func dont_apply(_ sender: Any) {
        print("Not intertested")
        performSegue(withIdentifier: "JobInfoVC_to_HomeVC", sender: Any?.self)
    }
    
}
