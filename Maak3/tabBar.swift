//
//  tabBar.swift
//  Maak3
//
//  Created by Alanoudkhalid on 20/07/1444 AH.
//

import SwiftUI

struct tabBar: View {
    var body: some View {
        NavigationView {
            TabView {
                DoctorSearch()
                    .tabItem {
                        Label("Doctors", systemImage: "cross.case")
                    }
               PatientHomepage()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                
                Phomepage()
                    .tabItem {
                        Label("Profile", systemImage: "person.fill")
                    }
            
        }.navigationBarBackButtonHidden(true)
            
        }.navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
    }
}
struct tabBar_Previews: PreviewProvider {
    static var previews: some View {
        tabBar()
    }
}

