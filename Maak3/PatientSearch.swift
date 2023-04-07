//
//  ContentView.swift
//  testAPI
//
//  Created by Noura on 16/07/1444 AH.
//

import SwiftUI

struct PatientSearch: View {
    @StateObject
    var viewModel = ReadViewModel()
    let date = Date()
    @ObservedObject private var viewModel2 = listofPatients()
    var body: some View {
        NavigationStack {
            List(viewModel2.Patients) { patient in
                VStack(alignment: .leading){
                    Text("Name :\(patient.Fname) \(patient.Lname)").font(.custom("Montserrat Medium", size: 24))
                    Text("Phone Number: \(patient.phone) ").font(.subheadline)
                    Text("Age: \(patient.Age) ")
                    Text("Gender: \(patient.Gender) ")
                    Text( "Emergency Contact: \(patient.EmergencyContactNum) ")
                    
                    ShareLink("Export Patient Report", item: render())
                        .padding(.top, 30.0).foregroundColor(Color(#colorLiteral(red: 0.0784313753247261, green: 0.6313725709915161, blue: 1, alpha: 1)))
                    
                }
                
            }.navigationBarTitle("Patients")
                .onAppear(){
                    self.viewModel2.fetchData()
                }
            
        }
    }
    
    func render() -> URL {
        viewModel.readobject()
        // 1: Render Hello World with some modifiers
        let renderer = ImageRenderer(content:
                                        report(viewModel:viewModel)
        )

        // 2: Save it to our documents directory
        let url = URL.documentsDirectory.appending(path: "output.pdf")

        // 3: Start the rendering process
        renderer.render { size, context in
            // 4: Tell SwiftUI our PDF should be the same size as the views we're rendering
            var box = CGRect(x: 0, y: 0, width: size.width, height: size.height)

            // 5: Create the CGContext for our PDF pages
            guard let pdf = CGContext(url as CFURL, mediaBox: &box, nil) else {
                return
            }

            // 6: Start a new PDF page
            pdf.beginPDFPage(nil)

            // 7: Render the SwiftUI view data onto the page
            context(pdf)

            // 8: End the page and close the file
            pdf.endPDFPage()
            pdf.closePDF()
        }

        return url
    }

}

struct PatientSearch_Previews: PreviewProvider {
    static var previews: some View {
        PatientSearch()
    }
}

