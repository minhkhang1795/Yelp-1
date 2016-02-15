//
//  BusinessDetailViewController.swift
//  Yelp
//
//  Created by YouGotToFindWhatYouLove on 2/14/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit
import AFNetworking

class BusinessDetailViewController: UIViewController {
    
    var name: String!
    var address: String!
    var imageURL: NSURL!
    var distance: String!
    var ratingImageURL: NSURL!
    
    @IBOutlet weak var bigImageView: UIImageView!
    @IBOutlet weak var smallImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!

    @IBOutlet weak var addressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bigImageView.setImageWithURL(imageURL)
        smallImageView.setImageWithURL(imageURL)
        nameLabel.text = name
        addressLabel.text = address

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
