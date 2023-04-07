//
//  ContentView.swift
//  testAPI
//
//  Created by Noura on 16/07/1444 AH.
//
//
import SwiftUI
import MessageUI
import UIKit
import FirebaseCore
import FirebaseStorage
import Firebase
import FirebaseAuth
import FirebaseDatabase
import FirebaseDatabaseSwift

struct DoctorSearch: View {
    
    @State private var isShowingMessages = false
    @State var disablesbutton = false
    @State var disablesbutton2 = true
    //@State var P_ID  = ""
    @ObservedObject private var viewModel2 = listofPatients()
    @ObservedObject private var viewModel = listofDoctors()
    @State var P_ID  = "P1"
    var body: some View {
        NavigationStack{
            List(viewModel.Doctors) { doct in
                VStack(alignment: .leading){
                    Text("Dr.\(doct.Fname) \(doct.Lname)").font(.title)
                    Text("Hospital: \(doct.Hospital)KKUH").font(.subheadline)
                    Text("Speciality: \(doct.Speciality)Cardiologist").font(.subheadline)
                }
                
                    
                
                Button(action: {
                    print("Doctor Added")
                    disablesbutton  = true
                    disablesbutton2 = false
                    send(P_ID:P_ID)
                    
                }){
                    Label("Add the Doctor", systemImage: "person.badge.plus")
                }.disabled(disablesbutton)
                
              
                
                Button("Contact Dr.\(doct.Fname) here") {
                            self.isShowingMessages = true
                        }.disabled(disablesbutton2)
                        .sheet(isPresented: self.$isShowingMessages) {
                            MessageComposeView(recipients: ["0554405683"], body: "Message goes here") { messageSent in
                                print("MessageComposeView with message sent? \(messageSent)")
                            }
                        }
                
            }.navigationBarTitle("doctor")
                .onAppear(){
                    self.viewModel.fetchData()
                }
            
            
        }
        
    
    }
   
}

func send (P_ID:String){
    let db = Firestore.firestore()
    db.collection("Doctors").document("Doctors").setData([ "P_ID": P_ID ], merge: true)
}

struct DoctorSearch_Previews: PreviewProvider {
    static var previews: some View {
        DoctorSearch()
    }
}
