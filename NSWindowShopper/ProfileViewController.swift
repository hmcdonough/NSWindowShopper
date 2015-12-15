//
//  ProfileViewController.swift
//  NSWindowShopper
//
//  Created by iGuest on 12/1/15.
//  Copyright © 2015 iGuest. All rights reserved.
//

import Foundation
import UIKit

class ProfileViewController : UIViewController {
    
    @IBOutlet weak var profileRating: UILabel!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var profileMemberSince: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var ratingStar: CosmosView!
    @IBOutlet weak var shadowView: UIView!
    
    var testProfile : Profile? //= Profile(displayName: "Harry McDonough", dateJoined: NSDate(), ratingScore: 3.7, ratingCount: 47, avatarURL: "https://graph.facebook.com/1069772458/picture?type=normal&return_ssl_resources=true")
    
    override func viewDidLoad() {
        
        weak var weakSelf = self;
        ImageLoader.loadImageAtURL(testProfile!.avatarURL!) { (loadedImage, _) -> Void in
            if (weakSelf != nil) {
                weakSelf!.profileImage.image = loadedImage
            }
        }
        
        profileImage.clipsToBounds = true
        profileImage.contentMode = UIViewContentMode.ScaleAspectFill
        profileImage.layer.cornerRadius = 5
        
        profileName.text = testProfile!.displayName
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        profileMemberSince!.text = "Member since: " + dateFormatter.stringFromDate(testProfile!.dateJoined!)

        ratingStar.backgroundColor = self.view.backgroundColor
        ratingStar.rating = Double((testProfile?.ratingScore)!)
        ratingStar.settings.fillMode = .Precise
        profileRating.text = String(Double((testProfile?.ratingScore)!)) + " stars across " + String(testProfile!.ratingCount!) + " reviews"

        self.title = testProfile!.displayName
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        UIView.animateWithDuration(1, animations: {
            self.profileImage.alpha = 1
        })
        
        UIView.animateWithDuration(1, delay: 0.5, options: UIViewAnimationOptions.BeginFromCurrentState, animations: {
            self.profileName.alpha = 1
            self.profileRating.alpha = 1
            self.profileMemberSince.alpha = 1
            self.ratingStar.alpha = 1
            }, completion: nil)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        shadowView.layer.shadowColor = UIColor.blackColor().CGColor
        shadowView.layer.shadowOffset = CGSizeZero
        shadowView.layer.shadowOpacity = 0.7
        shadowView.layer.shadowRadius = 15
        shadowView.addSubview(profileImage)
    }
}
