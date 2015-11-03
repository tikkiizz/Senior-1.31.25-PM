//
//  PromotionTableViewController.swift
//  Senior
//
//  Created by CPE KMUTT on 11/2/2558 BE.
//  Copyright © 2558 Naphat Jindathanakit. All rights reserved.
//

import UIKit

class PromotionTableViewController: UITableViewController {

    var promotions = [Promotion]()
    var promotionObj = [PFObject]?()
    override func viewDidLoad() {
        super.viewDidLoad()
        let query = PFQuery(className: "Promotion")
        //query.whereKey("promotionID", equalTo: "promo1")
        // 2
        
        do{
            try promotionObj = query.findObjects()
        }catch{
            print("Error")
        }
       
        let promotion = Promotion()
        var i=0//j=0
        for object in promotionObj!{
            //j=i
            //print(object)
            //promotions.append(Promotion())
            promotion.setPromoName((object.valueForKey("promotionName") as! String))
            promotion.setPromoDetail((object.valueForKey("promotionDetail") as! String))
            //promotions.append(promotion)
            //print(promotionID[i])
            
            let tempPic = object.valueForKey("picture") as! PFFile
            tempPic.getDataInBackgroundWithBlock{
                (imageData: NSData?, error: NSError?)-> Void in
                if error == nil {
                    if let imageData = imageData {
                        let image = UIImage(data:imageData)
                        promotion.setPromoPic(image!)
                        //print(image)
                        //self.promoPic.append(image!)
                        //self.imgT.image = self.promoPic[i]
                        //j++
                    }
                }
                else{
                    print("Error")
                }
            }
            promotions.append(promotion)
            i++
            
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return promotions.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        

        // Configure the cell...
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "PromotionTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! PromotionTableViewCell
    
        // Fetches the appropriate meal for the data source layout.
        let promotion = promotions[indexPath.row]
    
        cell.lbPromoName.text = promotion.getPromoName()
        cell.imgPromoPic.image = promotion.getPromoPic()
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
