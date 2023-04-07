//
//  ContentView.swift
//  testAPI
//
//  Created by Noura on 16/07/1444 AH.
//

import SwiftUI

struct Dhomepage: View {
    @ObservedObject private var viewModel = listofDoctors()
    @State private var isShowingMessages = false
    var body: some View {
        NavigationStack {
            Image("Image")
            //
            List(viewModel.Doctors) { doct in
                VStack(alignment: .leading ,spacing: 20){
             
                    HStack{
                        
                    Text("Name :").font(.custom("Montserrat Medium", size: 24))
                            .foregroundColor(Color.white)
                            .padding([.top, .leading, .bottom], 8.0)
                            
                        Text("\(doct.Fname) \(doct.Lname)").font(.custom("Montserrat Medium", size: 24)).foregroundColor(Color.white).padding([.top, .bottom, .trailing], 8.0)
                        
                    }.background(RoundedRectangle(cornerRadius: 13)
                                    .fill(Color(#colorLiteral(red: 0.0784313753247261, green: 0.6313725709915161, blue: 1, alpha: 1))))
                                    .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.25)), radius:4, x:0, y:4)
            
                    HStack{
                    Text("Hospital :").font(.custom("Montserrat Medium", size: 24))
                            .foregroundColor(Color.white)
                            .padding([.top, .leading, .bottom], 8.0)
                        Text("\(doct.Hospital)KKUH").font(.custom("Montserrat Medium", size: 24))
                            .foregroundColor(Color.white).padding([.top, .bottom, .trailing], 8.0)
                        
                    }.background(RoundedRectangle(cornerRadius: 13)
                                    .fill(Color(#colorLiteral(red: 0.0784313753247261, green: 0.6313725709915161, blue: 1, alpha: 1))))
                                    .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.25)), radius:4, x:0, y:4)
                    HStack{
                    Text("Speciality :").font(.custom("Montserrat Medium", size: 24))
                            .foregroundColor(Color.white)
                            .padding([.top, .leading, .bottom], 8.0)
                        Text("\(doct.Speciality)cardiologist").font(.custom("Montserrat Medium", size: 24))
                            .foregroundColor(Color.white)
                            .padding([.top, .bottom, .trailing], 8.0)
                        
                    }.background(RoundedRectangle(cornerRadius: 13)
                                    .fill(Color(#colorLiteral(red: 0.0784313753247261, green: 0.6313725709915161, blue: 1, alpha: 1))))
                                    .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.25)), radius:4, x:0, y:4)
                    HStack{
                    Text("Phone :").font(.custom("Montserrat Medium", size: 24))
                            .foregroundColor(Color.white)
                            .padding([.top, .leading, .bottom], 8.0)
                        Text("\(doct.phone)0554405683").font(.custom("Montserrat Medium", size: 24))
                            .foregroundColor(Color.white)
                            .padding([.top, .bottom, .trailing], 8.0)
                        
                    }.background(RoundedRectangle(cornerRadius: 13)
                                    .fill(Color(#colorLiteral(red: 0.0784313753247261, green: 0.6313725709915161, blue: 1, alpha: 1))))
                                    .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.25)), radius:4, x:0, y:4)
                    Spacer()
                    
                    Button("Contact IT Maak team here") {
                                self.isShowingMessages = true
                            }.sheet(isPresented: self.$isShowingMessages) {
                                MessageComposeView(recipients: ["0550451204"], body: "Message goes here") { messageSent in
                                    print("MessageComposeView with message sent? \(messageSent)")
                                }
                            }.foregroundColor(Color(#colorLiteral(red: 0.0784313753247261, green: 0.6313725709915161, blue: 1, alpha: 1)))

                    
                    Image(systemName:"rectangle.portrait.and.arrow.forward")
                        .padding(.leading, 300.0).font(.largeTitle)
                    
                }
            }
            .navigationBarTitle("Profile")
                .onAppear(){
                    self.viewModel.fetchData()
                }
                .scrollContentBackground(.hidden)
                .navigationBarBackButtonHidden(true)
        }
        
        
    }
}

struct Dhomepage_Previews: PreviewProvider {
    static var previews: some View {
        Dhomepage()
    }
}

