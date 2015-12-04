//
//  ItemDetailViewController.swift
//  NSWindowShopper
//
//  Created by iGuest on 12/1/15.
//  Copyright © 2015 iGuest. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

class ItemDetailViewController : UIViewController {
    
    @IBOutlet weak var ItemImage: UIImageView!
    @IBOutlet weak var ItemName: UILabel!
    @IBOutlet weak var ItemLocation: UILabel!
    @IBOutlet weak var DatePosted: UILabel!
    @IBOutlet weak var ItemDescription: UILabel!
    
    //var sampleItem = Item(profile: Profile(), name: "Football", description: "Boy howdy this football sure is golly gee swell you should buy the hell out of it", price: NSNumber(int: 20), location: CLLocation(), locationName: "Seattle, WA", datePosted: NSDate(), imageURL: "https://beccasheppard.files.wordpress.com/2011/09/football.jpg")
    
    var sampleItem : Item?
    
    override func viewDidLoad() {
        if let url = NSURL(string: sampleItem!.imageURL!) {
            if let data = NSData(contentsOfURL: url) {
                ItemImage.image = UIImage(data: data)
            }
        }
        
        ItemImage.clipsToBounds = true
        
        ItemName.text = "\(sampleItem!.name!), $\(sampleItem!.price!.stringValue)"
        ItemLocation.text = sampleItem!.locationName!
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        DatePosted.text = "Posted: \(dateFormatter.stringFromDate(sampleItem!.datePosted!))"
        
        ItemDescription.text = sampleItem!.description
    }
    
    @IBAction func navigateToProfileViewController(sender: AnyObject) {
        let storyboard = UIStoryboard(name: "ProfileViewController", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier("ProfileViewController") as! ProfileViewController
        vc.testProfile = sampleItem!.profile
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
