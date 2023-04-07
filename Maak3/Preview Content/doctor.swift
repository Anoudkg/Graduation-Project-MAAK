//
//  doct.swift
//  testAPI
//
//  Created by Noura on 18/07/1444 AH.
//

import Foundation

struct doctor: Identifiable {
    var id: String = UUID().uuidString
    var Fname: String
    var Lname: String
    var Hospital: String
    var Speciality: String
    var phone: String
}
