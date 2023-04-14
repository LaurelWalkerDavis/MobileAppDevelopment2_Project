//
//  ConsolationDetail.swift
//  IgnatianPractices
//
//  Created by Laurel Walker Davis on 4/13/23.
//

import SwiftUI

struct ConsolationDetail: View {
        
        @Binding var consolation : ConsolationModel // binding allows users to interact with the variable. need to add $.
        @ObservedObject var consol = ConsolationViewModel()
        
        var body: some View {
            VStack(alignment: .leading) {
                TextField("Consolation Title", text: $consolation.title)
                    .font(.system(size: 25))
                    .fontWeight(.bold)
                TextEditor(text: $consolation.consolationData) // TextEditor is better for multi-line fields
                    .font(.system(size: 20))
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        consol.saveData(consolations: consolation)
                        consolation.title = ""  //clear previous content display
                        consolation.consolationData = "" //clear previous content display
                    } label: {
                        Text("Save")
                    }

                }
            }
        }
    }

struct ConsolationDetail_Previews: PreviewProvider {
    static var previews: some View {
        ConsolationDetail(consolation: .constant(ConsolationModel(title: "Consolation 1", consolationData: "This is how I felt consoled.")))
    }
}
