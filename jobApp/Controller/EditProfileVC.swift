//
//  EditProfileVC.swift
//  jobApp
//
//  Created by Andres Barrios on 1/1/18.
//  Copyright © 2018 Andres Barrios. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase



class EditProfileVC: UIViewController {
    
    @IBOutlet weak var profile_IMG: UIImageView!
    @IBOutlet weak var full_Name: UITextField!
    @IBOutlet weak var university_Name: UITextField!
    @IBOutlet weak var major_Name: UITextField!
    @IBOutlet weak var grad_Date: UIDatePicker!
    @IBOutlet weak var gpa: UITextField!
    @IBOutlet weak var contat_Number: UITextField!
    @IBOutlet weak var email: UITextField!
    
    
    var ref: DatabaseReference! //create a reference to Firebase Database
    var storage : StorageReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Do below upon loading view
        
        ref = Database.database().reference() //initialize database reference
        storage = Storage.storage().reference()
        
        print(currentUser.uid)
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //function to push user data to database
    func pushData(){
        
        let post = [
            "Full Name": full_Name.text!,
            "University": university_Name.text!,
            "Major(s)":   major_Name.text!,
            //"Email": email.text!
        ]
        
        self.ref.child("Users").child(currentUser.uid).setValue(post)
        
        
        
        
    }
    
    @IBAction func editPicBtn(_ sender: Any) {
        
        
    }
    
    @IBAction func backToUserProfileVC(_ sender: Any) {
        
        
        //only perform if the required fields are non-empty
        if (full_Name.text?.isEmpty == false && university_Name.text?.isEmpty == false && major_Name.text?.isEmpty == false && gpa.text?.isEmpty == false){
            pushData()
            performSegue(withIdentifier: "EditProfileVC_to_UserProfileVC", sender: Any?.self)
            
        } else {
            //throw an error
            print("Please fill out required fields")
        }
    }
}
