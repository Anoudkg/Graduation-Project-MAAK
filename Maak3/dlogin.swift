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
import FirebaseFirestore
import Foundation


//let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)


struct dlogin: View {
    
    @State private var email = ""
    @State private var password = ""
    @State var username: String = ""
    //@State var password: String = ""
    @State var isPressing = false
     
    @State var authenticationDidFail: Bool = false
    
    
    func dlogIn(){
        Auth.auth().signIn(withEmail: email, password: password){ result,
            error in
            guard result != nil, error == nil else {
                print("got in")
                return
            }
            print("got in")
            
        }
    }
 
     
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
                 
                TextField("Email", text: $email)
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
                 
                Button (action: {
                    dlogIn()
                    isPressing = true
                }
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
                .fill(Color(#colorLiteral(red: 0.0784313753247261, green: 0.6313725709915161, blue: 1, alpha: 1))))
                NavigationLink("", destination: DocTabBar(), isActive: $isPressing )
                                 
               VStack {
                    NavigationLink(destination: Dregister()) {
                        Text("Not registerd yet? create an account")
                            .foregroundColor(Color(#colorLiteral(red: 0.0784313753247261, green: 0.6313725709915161, blue: 1, alpha: 1)))
                    }
                }
               .padding()
            }
            .padding()
        }
    }
    
}

struct dlogin_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            dlogin()
            Dregister()
        }
    }
}
struct Dregister : View {
   
    @StateObject var dataManager = DataManager()
    let citiesRef = Firestore.firestore().collection("Doctors")
    var db = Firestore.firestore()
    
    
    @State private var Fname = ""
    @State private var Lname = ""
    @State private var email = ""
    @State private var pass = ""
    @State private var hospital = ""
    @State private var phone = ""
    @State private var speciality = ""
    //@State private var password = ""
    @State private var termsAccepted = false
    @State var isPressing = false
    @State var isUse = false
    
    func dsignUp() {
        registeruser()
        dataManager.addPDoctor(email: email, pass: pass, Fname: Fname, Lname: Lname, phone: phone, hospital: hospital, speciality: speciality , P_ID:"")
     }
    
    func registeruser() {
        Auth.auth().createUser(withEmail: email, password: pass ) {
            result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
    }
    func checkEmail(email: String) -> Bool {
                var result = false

        self.db.collection("Doctors").document("Doctors").collection("Doctors").whereField("email", isEqualTo: email)
                    .getDocuments() { (querySnapshot, err) in
                        if let err = err {
                            print("Error getting documents: \(err)")
                            result = false
                        } else {
                            for document in querySnapshot!.documents {
                                result = true
                                print("\(document.documentID) => \(document.data())")
                            }
                        }
                }
                return result

            

    }
    
    var body: some View {
        
       
      
        NavigationView {
            Form {
                Section() {
                    TextField("Email",text: $email)
                    TextField("Password",text: $pass)
                    TextField("First name",text: $Fname)
                    TextField("Last name",text: $Lname)
                    TextField("Hospital",text: $hospital)
                    TextField("Speciality",text: $speciality)
                    TextField("Phone Number",text: $phone)

                    
                   /* Button(action: {
                        var isUse = checkEmail(email:email)
                        isPressing = true
                        
                    })
                    NavigationLink("", destination: TypeOfLoginView(), isActive: $isPressing )
                    {
                     Text("Register")
                            .font(.title3)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 200, height: 50)
                            .background(Color(#colorLiteral(red: 0.0784313753247261, green: 0.6313725709915161, blue: 1, alpha: 1)))
                            .cornerRadius(15.0)
                            .shadow(radius: 5)
                   }.padding(.leading, 57.0) */
                    
                    
                                
            }.navigationBarTitle(Text("SignUp"))
                Button (action: {
                    isPressing = true
                    isUse = checkEmail(email:email)
                    dsignUp()
                    registeruser()
                }, label: {
                    //NavigationLink(destination: TypeOfLoginView()){}
                    Text("register")
                    
                        
                    
                })
                    .padding(.all, 10.0)
                .background(RoundedRectangle(cornerRadius: 30)
                .fill(LinearGradient(gradient: .init(colors: [Color(#colorLiteral(red: 0.6235294342041016, green: 0.9215686321258545, blue: 0.9215686321258545, alpha: 1)), Color(#colorLiteral(red: 0.007843137718737125, green: 0.7607843279838562, blue: 0.8039215803146362, alpha: 1)).opacity(0.75)]),
                                     startPoint: UnitPoint(x: 0.7528089823225927, y: 0.37000002298992357),
                                     endPoint: UnitPoint(x: 0.3651685299232982, y: 0.7900000890365071))))
                .shadow(color: Color(#colorLiteral(red: 0.19648748636245728, green: 0.19648748636245728, blue: 0.27947598695755005, alpha: 0.07999999821186066)), radius:4, x:0, y:24)
                if (isUse){
                    Text("This email is already used")
                      
                 
                }else { NavigationLink("", destination: DocTabBar(), isActive: $isPressing ) }

            }
        }.navigationBarBackButtonHidden(true)
        
    }
    
}




