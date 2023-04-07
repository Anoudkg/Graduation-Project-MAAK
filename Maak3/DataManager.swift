//
//  DataManager.swift
//  Test
//
//  Created by H A on 07/02/2023.
//
import SwiftUI
import FirebaseCore
import FirebaseStorage
import Firebase
import FirebaseAuth
import FirebaseDatabase
import FirebaseDatabaseSwift

class DataManager: ObservableObject {
    
    @Published var Patients: [patient] = []
    let db = Firestore.firestore()
    init() {
        fetchPatient()
    }
    
    func fetchPatient() {
        Patients.removeAll()
       // let db = Firestore.firestore()
        let ref = db.collection("Patients")
        ref.getDocuments { snapshot, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    let data = document.data()
                    
                    let id = data["id"] as? String ?? ""
                    let phoneNum = data["phoneNum"] as? String ?? ""
                    let Fname = data["Fname"] as? String ?? ""
                    let Lname = data["Lname"] as? String ?? ""
                    let Gender = data["Gender"] as? String ?? ""
                    let Age = data["Age"] as? String ?? ""
                    let EmergencyContactNum = data["EmergencyContactNum"] as? String ?? ""
                    
                    let patient = patient(id: id, Fname: Fname, Lname: Lname,  Age: Age, Gender: Gender,  phone: phoneNum , EmergencyContactNum: EmergencyContactNum)
                    self.Patients.append(patient)
                    
                    
                }
            }
        }
    }
        
    func addPatient(email: String ,pass: String ,Fname: String , Lname: String ,  Age: String ,Gender: String , phone: String , EmergencyContNum:  String ){
        let ref = db.collection("Patients").document("Patients")
       
        ref.setData(["Fname": Fname , "Lname":Lname , "email":email , "pass":pass , "Age":Age , "Gender":Gender ,"phone":phone , "EmergencyContNum":EmergencyContNum  ]) { error in
            if let error = error {
                print(error.localizedDescription)
            }
            
        }
    }
    
    func addPDoctor(email: String ,pass: String ,Fname: String , Lname: String  , phone: String , hospital:  String , speciality: String , P_ID: String) {
        let ref = db.collection("Doctors").document("Doctors")
       
        ref.setData(["Fname": Fname , "Lname":Lname , "email":email , "pass":pass , "Hospital":hospital ,"phone":phone , "Speciality":speciality  ,  "P_ID":"" ]) { error in
            if let error = error {
                print(error.localizedDescription)
            }
            
        }
    }
}
       
