//
//  doct.swift
//  testAPI
//
//  Created by Noura on 18/07/1444 AH.
//

import Foundation

struct patient: Identifiable {
    var id: String = UUID().uuidString
   var Fname: String
   var Lname: String
   var Age: String
    var Gender: String
   var phone: String
   var EmergencyContactNum: String
}
