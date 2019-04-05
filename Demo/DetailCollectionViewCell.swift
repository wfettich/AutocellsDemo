//
//  DetailCollectionViewCell.swift
//  Demo
//
//  Created by Walter Fettich on 05/04/2019.
//  Copyright © 2019 Walter Fettich. All rights reserved.
//

import UIKit

class DetailCollectionViewCell: UICollectionViewCell {


    override func awakeFromNib()
    {
        
        translatesAutoresizingMaskIntoConstraints = false
//        isAccessibilityElement = false
    }

    func createContentViewController() -> DetailContentViewController
    {
        
        let sb = UIStoryboard(name: String(describing: DetailContentViewController.self), bundle: nil)
        
        let bvc = sb.instantiateInitialViewController() as! DetailContentViewController

        addSubviewWithConstraints(bvc.view)
        
        //        bvc!.parentCtrl = self
        //        bvc!.business = businesses[index]
        //        let nrs = bvc!.tableView.numberOfSections
        //        bvc!.viewHeader?.business = businesses[index]
        
        return bvc
    }
}

extension UIView
{
    func addSubviewWithConstraints(_ view:UIView)
    {
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        
        let containerViewLeadingConstraint = NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal
            , toItem: view.superview, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 0)
        
        let containerViewTopConstraint = NSLayoutConstraint(item: view, attribute: .top, relatedBy: .equal
            , toItem: view.superview, attribute: .top, multiplier: 1, constant: 0)
        
        let containerViewEndConstraint = NSLayoutConstraint(item: view, attribute: .width, relatedBy: .equal
            , toItem: view.superview, attribute: .width, multiplier: 1, constant: 0)
        
        let containerViewBottomConstraint = NSLayoutConstraint(item: view, attribute: .bottom, relatedBy: .equal
            , toItem: view.superview, attribute: .bottom, multiplier: 1, constant: 0)
        
        NSLayoutConstraint.activate([containerViewLeadingConstraint, containerViewTopConstraint
            ,containerViewEndConstraint,containerViewBottomConstraint])
        
    }
}
