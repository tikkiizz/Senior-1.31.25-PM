//
//  AboutViewController.swift
//  Senior
//
//  Created by CPE KMUTT on 11/1/2558 BE.
//  Copyright © 2558 Naphat Jindathanakit. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

 
    @IBOutlet weak var txtAbout: UITextView!
    @IBOutlet weak var txtContact: UITextView!
    var about = About()
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        let query = PFQuery(className: "Branch")
        var objContact = [PFObject]()
        about.setAbout("")
        do{
            try objContact = query.findObjects()
        }catch{
            print("Error")
        }
        for object in objContact{
            print(object)
            txtContact.text = txtContact.text! + "Branch \(object["branchName"] as! String) \n"
            txtContact.text = txtContact.text! + (object["branchDetail"] as! String) + "\n\n"
        //objContact.append(object.valueForKey("branchDetail") as! String)
        
        }
        txtAbout.text = "สวัสดี \n เราคือบริษัทเสือโอ๊ตจำจัด"
        */
        let query = PFQuery(className: "Branch")
        var objContact = [PFObject]()
        var strContact = String()
        do{
            try objContact = query.findObjects()
        }catch{
            print("Error")
        }
        for object in objContact{
            //print(object)
            strContact = strContact + "Branch \(object["branchName"] as! String) \n"
            strContact = strContact + (object["branchDetail"] as! String) + "\n\n"
            //objContact.append(object.valueForKey("branchDetail") as! String)
            
        }
        about.setAbout("สวัสดี \n เราคือบริษัทเสือโอ๊ตจำจัด")
        about.setContact(strContact)
        txtAbout.text = about.getAbout()
        txtContact.text = about.getContact()
               // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
