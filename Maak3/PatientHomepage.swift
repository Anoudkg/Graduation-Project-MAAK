
import Foundation
import UIKit
import SwiftUI
import FirebaseCore
import FirebaseCore
import FirebaseDatabase
import FirebaseCoreInternal
import MessageUI


@MainActor
struct PatientHomepage: View {
    
    @StateObject
    var viewModel = ReadViewModel()
    let date = Date()
    //var Rebort  = report()
    @State private var isShowingMessages = false
    @State var showingBottomSheet = false
    var bool=false
    var body: some View {
        
        VStack {
            Spacer()
            VStack{
                Spacer()
            ZStack{
                Image("heart1")
                if viewModel.value != nil {
                    Text(" \(viewModel.value!) ")
                        .font(.title)
                        .padding()
                        .background(Color.white);
                }else{
                    Text(" ")
                        .font(.title3)
                        .padding()
                        .background(Color.white);
                }
             
            }
            Button{
                viewModel.observerDateChange()
            }
        label:{
            Text("READ PR")
                .foregroundColor(.white)
                .padding()
        }.background(RoundedRectangle(cornerRadius: 17).fill(Color(#colorLiteral(red: 0.027450980618596077, green: 0.7647058963775635, blue: 0.8078431487083435, alpha: 1))))
        }
            VStack{
                Spacer()
             /*   if viewModel.object != nil {
                    Text("\(viewModel.object!.HR)  P/MIN")
                        .font(.largeTitle)
                        .padding()
                        .background(Color.white);
                    Text("\(viewModel.object!.steps)  P/MIN")
                        .font(.largeTitle)
                        .padding()
                        .background(Color.white);
                }else{
                    Text(" -  P/MIN")
                        .font(.largeTitle)
                        .padding()
                        .background(Color.white);
                }
                Button{
                    viewModel.readobject()
                }
            label:{
                Text("read object")
                    .foregroundColor(.white)
                    .padding()
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 0.513, saturation: 0.389, brightness: 0.878)/*@END_MENU_TOKEN@*/)
            }  */
                Button{
                     guard let number = URL(string: "tel://" + "991") else { return }
                    UIApplication.shared.open(number)
                }
               
            label:{
                Text(" Call SOS ")
                    .foregroundColor(.white)
                    .padding()
            }.background(RoundedRectangle(cornerRadius: 17).fill(Color(#colorLiteral(red: 0.027450980618596077, green: 0.7647058963775635, blue: 0.8078431487083435, alpha: 1))))
                
                Button{
                    showingBottomSheet.toggle()
                }
            label:{
                Text("Check up")
                    .foregroundColor(.white)
                    .padding()
            }.background(RoundedRectangle(cornerRadius: 17).fill(Color(#colorLiteral(red: 0.027450980618596077, green: 0.7647058963775635, blue: 0.8078431487083435, alpha: 1))))
                
                ShareLink("Export PDF", item: render())
                    .padding(.top, 30.0)
                Spacer()
            }
            
            //Spacer()
        }.navigationBarBackButtonHidden(true)
        //
        .sheet(isPresented: $showingBottomSheet){
            if bool{
                abnormal()
            }else{
                normal()
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
    


struct PatientHomepage_Previews: PreviewProvider {
    static var previews: some View {
        PatientHomepage()
    }
}
