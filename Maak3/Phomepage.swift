//
//  ContentView.swift
//  testAPI
//
//  Created by Noura on 16/07/1444 AH.
//

import SwiftUI

struct Phomepage: View {
    @ObservedObject private var viewModel = listofPatients()
    @State private var isShowingMessages = false
    var body: some View {
        NavigationStack {
            Image("Image")
                .padding(.top, 15.0)
            List(viewModel.Patients) { patient in
                VStack(alignment: .leading ,spacing: 20){
                    
                    
                    
                   /* HStack{
                    Text("Profile Page ")
                            .font(.custom("Montserrat Medium", size:40))
                            .foregroundColor(Color.black)
                            .padding(.bottom, 200.0)
                    //
                    }*/
                    HStack{
                        
                        Text("Name :").font(.custom("Montserrat Medium", size: 24))
                            .foregroundColor(Color.white)
                            .padding([.top, .leading, .bottom], 8.0)
                            
                        Text("\(patient.Fname) \(patient.Lname)").font(.custom("Montserrat Medium", size: 24)).foregroundColor(Color.white).padding([.top, .bottom, .trailing], 8.0)
                        
                    }.background(RoundedRectangle(cornerRadius: 13)
                                    .fill(Color(#colorLiteral(red: 0.027450980618596077, green: 0.7647058963775635, blue: 0.8078431487083435, alpha: 1))))
                                    .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.25)), radius:4, x:0, y:4)
                    
                HStack{
                Text("Age :").font(.custom("Montserrat Medium", size: 24))
                        .padding([.top, .leading, .bottom], 8.0)
                        .foregroundColor(Color.white)
                    Text(patient.Age).font(.custom("Montserrat Medium", size: 24)).foregroundColor(Color.white)
                        .padding([.top, .bottom, .trailing], 8.0)
                    
                }.background(RoundedRectangle(cornerRadius: 13)
                                .fill(Color(#colorLiteral(red: 0.027450980618596077, green: 0.7647058963775635, blue: 0.8078431487083435, alpha: 1))))
                                .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.25)), radius:4, x:0, y:4)
                    HStack{
                    Text("Gender :").font(.custom("Montserrat Medium", size: 24))
                            .foregroundColor(Color.white)
                            .padding([.top, .leading, .bottom], 8.0)
                        Text(patient.Gender).font(.custom("Montserrat Medium", size: 24))
                            .foregroundColor(Color.white).padding([.top, .bottom, .trailing], 8.0)
                        
                    }.background(RoundedRectangle(cornerRadius: 13)
                                    .fill(Color(#colorLiteral(red: 0.027450980618596077, green: 0.7647058963775635, blue: 0.8078431487083435, alpha: 1))))
                                    .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.25)), radius:4, x:0, y:4)
                    HStack{
                    Text("Phone :").font(.custom("Montserrat Medium", size: 24))
                            .foregroundColor(Color.white)
                            .padding([.top, .leading, .bottom], 8.0)
                        Text(patient.phone).font(.custom("Montserrat Medium", size: 24))
                            .foregroundColor(Color.white)
                            .padding([.top, .bottom, .trailing], 8.0)
                        
                    }.background(RoundedRectangle(cornerRadius: 13)
                                    .fill(Color(#colorLiteral(red: 0.027450980618596077, green: 0.7647058963775635, blue: 0.8078431487083435, alpha: 1))))
                                    .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.25)), radius:4, x:0, y:4)
                    HStack{
                    Text("Emergency Contact :")
                            .foregroundColor(Color.white)
                            .font(.custom("Montserrat Medium", size: 24))
                            .padding([.top, .leading, .bottom], 8.0)
                    
                        Text(patient.EmergencyContactNum)
                    .font(.custom("Montserrat Medium", size: 24)).foregroundColor(Color.white).padding([.top, .bottom, .trailing], 8.0)
                        
                    }.background(RoundedRectangle(cornerRadius: 13)
                                    .fill(Color(#colorLiteral(red: 0.027450980618596077, green: 0.7647058963775635, blue: 0.8078431487083435, alpha: 1))))
                                    .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.25)), radius:4, x:0, y:4)

//

                    Spacer()
                    Button("Contact IT Maak team here") {
                                self.isShowingMessages = true
                            }.sheet(isPresented: self.$isShowingMessages) {
                                MessageComposeView(recipients: ["0550451204"], body: "Message goes here") { messageSent in
                                    print("MessageComposeView with message sent? \(messageSent)")
                                }
                            }.foregroundColor(Color(#colorLiteral(red: 0.027450980618596077, green: 0.7647058963775635, blue: 0.8078431487083435, alpha: 1)))
                    
                    Image(systemName:"rectangle.portrait.and.arrow.forward")
                        .padding(.leading, 300.0).font(.largeTitle)
                    
                }
            }
            .navigationBarTitle("Profile")
                .onAppear(){
                    self.viewModel.fetchData()
                }
                .scrollContentBackground(.hidden)
        }
        
        
    }
}

struct Phomepage_Previews: PreviewProvider {
    static var previews: some View {
        Phomepage()
    }
}


