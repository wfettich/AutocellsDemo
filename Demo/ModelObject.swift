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
    private static let lorem = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum"
    
    public var image:UIImage? = nil
    public var urlImage:URL?
    public var text:String?
    
    public enum CodingKeys: String, CodingKey
    {
        case urlImage
        case text
    }

    public init(urlImage:URL? = nil, text:String? = nil)
    {
        self.urlImage = urlImage
        self.text = text
    }
    
    static func dummy() -> ModelObject
    {
        var result = ModelObject()
        
        let r = Int(arc4random_uniform(UInt32(lorem.count)))
        
        result.text = String(lorem.prefix(r)) + " \(r) chars"
        result.image = r % 2 == 0 ? #imageLiteral(resourceName: "demo2") : #imageLiteral(resourceName: "demo1")
//        result.image = r % 3 == 0 ? #imageLiteral(resourceName: "demo2") : r % 3 == 1 ? #imageLiteral(resourceName: "demo1") : nil
        
        return result
    }
}
