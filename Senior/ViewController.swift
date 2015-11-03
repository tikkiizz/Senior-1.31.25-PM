//
//  ViewController.swift
//  Senior
//
//  Created by CPE KMUTT on 10/16/2558 BE.
//  Copyright © 2558 Naphat Jindathanakit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var imgT: UIImageView!

    var promoPic = Array<UIImage>()
    var promotionID = Array<String>()
    var promotionObj = [PFObject]?()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //let hpv = HomePageViewController()
        //hpv.viewDidLoad()
        // 1
        imgT.userInteractionEnabled = true
        
        let query = PFQuery(className: "Promotion")
        query.whereKey("promotionID", equalTo: "promo1")
        // 2
        
        do{
            try promotionObj = query.findObjects()
        }catch{
            print("Error")
        }
        var i=0
        for object in promotionObj!{
            print(object)
            promotionID.append(object.valueForKey("promotionID") as! String)
            print(promotionID[i])
            let tempPic = object.valueForKey("picture") as! PFFile
            tempPic.getDataInBackgroundWithBlock{
                (imageData: NSData?, error: NSError?)-> Void in
                if error == nil {
                    if let imageData = imageData {
                        let image = UIImage(data:imageData)
                        print(image)
                        self.promoPic.append(image!)
                        self.imgT.image = self.promoPic[i]
                        i++
                    }
                }
                else{
                    print("Error")
                }
            }
        }

        /*
        //query.whereKey("Score", greaterThan: 1000)
        query.findObjectsInBackgroundWithBlock{
            (objects: [PFObject]?, error: NSError?) -> Void in
            if error == nil {
                // The find succeeded.
                print("Successfully retrieved \(objects!.count) promotion.")
                promotionObj = objects
                // Do something with the found objects
                var i = 0
                for object in promotionObj!{
                    print(object)
                    promotionID.append(object.valueForKey("promotionID") as! String)
                    let tempPic = object.valueForKey("picture") as! PFFile
                    tempPic.getDataInBackgroundWithBlock{
                        (imageData: NSData?, error: NSError?)-> Void in
                        if error == nil {
                            if let imageData = imageData {
                                let image = UIImage(data:imageData)
                                print(image)
                                promoPic.append(image!)
                                self.imgT.image = promoPic[i]
                                i++
                            }
                        }
                        else{
                            print("Error")
                        }
                    }
                    print(promotionID[i])
                    
                }
                /*
                for var i=0;i<promotionID.count;++i{
                    print("promotionID is \(promotionID[i]) \n")
                }
                */
                //self.test1.text = promotionID[0]
        
            } else {
                // Log details of the failure
                print("Error: \(error!) \(error!.userInfo)")
            }
        }
       */
    }

        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

