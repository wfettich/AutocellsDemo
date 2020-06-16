//
//  DetailCollectionViewCell.swift
//  Demo
//
//  Created by Walter Fettich on 05/04/2019.
//  Copyright © 2019 Walter Fettich. All rights reserved.
//

import UIKit

class DetailCollectionViewCell: UICollectionViewCell
{
    var contentVC:DetailContentViewController?
    
    @IBOutlet weak var detailContentView: UIView!
    
    var modelObject: ModelObject?
    {
        didSet {
            contentVC?.modelObject = modelObject
        }
    }

    override func awakeFromNib()
    {
        translatesAutoresizingMaskIntoConstraints = false
    }

    func createContentViewController() -> DetailContentViewController
    {
        let sb = UIStoryboard(name: String(describing: DetailContentViewController.self), bundle: nil)
        
        let bvc = sb.instantiateInitialViewController() as! DetailContentViewController

        contentVC = bvc
        contentVC?.modelObject = modelObject
        detailContentView.layoutMargins = .zero
        detailContentView.set(contentView: bvc.view)
                
        return bvc
    }
}

extension UIView
{
    func set(contentView: UIView)
    {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(contentView)
        
        let containerViewLeadingConstraint = NSLayoutConstraint(item: contentView, attribute: .leading, relatedBy: .equal
            , toItem: contentView.superview, attribute:.leadingMargin, multiplier: 1, constant: 0)
        
        let containerViewTopConstraint = NSLayoutConstraint(item: contentView, attribute: .top, relatedBy: .equal
            , toItem: contentView.superview, attribute: .topMargin, multiplier: 1, constant: 0)
        
        let containerViewBottomConstraint = NSLayoutConstraint(item: contentView, attribute: .bottom, relatedBy: .equal
            , toItem: contentView.superview, attribute: .bottomMargin, multiplier: 1, constant: 0)
        
        let containerViewEndConstraint = NSLayoutConstraint(item: contentView, attribute: .trailing, relatedBy: .equal
            , toItem: contentView.superview, attribute: .trailingMargin, multiplier: 1, constant: 0)
        
//        let containerViewWidthConstraint = NSLayoutConstraint(item: contentView, attribute: .width, relatedBy: .equal
//            , toItem: contentView.superview, attribute: .width, multiplier: 1, constant: 0)
        
        NSLayoutConstraint.activate([
            containerViewLeadingConstraint
            ,containerViewTopConstraint
            ,containerViewBottomConstraint
            ,containerViewEndConstraint
            ])
        
        setNeedsUpdateConstraints()
        setNeedsLayout()
    }
}
