//
//  MasterTableViewCell.swift
//  Demo
//
//  Created by Walter Fettich on 04/04/2019.
//  Copyright © 2019 Walter Fettich. All rights reserved.
//

import UIKit

class MasterTableViewCell: UITableViewCell
{
    @IBOutlet weak var viewImageAndText: ImageAndTextView2!
    
    var modelObject:ModelObject?
    {
        didSet
        {
            viewImageAndText.modelObject = modelObject
        }
    }
    override func awakeFromNib()
    {
        super.awakeFromNib()
        
//        translatesAutoresizingMaskIntoConstraints = false
        // Initialization code
    }
    
//    override func systemLayoutSizeFitting(_ targetSize: CGSize) -> CGSize
//    {
//        var calculatedSize = super.systemLayoutSizeFitting(targetSize)
//        
//        return calculatedSize
//    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
