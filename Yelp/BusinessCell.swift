//
//  BusinessCell.swift
//  Yelp
//
//  Created by Rajesh Kolla on 7/24/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit
import AFNetworking

class BusinessCell: UITableViewCell {

    @IBOutlet weak var thumbNailImage: UIImageView!
    
    @IBOutlet weak var ratingsImage: UIImageView!
    
    @IBOutlet weak var businessNameLabel: UILabel!
    
    @IBOutlet weak var businessAddressLabel: UILabel!
    
    @IBOutlet weak var businessCategoriesLabel: UILabel!
    
    @IBOutlet weak var reviewsLabel: UILabel!
    
    @IBOutlet weak var distanceLabel: UILabel!
    
    
    //Following will be used ot set the businessCell's properties.
    var business: Business!{
        //following closure will be used to set the businesscell's properties.
        didSet{
            
            thumbNailImage.setImageWithURL(business.imageURL!)
            ratingsImage.setImageWithURL(business.ratingImageURL!)
            businessNameLabel.text = business.name
            businessAddressLabel.text = business.address
            businessCategoriesLabel.text = business.categories
            reviewsLabel.text = "\(business.reviewCount!) Reviews"
            distanceLabel.text = business.distance
        
        }
    }
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        thumbNailImage.layer.cornerRadius = 3
        thumbNailImage.clipsToBounds = true
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
