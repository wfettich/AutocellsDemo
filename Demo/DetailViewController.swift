//
//  DetailViewController.swift
//  Demo
//
//  Created by Walter Fettich on 04/04/2019.
//  Copyright © 2019 Walter Fettich. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController
{

    @IBOutlet weak var collectionView: UICollectionView!
    
    var detailItem: ModelObject? {
        didSet {
            // Update the view.
//            configureView()
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        collectionView.register(UINib(nibName: String(describing: DetailCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: DetailCollectionViewCell.self))
        
    }
}

extension DetailViewController : UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height);
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: DetailCollectionViewCell.self), for: indexPath) as! DetailCollectionViewCell
        
        let bvc = cell.createContentViewController()
        if cell.contentVC != nil
        {
            addChild(cell.contentVC!)
        }
//        cell.containerVC = self
//        cell.business = businesses[indexPath.row]
//        cell.isAccessibilityElement = false
        
        return cell;
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath)
    {
        (cell as! DetailCollectionViewCell).contentVC?.removeFromParent()
    }
}
