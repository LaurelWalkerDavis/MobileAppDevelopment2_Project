//
//  LifeReviewView.swift
//  IgnatianPractices
//
//  Created by Laurel Walker Davis on 4/14/23.
//

import SwiftUI

struct LifeReviewView: View {
    @State var lectioDetails = NoteModel(type: "lectioDivina", dateNum: "", noteData: "", date: Date()) // for viewing a lectioDivina note
    @State var imaginDetails = NoteModel(type: "imaginPrayer", dateNum: "", noteData: "", date: Date()) // for viewing an imaginPrayer note)
    
    // @State
    // @ObservedObject - used to observe changes to an existing instance of an object. owned an managed by an external entity. data is not stored within the view.
    // @StateObject - data is stored within the view.
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Life Review")
                .font(.largeTitle)
                .bold()
                .padding()
            List {
                Section {
                    Text("The Life Review is a tool to help you look back over the last few days or weeks to notice patterns that may warrant your attention.")
                } header: {
                    Text("Exercise Description")
                        .font(.system(size: 18))
                }
                Section {
                    Text("How have your moments in prayer and consolation affected the various parts of your life?")
                } header: {
                    Text("Guiding Question")
                        .font(.system(size: 18))
                }
                Section {
                    NoteEntry(details: lectioDetails)
                } header: {
                    Text("Lectio Divina")
                        .font(.system(size: 18))
                }
                Section {
                    NoteEntry(details: imaginDetails)
                } header: {
                    Text("Imaginative Prayer")
                        .font(.system(size: 18))
                }
                Section {
                    ConsolationEntry()
                } header: {
                    Text("Consolations")
                        .font(.system(size: 18))
                }
                Section {
                    DesolationEntry()
                } header: {
                    Text("Desolations")
                        .font(.system(size: 18))
                }
            }.listStyle(SidebarListStyle())
        }
        
    }
                
//                Section {
//                    NavigationLink {
//                        VerseView(passage: "PSALM")
//                    } label: {
//                        Text("Lectio Divina")
//                            .font(.system(size: 25))
//                    }
//                    NavigationLink {
//                        VerseView(passage: "GOSPEL")
//                    } label: {
//                        Text("Imaging Prayer")
//                            .font(.system(size: 25))
//                    }
//
//                    NavigationLink {
//                        DesolationHistory()
//                    } label: {
//                        Text("Desolations")
//                            .font(.system(size: 25))
//                    }
//                } header: {
//                    Text("Daily Insights")
//                        .font(.system(size: 18))
//                }

    
    
    struct LifeReviewView_Previews: PreviewProvider {
        static var previews: some View {
            LifeReviewView()
        }
    }
}
