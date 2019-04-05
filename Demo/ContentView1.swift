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
        if let detail = modelObject {
            if let label = detailDescriptionLabel {
                label.text = detail.text
                imageView.image = detail.image
                
                setNeedsLayout()
            }
        }
    }
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        translatesAutoresizingMaskIntoConstraints = false
        
        configureView()
    }        
    
    var modelObject: ModelObject?
    {
        didSet
        {
            // Update the view.
            configureView()
        }
    }
    
    override func awakeAfter(using aDecoder: NSCoder) -> Any? {
        guard subviews.isEmpty else {
            return self
        }
        return Bundle.main.loadNibNamed(String(describing: type(of:self)), owner: nil, options: nil)?.first
    }
}
