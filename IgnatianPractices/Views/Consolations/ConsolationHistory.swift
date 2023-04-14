//
//  ConsolationHistory.swift
//  IgnatianPractices
//
//  Created by Laurel Walker Davis on 4/14/23.
//

import SwiftUI

struct ConsolationHistory: View {
    @ObservedObject var consol = ConsolationViewModel()
    @State var details = ConsolationModel(dateNum: "", consolationData: "", date: Date())
    
    var body: some View {
        NavigationView {
            List {
                ForEach($consol.consolations) { $cns in
                    NavigationLink {
                        ConsolationDetail(consolation: $cns)
                    } label: {
                        Text(cns.dateNum)
                    }
                }
            }.navigationBarTitle("Consolations")
        }.padding()
        
            .onAppear {
                consol.fetchData()
            }
            .refreshable { // makes list refresh when you pull it down
                consol.fetchData()
            }
        
    }
}


struct ConsolationHistory_Previews: PreviewProvider {
    static var previews: some View {
        ConsolationHistory()
    }
}
