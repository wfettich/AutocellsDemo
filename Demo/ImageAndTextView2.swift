//
//  ImageAndTextView.swift
//  Demo
//
//  Created by Walter Fettich on 04/04/2019.
//  Copyright © 2019 Walter Fettich. All rights reserved.
//

import UIKit
import AVFoundation

class ImageAndTextView2: UIView
{
    @IBOutlet weak var viewImage: UIImageView!
    @IBOutlet weak var viewText: UITextView!
    @IBOutlet weak var labelText: UILabel!
    
    @IBOutlet weak var heightImage: NSLayoutConstraint!
    @IBOutlet weak var heightTextView: NSLayoutConstraint!
    
    var modelObject:ModelObject?
    {
        didSet
        {
            guard modelObject != nil else {return}
            
            if let image = modelObject!.image
            {
                viewImage.image = image
                setNeedsLayout()
            }
            
            labelText.text = "label: " + (modelObject!.text ?? "") + " END label"

        }
    }
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    override func layoutSubviews()
    {
        super.layoutSubviews()
        
        if let image = viewImage.image
        {
            viewImage.image = image
            
            let largeRect = CGRect(x: 0, y: 0, width: viewImage.bounds.size.width, height: 1000)
            let neededBounds = AVMakeRect(aspectRatio: image.size, insideRect: largeRect)
            heightImage.constant = neededBounds.size.height
            setNeedsUpdateConstraints()
        }
    }
    

    override func systemLayoutSizeFitting(_ targetSize: CGSize) -> CGSize
    {
        var calculatedSize = super.systemLayoutSizeFitting(targetSize)
        
        return calculatedSize
        /*
        let largeSize = CGSize(width:calculatedSize,height:5000)
        let neededSize = self.viewText.sizeThatFits(largeSize)
        
        if self.viewText.bounds.height < neededSize.height
        {
            heightTextView.constant = neededSize.height
            
            setNeedsUpdateConstraints()
        }
         */
    }
    
    override func awakeAfter(using aDecoder: NSCoder) -> Any? {
        guard subviews.isEmpty else {
            return self
        }
        return Bundle.main.loadNibNamed(String(describing: type(of:self)), owner: nil, options: nil)?.first
    }
}
