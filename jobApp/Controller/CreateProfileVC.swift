//
//  CreateProfileVC.swift
//  jobApp
//
//  Created by Andres Barrios on 10/19/17.
//  Copyright © 2017 Andres Barrios. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

var ref: DatabaseReference!


class CreateProfileVC: UIViewController {

    @IBOutlet weak var email_signuptxt: UITextField!
    @IBOutlet weak var password_signuptxt: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //inititalize reference to database in Firebase
        ref = Database.database().reference()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func createFirebaseUser(){
        
        Auth.auth().createUser(withEmail:  self.email_signuptxt.text!, password: self.password_signuptxt.text!) { (user, error) in
            if ( error != nil){
                
                print("ERROR-1: Failed to create Firebase User")
                
                /*let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                 
                 let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                 alertController.addAction(defaultAction)
                 self.present(alertController, animated: true, completion: nil)
                 */
                
                
            } else {
                
                currentUser = user!
                
                print ("Success-1: New Firebase user account created!")
                
      
                ref?.child("Users").child((user?.uid)!).setValue(["Email": self.email_signuptxt.text!]) //user id sent to database and email is stored
                

                
                self.performSegue(withIdentifier: "CreateProfileVC_to_EditProfileVC", sender: Any?.self) // after user created send to edit profile vc
                
            }
        }
    }
    
    
    func requestlinkedInAuth(){
      
        LISDKSessionManager.createSession(withAuth: [LISDK_BASIC_PROFILE_PERMISSION], state: nil, showGoToAppStoreDialog: true, successBlock: { (returnState) -> Void in
            
            let session = LISDKSessionManager.sharedInstance().session
            let url = "https://api.linkedin.com/v1/people/~"
            if(LISDKSessionManager.hasValidSession()){
                
                LISDKAPIHelper.sharedInstance().getRequest(url, success: { (response) in
                    
                    print(response?.data as Any)
                    
                    self.performSegue(withIdentifier: "CreateProfileVC_to_EditProfileVC", sender: Any?.self)
                    
                }, error: { (error) in
                    print(error as Any)
                })
            }
            
        }){ (error) -> Void in
            print("Error: \(String(describing: error))")
        }
        
    }
    
    
    
    @IBAction func signUpLinkedIn(_ sender: Any) {

        requestlinkedInAuth()
        
    }
    
    @IBAction func signUpCreateUser(_ sender: Any) {
        
        createFirebaseUser()
        
    }
    
    
    

    
    
    
}
