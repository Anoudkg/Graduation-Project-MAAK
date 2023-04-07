//
//  DocTabBar.swift
//  Maak3
//
//  Created by Alanoudkhalid on 25/07/1444 AH.
//
import SwiftUI

struct DocTabBar: View {
    var body: some View {
        NavigationView {
            TabView {
                PatientSearch()
                    .tabItem {
                        Label("Patient", systemImage: "cross.case")
                    }
        
                
                Dhomepage()
                    .tabItem {
                        Label("Profile", systemImage: "person.fill")
                    }
            
        }.navigationBarBackButtonHidden(true)
            
        }.navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
    }
}
struct DocTabBar_Previews: PreviewProvider {
    static var previews: some View {
        DocTabBar()
    }
}
