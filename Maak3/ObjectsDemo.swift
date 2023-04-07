//
//  ObjectsDemo.swift
//  Maak3
//
//  Created by Alanoudkhalid on 20/07/1444 AH.
//


import Foundation
class ObjectsDemo:Encodable,Decodable,Identifiable{
    var id: String = ""
    var HR1:  Int = -1
    var HR2:  Int = -1
    var HR3:  Int = -1
    var HR4:  Int = -1
    var HR5:  Int = -1
    var HR6:  Int = -1
    var HR7:  Int = -1
    var HR8:  Int = -1
    var HR9:  Int = -1
    var HR10:  Int = -1
    var HR11:  Int = -1
    var HR12:  Int = -1
}

extension Encodable{
    var toDictionary: [String:Any]?{
        guard let data = try? JSONEncoder().encode(self)
        else{ return nil }
        return try? JSONSerialization.jsonObject(with: data, options: .allowFragments)  as?[String:Any]
    }
}

