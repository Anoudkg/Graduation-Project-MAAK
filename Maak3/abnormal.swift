//
//  abnormal.swift
//  Maak3
//
//  Created by Alanoudkhalid on 20/07/1444 AH.
//
import SwiftUI

struct abnormal: View {
    var body: some View {
        ZStack{
            Color("AccentColor").ignoresSafeArea()
            Text("YOUR HEART BEAT IS ABNORMAL .. PLEASE CONTACT YOUR DOCTOR!")
                .font(.title2)
                .fontWeight(.heavy)
        }
    }
}

struct abnormal_Previews: PreviewProvider {
    static var previews: some View {
        abnormal()
    }
}
