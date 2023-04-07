//
//  normal.swift
//  Maak3
//
//  Created by Alanoudkhalid on 20/07/1444 AH.
//

import SwiftUI

struct normal: View {
    var body: some View {
        ZStack{
            Color("AccentColor").ignoresSafeArea()
            Text("YOUR HEART BEAT IS NORMAL .. :)")
                .font(.title2)
                .fontWeight(.heavy)
        }
    }
}

struct normal_Previews: PreviewProvider {
    static var previews: some View {
        normal()
    }
}
