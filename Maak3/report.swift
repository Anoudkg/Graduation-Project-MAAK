//
//  report.swift
//  Maak3
//
//  Created by Alanoudkhalid on 20/07/1444 AH.
//
import Foundation
import SwiftUI

struct report: View {
    let date = Date()
    @StateObject
    var viewModel : ReadViewModel
  
    var body: some View {
        
        VStack(alignment: .leading){
  
            Spacer()
            
                Text("Report")
                     .font(.largeTitle)
                     .fontWeight(.bold)
                     .foregroundColor(.black)
                    .padding([.bottom, .trailing],20)

                    Text(date, style: .date)
                    Text(date, style: .time)
                                        
                     Spacer()
                                             
            
                     Text(" AvgHR reading :")
                        .font(.footnote)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                        .padding([.bottom, .trailing],50)
        
        
            if viewModel.object != nil{
             VStack{
                 Text("Reading of the last 12 H of Heart beat:-")
                 Text("HB 1:\(viewModel.object!.HR1)")
                 Text("HB 2:\(viewModel.object!.HR2)")
                 Text("HB 3:\(viewModel.object!.HR3)")
                 Text("HB 4:\(viewModel.object!.HR4)")
                 Text("HB 5:\(viewModel.object!.HR5)")
                 Text("HB 6:\(viewModel.object!.HR6)")
                 Text("HB 7:\(viewModel.object!.HR7)")
                 Text("HB 8:\(viewModel.object!.HR8)")
                 VStack{
                     Text("HB 9:\(viewModel.object!.HR9)")
                     Text("HB 10:\(viewModel.object!.HR10)")
                     Text("HB 11:\(viewModel.object!.HR11)")
                     Text("HB 12:\(viewModel.object!.HR12)")
                     var avg = viewModel.object!.HR1 + viewModel.object!.HR2 + viewModel.object!.HR3  + viewModel.object!.HR4
                     + viewModel.object!.HR5 + viewModel.object!.HR6 + viewModel.object!.HR7 + viewModel.object!.HR8 +
                     viewModel.object!.HR9 + viewModel.object!.HR10 + viewModel.object!.HR11  + viewModel.object!.HR12
                     
                     var avg2 = avg/12
                     Text("The Avrage of HB = \(avg2)")
                 }
             }
            }else { Text("no value")}
                Spacer()
            
            
               
    
        }
    }
    
    
}
