//
//  ViewController.swift
//  jobApp
//
//  Created by Andres Barrios on 10/18/17.
//  Copyright © 2017 Andres Barrios. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase


var currentUser: User!


class ViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var email_txt: UITextField!
    @IBOutlet weak var password_txt: UITextField!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        self.email_txt.delegate = self
        self.password_txt.delegate = self

        checkFireBaseLogin()
        
        
    }
    
    //Function - Login Exiting Firebase user
    func loginFirebaseUser(){
        
        Auth.auth().signIn(withEmail: self.email_txt.text!, password: self.password_txt.text!) { (user, error) in
            if (error != nil){
                
                //Detect error upon logging in
                print("ERROR-2: Failed to login Firebase User", error!)
            
            } else {
                
                currentUser = user!
                
                //Detect successful user log in
                print("SUCCESS-2: Firebase user logged in succesfully!")
                
                
                self.performSegue(withIdentifier: "Login_to_HomeVC", sender: Any?.self) //send user to home vc
                
            }
        }
    }
    
    //Firebase user validity listener upon ViewDidLoad. Handles auto-login.
    func checkFireBaseLogin(){
        
        Auth.auth().addStateDidChangeListener { (auth, user) in
            if user != nil {
                
                //If a user is already logged in then send user to HomeVC
                self.performSegue(withIdentifier: "Login_to_HomeVC", sender: Any?.self)
                print ("User logged in already!")
                
            } else {
                
                print ("No user is logged in.")
            }
        }
        
    }
    
    @IBAction func loginFireBase(_ sender: Any) {
        
        loginFirebaseUser()
    
    }
    
    //Take new user to register page
    @IBAction func registerUserBtn(_ sender: Any) {
        
        performSegue(withIdentifier: "toCreateProfileVC", sender: Any?.self)
        
    }
    


    
}

