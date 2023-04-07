//
//  ReadViewModel.swift
//  Maak3
//
//  Created by Alanoudkhalid on 20/07/1444 AH.
//

import SwiftUI
import UIKit
import Foundation
import Firebase
import FirebaseDatabase
import FirebaseDatabaseSwift

class ReadViewModel: ObservableObject{
    
    var ref = Database.database().reference()
    
    @Published
    var value: Int? = nil
    var abnormal:Bool? = false
    
    @Published
    var object: ObjectsDemo? = nil
    
    @Published
    var listObject = [ObjectsDemo]()
    
    func observerDateChange(){
        ref.child("PR").observe(.value){snapshot in
            self.value = snapshot.value as? Int ?? -1
        }
    }
    
    func  readobject(){
            ref.child("1").observe(.value){snapshot in
                do{
                    self.object = try snapshot.data(as: ObjectsDemo.self)
                }catch{print("can not covert to ObjectDemo")}
            }
          }
      
    func observeListObjects(){
        ref.observe(.value){ parentSnapshot in
            guard let children  = parentSnapshot.children.allObjects
                    as?  [DataSnapshot]
            else {return}
            self.listObject =  children.compactMap({snapshot
                in return try?
                snapshot.data(as: ObjectsDemo.self)
            })
            
        }
    }
        
    }

