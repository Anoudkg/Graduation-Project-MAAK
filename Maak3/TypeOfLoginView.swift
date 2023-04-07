//
//  TypeOfLoginView.swift
//  xx
//
//  Created by Noura on 20/07/1444 AH.
//

import SwiftUI

struct TypeOfLoginView: View {
    @State var isPressing =  false
    var body: some View {
        NavigationView{
            VStack(alignment: .leading){
                //MAAK Your Health, Our Priority
                Text("MAAK\n").font(.custom("Montserrat Medium", size: 24)).foregroundColor(Color(#colorLiteral(red: 0, green: 0.04, blue: 0.24, alpha: 1))).tracking(0.24) + Text(" Your Health, Our Priority").font(.custom("Montserrat Medium", size: 14)).foregroundColor(Color(#colorLiteral(red: 0, green: 0.04, blue: 0.24, alpha: 1))).tracking(0.14)
                Spacer()
                //doctorOP
                Button (action: {
                    isPressing = true
                }, label: {
                    NavigationLink(destination: plogin()){}
                    Text("Patient")
                        .font(.title)
                        .fontWeight(.light)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        .lineLimit(nil)
                        .frame(width: 210.0, height: 160.0)
                        .accentColor(.white)
                        .padding(20.0)
                    
                    
                    
                })
                .padding(.all, 10.0)
                .background(RoundedRectangle(cornerRadius: 30)
                    .fill(LinearGradient(gradient: .init(colors: [Color(#colorLiteral(red: 0.6235294342041016, green: 0.9215686321258545, blue: 0.9215686321258545, alpha: 1)), Color(#colorLiteral(red: 0.007843137718737125, green: 0.7607843279838562, blue: 0.8039215803146362, alpha: 1)).opacity(0.75)]),
                                         startPoint: UnitPoint(x: 0.7528089823225927, y: 0.37000002298992357),
                                         endPoint: UnitPoint(x: 0.3651685299232982, y: 0.7900000890365071))))
                .shadow(color: Color(#colorLiteral(red: 0.19648748636245728, green: 0.19648748636245728, blue: 0.27947598695755005, alpha: 0.07999999821186066)), radius:4, x:0, y:24)
                NavigationLink("", destination: plogin(), isActive: $isPressing ) //here
                
                HStack{} .padding(.vertical, 10.0)
                
                Button (action: {
                    isPressing = true
                }, label: {
                    NavigationLink(destination: dlogin()){}
                    Text("Doctor")
                        .font(.title)
                        .fontWeight(.light)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        .lineLimit(nil)
                        .frame(width: 210.0, height: 160.0)
                        .accentColor(.white)
                        .padding(20.0)
                    
                    
                    
                })
                .padding(.all, 10.0)
                .background(RoundedRectangle(cornerRadius: 30)
                    .fill(LinearGradient(gradient: .init(colors: [Color(#colorLiteral(red: 0.1666666865348816, green: 0.7499998211860657, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0, green: 0.5199999809265137, blue: 1, alpha: 1)).opacity(0.75)]),
                                         startPoint: UnitPoint(x: 0.7528089823225927, y: 0.37000002298992357),
                                         endPoint: UnitPoint(x: 0.3651685299232982, y: 0.7900000890365071))))
                .shadow(color: Color(#colorLiteral(red: 0.19648748636245728, green: 0.19648748636245728, blue: 0.27947598695755005, alpha: 0.07999999821186066)), radius:4, x:0, y:24)
                
                NavigationLink("", destination: dlogin(), isActive: $isPressing )
                
                //Chart Header
                
                Spacer()
            }.padding(.top, 40.0)
                .navigationBarBackButtonHidden(true)
        }
        }
}

struct TypeOfLoginView_Previews: PreviewProvider {
    static var previews: some View {
        TypeOfLoginView()
    }
}
