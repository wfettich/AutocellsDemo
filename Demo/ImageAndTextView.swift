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
    
    var modelObject:ModelObject?
    {
        didSet
        {
            guard modelObject != nil else {return}
            
            //viewImage.image = modelObject?.urlImage //to do: get image from url
            viewText.text = modelObject!.text
            
            setNeedsUpdateConstraints()
        }
    }
    
    override func awakeAfter(using aDecoder: NSCoder) -> Any? {
        guard subviews.isEmpty else {
            return self
        }
        return Bundle.main.loadNibNamed(String(describing: type(of:self)), owner: nil, options: nil)?.first
    }
}
