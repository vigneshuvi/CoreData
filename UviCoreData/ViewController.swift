//
//  ViewController.swift
//  UviCoreData
//
//  Created by Vignesh on 1/8/16.
//  Copyright © 2016 Vignesh Uvi. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet var logView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
     // MARK: - View Controller Action methods
    @IBAction func createAction() {
        createUser("Vignesh", city: "Theni")
    }
    
    @IBAction func fetchAction() {
        fetchUsers()
    }
    
    @IBAction func updateAction() {
        updateUser("Vignesh", city: "Chennai")
    }
    
    @IBAction func deleteAction() {
        deleteUser("Vignesh");
    }
        
    
    // MARK: - Core Data actions
    func createUser(name: String , city: String) {
        
        var User = [NSManagedObject]()
        
        // Get AppDelegate Object
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        // Get Managed Context Object with help of AppDelegate.
        let managedContext = appDelegate.managedObjectContext
        
        // Create Entity Description with your entity name.
        let entity =  NSEntityDescription.entityForName("User",
            inManagedObjectContext:managedContext)
        
        // Create Managed Objec with help of Entity and Managed Context.
        let userObj = NSManagedObject(entity: entity!,
            insertIntoManagedObjectContext: managedContext)
        
        // Set the value for your represent attributes.
        userObj.setValue(name, forKey: "name")
        userObj.setValue(city, forKey: "city")
        
        // Handle the Exception.
        do {
            try managedContext.save() // Save Mangaged Context
            User.append(userObj) // Append your managedObject to the Database.
            
            logView.text = "User record is added to local Database.";
            
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
    func fetchUsers () {
        // Initialize Fetch Request
        let fetchRequest = NSFetchRequest()
        
        // Get AppDelegate Object
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        // Get Managed Context Object with help of AppDelegate.
        let managedContext = appDelegate.managedObjectContext
        
        // Create Entity Description
        let entityDescription = NSEntityDescription.entityForName("User", inManagedObjectContext: managedContext)
        
        // Configure Fetch Request
        fetchRequest.entity = entityDescription
        
        do {
            let result = try managedContext.executeFetchRequest(fetchRequest)
            if (result.count > 0) {
                let userObj = result[0] as! NSManagedObject
                if let first = userObj.valueForKey("name"), last = userObj.valueForKey("city") {
                    let output :NSString =  "\(first) \(last)";
                    print(output)
                    logView.text = "User record is added to local Database. \n"+(output as String);
                }
                
            } else {
                logView.text = "No User records found in the local Database.";
            }
        } catch {
            let fetchError = error as NSError
            print("Error",fetchError)
        }
    }
    
    func updateUser(uname : NSString, city : NSString) {
        
        // Initialize Update Request
        let updateRequest = NSFetchRequest()
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        // Create Entity Description
        let entityDescription = NSEntityDescription.entityForName("User", inManagedObjectContext: managedContext)
        
        // Create Predicate to fetch exact value.
        let resultPredicate = NSPredicate(format: "name = %@", uname)
        
        // Configure Predicate with Update Request
        updateRequest.predicate = resultPredicate;
        
        // Configure Update Request
        updateRequest.entity = entityDescription
        
        do {
            let result = try managedContext.executeFetchRequest(updateRequest)
            if (result.count > 0) {
                let userObj = result[0] as! NSManagedObject
                userObj.setValue(city, forKey: "city")
                
                do {
                    try userObj.managedObjectContext?.save()
                    logView.text = "User record is updated in the local Database.";
                } catch {
                    let saveError = error as NSError
                    print(saveError)
                }
            } else {
                 logView.text = "No User records found in the local Database.";
            }
        } catch {
            let fetchError = error as NSError
            print("Error",fetchError)
        }
    }
    
    
    func deleteUser (uname : NSString) {
        
        // Initialize Delete Request
        let deleteRequest = NSFetchRequest()
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        // Create Entity Description
        let entityDescription = NSEntityDescription.entityForName("User", inManagedObjectContext: managedContext)
        
        // Configure Fetch Request
        deleteRequest.entity = entityDescription
        
        do {
            let result = try managedContext.executeFetchRequest(deleteRequest)
            if (result.count > 0) {
                let userObj = result[0] as! NSManagedObject
                managedContext.deleteObject(userObj)
                
                do {
                    try managedContext.save()
                    logView.text = "User record is deleted in the local Database.";
                } catch {
                    let saveError = error as NSError
                    print(saveError)
                }
                
            } else {
                logView.text = "No User records found in the local Database.";
            }
        } catch {
            let fetchError = error as NSError
            print("Error",fetchError)
        }
        
    }
}

