//
//  ContentView.swift
//  IgnatianPractices
//
//  Created by Laurel Walker Davis on 4/2/23.
//

import SwiftUI

struct MenuView: View {
    
    @ObservedObject var verseVM = VerseViewModel()
    
    var body: some View {
            ZStack {                
//                Image("ChiRho")
//                    .resizable()
//                    .scaledToFit()
//                    .edgesIgnoringSafeArea(.all)
//                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
//                    .background(Color.white.opacity(0.8)) // add a color overlay if needed
                NavigationView {
                    List {
                        Section {
                            NavigationLink {
                                LectioDivina()
                            } label: {
                                Text("Lectio Divina")
                                    .font(.system(size: 25))
                            }
                            NavigationLink {
                                ImaginativePrayer()
                            } label: {
                                Text("Imaginative Prayer")
                                    .font(.system(size: 25))
                            }
                            NavigationLink {
                                Examen()
                            } label: {
                                Text("Examen")
                                    .font(.system(size: 25))
                            }
                            NavigationLink {
                                Contemplation()
                            } label: {
                                Text("Contemplation")
                                    .font(.system(size: 25))
                            }
                            NavigationLink {
                                LifeReviewView()
                            } label: {
                                Text("Life Review")
                                    .font(.system(size: 25))
                            }
                        } header: {
                            Text("Daily exercises in the Ignatian tradition")
                            //.font(.headline)
                                .font(.system(size:15))
                        }
                    }
                    .navigationBarTitle("Pocket Monk")
                }
                .listStyle(.grouped)
                .alert(isPresented: $verseVM.hasError, error: verseVM.error) {
                    Text("")
                } // .alert addresses error handling
            }.environment(\.defaultMinListRowHeight, 80)
    }
    
}



struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MenuView()
            MenuView().environment(\.colorScheme, .dark)
        }
    }
}
