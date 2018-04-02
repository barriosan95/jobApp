//
//  Job.swift
//  jobApp
//
//  Created by Andres Barrios on 1/6/18.
//  Copyright © 2018 Andres Barrios. All rights reserved.
//

import Foundation
import UIKit



class Job {
    
    let job_Title : String?
    let company_Name : String?
    var job_Description : String?
    var company_Logo : UIImageView?
    var job_City : String?
    var job_State : String?
    var job_Location : String?
    
    //default constructor
    init(jobTitle:String,companyName:String){
        
        self.job_Title = jobTitle
        self.company_Name = companyName
        self.job_Description = ""
        self.company_Logo = nil;
        self.job_City = ""
        self.job_State = ""
        self.job_Location = jobLocation(city: self.job_City!, state: self.job_State!)
        
    }
    
    func jobLocation(city:String,state:String) -> String{
        
        self.job_Location = city + "," + state
        return job_Location!
        
    }
    
    
    
    
}
