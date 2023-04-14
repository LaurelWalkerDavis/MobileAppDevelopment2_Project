//
//  ContentView.swift
//  IgnatianPractices
//
//  Created by Laurel Walker Davis on 4/2/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var verseVM = VerseViewModel()
    
    var body: some View {
        ZStack {
            Color.black
            NavigationView {
                List {
                    //BookView()
                    NavigationLink {
                        VerseView(passage: "PSALM")
                    } label: {
                        Text("Lectio Divina")
                    }
                    NavigationLink {
                        VerseView(passage: "GOSPEL")
                    } label: {
                        Text("Imaging Prayer")
                    }
                    NavigationLink {
                        ConsolationView()
                    } label: {
                        Text("Examen")
                    }
                }.background(Color.black)
                .navigationBarTitle("Ignatian Spirituality")
            }
            .listStyle(.grouped)
            .padding()
            .alert(isPresented: $verseVM.hasError, error: verseVM.error) {
                Text("")
            } // .alert addresses error handling
        }.ignoresSafeArea()
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
