//
//  DayInReviewView.swift
//  IgnatianPractices
//
//  Created by Laurel Walker Davis on 4/14/23.
//

import SwiftUI

struct DayInReviewView: View {
    @ObservedObject var consol = ConsolationViewModel()
    @State var details = ConsolationModel(dateNum: "", consolationData: "") // for creating a new consolation
    
    @State var email = ""
    // @State
    // @ObservedObject - used to observe changes to an existing instance of an object. owned an managed by an external entity. data is not stored within the view.
    // @StateObject - data is stored within the view.
    
    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("Consolations")) {
                    ForEach($consol.consolations) { $cns in
                        NavigationLink {
                            ConsolationDetail(consolation: $cns)
                        } label: {
                            Text(cns.dateNum)
                        }
                    }
                }
            }
            
        }
        .onAppear {
            consol.fetchData()
        }
        .refreshable { // makes list refresh when you pull it down
            consol.fetchData()
        }
        
    }
}

struct DayInReviewView_Previews: PreviewProvider {
    static var previews: some View {
        DayInReviewView()
    }
}
