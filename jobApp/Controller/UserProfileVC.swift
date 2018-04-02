//
//  UserProfileVC.swift
//  jobApp
//
//  Created by Andres Barrios on 1/2/18.
//  Copyright © 2018 Andres Barrios. All rights reserved.
//

import UIKit
import Firebase

class UserProfileVC: UIViewController,UITableViewDataSource,UITableViewDelegate{

    

    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var university_name: UILabel!
    
    @IBOutlet weak var prefencesTableView: UITableView!
    
    var prefences = [String]()

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadPrefences()
        self.prefencesTableView.delegate = self
        self.prefencesTableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return prefences.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "PrefencesTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? PrefencesTableViewCell  else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        
        let preference = prefences[indexPath.row]
        
        cell.jobTitle.text = preference
        
        return cell
    }
    
    
    private func loadPrefences(){
        
        //possibly better to load data off the internet - API - instead of storing it here
        
        let pref1 = "Financial Analyst"
        let pref2 = "Software Engineer"
        let pref3 = "Software Assocciate"
        let pref4 = "Investment Banking Analyst"
        let pref5 = "Data Analytics - Analyst"
        
        prefences.append(pref1)
        prefences.append(pref2)
        prefences.append(pref3)
        prefences.append(pref4)
        prefences.append(pref5)
        
    }
    
    @IBAction func rightSwipe(_ sender: UISwipeGestureRecognizer) {
        
        performSegue(withIdentifier: "UserProfileVC_to_HomeVC", sender: Any?.self)
    }
    
    

    @IBAction func logOut(_ sender: Any) {
        
        do {
         try! Auth.auth().signOut()
            
        }
        
        
        performSegue(withIdentifier:"UserProfileVC_to_ViewController", sender: Any?.self)
    }
    
    
    
}
