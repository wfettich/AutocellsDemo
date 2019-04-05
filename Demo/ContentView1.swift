//
//  ContentView1.swift
//  Demo
//
//  Created by Walter Fettich on 05/04/2019.
//  Copyright © 2019 Walter Fettich. All rights reserved.
//

import UIKit

class ContentView1: UIView {
    
    @IBOutlet weak var detailDescriptionLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            if let label = detailDescriptionLabel {
                label.text = detail.text
                imageView.image = detail.image
            }
        }
    }
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        configureView()
    }        
    
    var detailItem: ModelObject?
    {
        didSet
        {
            // Update the view.
            configureView()
        }
    }
}
