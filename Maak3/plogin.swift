//
//  ContentView.swift
//  x2x
//
//  Created by Noura on 23/07/1444 AH.
//

import SwiftUI
import FirebaseCore
import FirebaseStorage
import Firebase
import FirebaseAuth

let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)
 
struct plogin: View {
     
    @StateObject var dataManager = DataManager()
    @State var username: String = ""
    @State var password: String = ""
    @State var isPressing = false
     
    @State var authenticationDidFail: Bool = false
     
    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome! ")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .padding(.bottom, 20)
                 
                Image("login")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .clipped()
                    .cornerRadius(150)
                    .padding(.bottom, 75)
                 
                TextField("Email", text: $username)
                    .padding()
                    .background(lightGreyColor)
                    .cornerRadius(15.0)
                    .padding(.bottom, 20)
                    .shadow(radius: 5)
                 
                SecureField("Password", text: $password)
                    .padding()
                    .background(lightGreyColor)
                    .cornerRadius(15.0)
                    .padding(.bottom, 20)
                    .shadow(radius: 5)
                 
                Button (action: {isPressing = true}
                , label: {
                    Text("Login")
                        .font(.title)
                        .fontWeight(.light)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        .lineLimit(nil)
                        .frame(width: 210.0, height: 40.0)
                        .accentColor(.white)
                    
                        
                    
                })
                    .padding(/*@START_MENU_TOKEN@*/.all, 10.0/*@END_MENU_TOKEN@*/)
                .background(RoundedRectangle(cornerRadius: 20)
                .fill(Color(#colorLiteral(red: 0.007843137718737125, green: 0.7607843279838562, blue: 0.8039215803146362, alpha: 1))))
                NavigationLink("", destination: tabBar(), isActive: $isPressing )
                                 
               VStack {
                    NavigationLink(destination: Pregister()) {
                        Text("Not registerd yet? create an account")
                            .foregroundColor(Color(#colorLiteral(red: 0.007843137718737125, green: 0.7607843279838562, blue: 0.8039215803146362, alpha: 1)))
                    }
                }
               .padding()
            }
            .padding()
        }
    }
         
}
 
struct plogin_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            plogin()
            Pregister()
        }
    }
}
struct Pregister : View {
     
    @StateObject var dataManager = DataManager()
    
    @State private var Fname = ""
    @State private var Lname = ""
    @State private var email = ""
    @State private var pass = ""
    @State private var Gender = ""
    @State private var Age = ""
    @State private var phone = ""
    @State private var EmergencyContNum = ""
    @State private var termsAccepted = false
    @State var isPressing = false
    
 
    var body: some View {
        NavigationView {
            Form {
                Section() {
                    TextField("Email",text: $email)
                    TextField("Password",text: $pass)
                    TextField("First name",text: $Fname)
                    TextField("Last name",text: $Lname)
                    TextField("Age",text: $Age)
                    TextField("Gender",text: $Gender)
                    TextField("Phone Number",text: $phone)
                    TextField("Emergency Contact",text: $EmergencyContNum)
                   
                    
                    Button(action: {
                        isPressing = true
                        dataManager.addPatient(email : email  ,  pass :pass , Fname  : Fname  ,  Lname :Lname  , Age  : Age , Gender  : Gender ,  phone  : phone , EmergencyContNum : EmergencyContNum  )
                    }
                    , label:{
                     Text("Register")
                            .font(.title3)
                            .foregroundColor(.white)
                            .frame(width: 200, height: 50)
                            .background(Color(#colorLiteral(red: 0.007843137718737125, green: 0.7607843279838562, blue: 0.8039215803146362, alpha: 1)))
                            .cornerRadius(15.0)
                            .shadow(radius: 5)
                   }).padding(.leading, 58.0)
                    NavigationLink("", destination: tabBar(), isActive: $isPressing )
                    

                }
                                
            }.navigationBarTitle(Text("SignUp"))
            
        }.navigationBarBackButtonHidden(true)
        
    }
}
