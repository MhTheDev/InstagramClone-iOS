//
//  ViewController.swift
//  InstagramClone
//
//  Created by Antal János Monori on 21/10/14.
//  Copyright (c) 2014 Antal János Monori. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBAction func pickImage(sender: AnyObject) {
        var image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        image.allowsEditing = false
        
        self.presentViewController(image, animated: true, completion: nil)
        
    }
    
    @IBOutlet var pickedImage: UIImageView!
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        pickedImage.image = image
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        Parse.setApplicationId("tQZIRTMFFuEyR4lQCb94EPsw4iDuRrQK4ujK14cH", clientKey: "w3G0RhJW29stAEe8Z9KrIZ03pqAXzD6Q9IOD8Zmd");
        
        // This is how you save data in Parse
        /*
        var score = PFObject(className: "score");
        score.setObject("Anthony", forKey: "name")
        score.setObject(42, forKey: "number")
        score.saveInBackgroundWithBlock{(success: Bool!, error: NSError!) -> Void in
            if (success == true) {
                println("Save was successful. Object got created with ID: \(score.objectId)")
            } else {
                println(error)
            }
        }
        */
        
        // This is how you query from Parse
        var query = PFQuery(className: "score")
        query.getObjectInBackgroundWithId("wzZJCu1Jdh") {
            (object: PFObject!, error: NSError!) -> Void in
                if (error==nil) {
                    println(object)
                } else {
                    println(error)
                }
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

