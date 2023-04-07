//
//  listDoctor.swift
//  testAPI
//
//  Created by Noura on 17/07/1444 AH.
//

import Foundation
import FirebaseFirestore

class listofDoctors : ObservableObject {
    
    @Published var Doctors = [doctor]()
    
    private var db = Firestore.firestore()
    
    func fetchData() {
        db.collection("Doctors").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
                
            }
            
            self.Doctors = documents.map { (queryDocumentSnapshot) -> doctor in
                let data = queryDocumentSnapshot.data()
                let Fname = data["Fname"] as? String ?? ""
                let Lname = data["Lname"] as? String ?? ""
                let hospital = data["hospital"] as? String ?? ""
                let speciality = data["speciality"] as? String ?? ""
                let DPhoneNum = data["DPhoneNum"] as? String ?? ""
                return doctor(Fname: Fname, Lname: Lname, Hospital: hospital, Speciality: speciality , phone: DPhoneNum )
            }
            
        }
    }
}
