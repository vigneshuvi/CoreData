# CoreData
Swift Core Data Basics with easy sample project.

#### 	Description

CoreData tutorial helps to create iPhone/iPad mobile application Project with CoreData.framework in [Swift](https://developer.apple.com/swift/). I have created the sample project with clear comments and instructions.

#### Frameworks used

* [CoreData.framework](https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/CoreData/index.html)

#### Table of Contents

	1.	Necessary Environemnt.
	2.	Shortcut Keys in Xcode.
	3.	What is CoreData?
	4.	Create Project with CoreData.
	5.	Create Entities and Attributes in Model Layer. 
	6.	User Object life cycle : Create, Fetch, Update, Delete datas.
	7.	Download Sample Project
  

#### 1. Necessary Environemnt

	-   MAC system with above OS X (Yosimite) version 10.10.*
	-   Xcode version 7.*

#### 2. Shortcut Keys in Xcode

* 	⌘ = Command
*	⇧ = Shift
*	⌥ = Option/Alt
*	⌃ = Control
*	⇠⇢ = Left/Right Arrow Keys
*	⇡⇣ = Up/Down Arrow Keys

#### 3. What is CoreData?

Core Data is a framework that you use to manage the model layer objects in your application. It provides generalized and automated solutions to common tasks associated with object life cycle and object graph management, including persistence.

Reference [CoreData.framework](https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/CoreData/index.html)

#### 4. Create Project with CoreData

	1. Open Xcode.
	2. Create new project.(Fille > New > Project) - Shortcut Keys( ⇧ + ⌘ + N )
	3. Choose your template for you new project.
	* Select Single View Application
	* Select Language Swift
	* Select Use Core Data Check box.
	4. Save it in Workspace.

#### 5. Create Entities and Attributes in Model Layer

	* Go to the Workspace.
	* Double Click ProjectName.xcodeproj and Open it in Xcode.
	* Open ProjectName.xcdatamodeld
	* Add Entite and Change name as you wish.
	* Add Attribute for your Entity and Select Data Type for Attributes.
	* Save it( ⌘ + S ).

#### 6. Core Data Object life cycle

	-	Create and Save object in local CoreData database. 

		Here's an example:

		```
		var User = [NSManagedObject]()
		// Get AppDelegate Object       
		let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate

		// Get Managed Context Object with help of AppDelegate.
		let managedContext = appDelegate.managedObjectContext

		// Create Entity Description with your entity name.
		let entity =  NSEntityDescription.entityForName("YOUR_ENTITE_NAME",
		    inManagedObjectContext:managedContext)

		// Create Managed Objec with help of Entity and Managed Context.
		let managedObject = NSManagedObject(entity: entity!,
		    insertIntoManagedObjectContext: managedContext)

		// Set the value for your represent attributes.
		managedObject.setValue(VALUE, forKey: "YOUR_ATTRIBUTE")

		// Handle the Exception.
		do {
		    try managedContext.save() // Save Mangaged Context
		    User.append(managedObject)  // Append your managedObject to the Database.
		} catch let error as NSError  {
		    print("Could not save \(error), \(error.userInfo)")
		}
		```

#### 7. Clone or Download Sample Project

* Download as Zip file. [Sample UviCoreData](https://github.com/vigneshuvi/CoreData/archive/master.zip)	
* Clone with github URL. [https://github.com/vigneshuvi/CoreData.git](https://github.com/vigneshuvi/CoreData.git)

___

#### Do you like it?

Do you like this repo? Share it on Twitter, Facebook, Google+ or anywhere you like so that more of us can use it and help. Thanks!

Created by [Vignesh](http://vigneshuvi.github.io/) 

![alt text][logo]

[logo]: https://github.com/vigneshuvi/vigneshuvi.github.io/blob/master/favicon.ico/android-icon-48x48.png 

