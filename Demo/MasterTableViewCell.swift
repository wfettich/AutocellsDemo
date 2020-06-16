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
    @IBOutlet weak var viewImageAndText: ImageAndTextView!
    
    var modelObject:ModelObject?
    {
        didSet
        {
            viewImageAndText.modelObject = modelObject
            
            viewImageAndText.labelText.text = "CLICK TO SEE DETAIL: TableView \n\n" + viewImageAndText.labelText.text!
        }
    }
    override func awakeFromNib()
    {
        super.awakeFromNib()
        
        translatesAutoresizingMaskIntoConstraints = false
        // Initialization code
    }
    
}
