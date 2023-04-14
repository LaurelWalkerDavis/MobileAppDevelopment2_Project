//
//  ConsolationView.swift
//  IgnatianPractices
//
//  Created by Laurel Walker Davis on 4/13/23.
//

import SwiftUI

struct ConsolationView: View {
    
    @ObservedObject var consol = ConsolationViewModel()
    @State var details = ConsolationModel(dateNum: "", consolationData: "") // for creating a new consolation
    
    @State var email = ""
    // @State
    // @ObservedObject - used to observe changes to an existing instance of an object. owned an managed by an external entity. data is not stored within the view.
    // @StateObject - data is stored within the view.
    
    var body: some View {
        NavigationView {
            List {
                Text("Daily Consolations")
                    .font(.largeTitle)
                //.padding(.leading)
                Section {
                    Text("A spiritual consolation “is a profound experience of interior joy, consisting in seeing God’s presence in everything. It strengthens faith and hope and also the ability to do good,” - Pope Francis")
                    Text("Review your day and note 2 or 3 consolations you experienced.")
                }
                
                Section {
                    NavigationLink {
                        ConsolationDetail(consolation: $details)
                    } label: {
                        Text("New consolation")
                            .foregroundColor(Color.green)
                            .font(.system(size: 15))
                    }
                }
                Section {
                    ForEach($consol.consolations) { $cns in
                        NavigationLink {
                            ConsolationDetail(consolation: $cns)
                        } label: {
                            Text(cns.dateNum)
                        }
                    }
                }
            }.padding()
            
            
                .onAppear {
                    consol.fetchData()
                }
                .refreshable { // makes list refresh when you pull it down
                    consol.fetchData()
                }
            
        }
    }
    
    struct ConsolationView_Previews: PreviewProvider {
        static var previews: some View {
            ConsolationView()
        }
    }
}
