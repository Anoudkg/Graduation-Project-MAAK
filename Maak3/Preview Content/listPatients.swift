//
//  listDoctor.swift
//  testAPI
//
//  Created by Noura on 17/07/1444 AH.
//

import Foundation
import Firebase
import FirebaseFirestore

class listofPatients : ObservableObject {
    
    @Published var Patients = [patient]()
    
    private var db = Firestore.firestore()
    
    func fetchData() {
        db.collection("Patients").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
                
            }
            
            self.Patients = documents.map { (queryDocumentSnapshot) -> patient in
                let data = queryDocumentSnapshot.data()
                let Fname = data["Fname"] as? String ?? ""
                let Lname = data["Lname"] as? String ?? ""
                let Age = data["Age"] as? String ?? ""
                let Gender = data["Gender"] as? String ?? ""
                let phoneNum = data["phoneNum"] as? String ?? ""
                let EmergencyContactNum = data["EmergencyContactNum"] as? String ?? ""
                return patient(Fname: Fname, Lname: Lname, Age: Age, Gender: Gender, phone: phoneNum, EmergencyContactNum: EmergencyContactNum)
            }
            
        }
    }
}
