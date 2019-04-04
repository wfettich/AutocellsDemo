//
//  ImageAndTextView.swift
//  Demo
//
//  Created by Walter Fettich on 04/04/2019.
//  Copyright © 2019 Walter Fettich. All rights reserved.
//

import UIKit

class ImageAndTextView: UIView
{
    @IBOutlet weak var viewImage: UIImageView!
    @IBOutlet weak var viewText: UITextView!
    @IBOutlet weak var labelText: UILabel!
    
    var modelObject:ModelObject?
    {
        didSet
        {
            guard modelObject != nil else {return}
            
            viewImage.isHidden = true
            //viewImage.image = modelObject?.urlImage //to do: get image from url
            viewText.text = "text view: " + (modelObject!.text ?? "")  + " END text view"
            labelText.text = "label: " + (modelObject!.text ?? "") + " END label"

            setNeedsUpdateConstraints()
            setNeedsLayout()
        }
    }
    
//    override func layoutSubviews()
//    {
//        super.layoutSubviews()
//
//        if self.viewText.bounds.width != self.bounds.width
//        {
//            self.viewText.preferredMaxLayoutWidth = self.bounds.width;
//            viewText.sizeToFit()
//
//            heightConstraintAboutText.constant = labelAbout.bounds.size.height + 50
//        }
//    }
    
    override func awakeAfter(using aDecoder: NSCoder) -> Any? {
        guard subviews.isEmpty else {
            return self
        }
        return Bundle.main.loadNibNamed(String(describing: type(of:self)), owner: nil, options: nil)?.first
    }
}
