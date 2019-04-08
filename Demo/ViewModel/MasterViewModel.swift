//
//  MasterViewModel.swift
//  Demo
//
//  Created by Walter Fettich on 08/04/2019.
//  Copyright © 2019 Walter Fettich. All rights reserved.
//

import Foundation

protocol MasterViewModelProtocol
{
    func addObject(_ object:ModelObject)
    func remove(at index:Int)
    var objects:[ModelObject]
    {
        get
    }
    
}

class MasterViewModel: NSObject, MasterViewModelProtocol
{
    
    func addObject(_ object: ModelObject) {
        _objects.insert(object, at: 0)
    }
    func remove(at index:Int)
    {
        _objects.remove(at: index)
    }
    private var _objects = [ModelObject]()
    var objects:[ModelObject]
    {
        get
        {
            return _objects
        }
    }
}
