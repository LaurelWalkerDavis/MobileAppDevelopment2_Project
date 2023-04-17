//
//  NoteView.swift
//  IgnatianPractices
//
//  Created by Laurel Walker Davis on 4/17/23.
//

import SwiftUI

struct NoteView: View {        
    @Binding var note : NoteModel // binding allows users to interact with the variable. need to add $.
    //@Binding var dateNum : String
    @ObservedObject var noteView = NoteViewModel()
    
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                TextField(noteView.getDateString(), text: $note.dateNum)
                    .font(.system(size: 25))
                    .fontWeight(.bold)
                TextEditor(text: $note.noteData)
                    .font(.system(size: 20))
                    .frame(width: 300, height: 400)
                    .cornerRadius(8)
                HStack {
                    Spacer()
                    Button(action: {
                        noteView.saveData(notes: note)
                        note.dateNum = ""  //clear previous content display
                        note.noteData = "" //clear previous content display
                        note.type = "" //clear previous content display
                    }, label: {
                        Text("Save")
                            .foregroundColor(Color.white)
                            .frame(width: 200, height: 50)
                            .cornerRadius(8)
                            .background(Color.brown)
                    })
                    Spacer()
                }
            }
        }.padding()
        
    }
    
    struct NoteView_Previews: PreviewProvider {
        @Binding var note : NoteModel // binding allows users to interact with the variable. need to add $.
        
        static var previews: some View {
            NoteView(note: .constant(NoteModel(type: "lectioDivina", dateNum: "Today's Date", noteData: "This is the word or phrase I noticed.", date: Date())))
        }
    }
}