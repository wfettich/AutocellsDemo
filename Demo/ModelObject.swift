//
//  ModelObject.swift
//  Demo
//
//  Created by Walter Fettich on 04/04/2019.
//  Copyright © 2019 Walter Fettich. All rights reserved.
//

import UIKit

public struct ModelObject: Codable, Equatable
{
    public var urlImage:URL?
    public var text:String?

    public init(urlImage:URL?, text:String?)
    {
        self.urlImage = urlImage
        self.text = text
    }
}
