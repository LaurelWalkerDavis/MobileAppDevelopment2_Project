//
//  ConsolationViewModel.swift
//  IgnatianPractices
//
//  Created by Laurel Walker Davis on 4/13/23.
//

import Foundation
import FirebaseCore
import FirebaseFirestore

class ConsolationViewModel : ObservableObject {
    
    @Published var consolations = [ConsolationModel]()
    let db = Firestore.firestore()
     
    func fetchData() {
        self.consolations.removeAll()
        db.collection("consolations")
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        do {
                            self.consolations.append(try document.data(as: ConsolationModel.self))
                        } catch {
                            print(error)
                        }
                    }
                }
            }
    }
    
    func saveData(consolations: ConsolationModel) {  // see https://firebase.google.com/docs/firestore/query-data/get-data#swift for help
        
        if let id = consolations.id {
            // Edit consolations
            if !consolations.title.isEmpty || !consolations.consolationData.isEmpty {
                let docRef = db.collection("consolations").document(id)
                
                docRef.updateData([
                    "title": consolations.title,
                    "consolationData" : consolations.consolationData
                ]) { err in
                    if let err = err {
                        print("Error updating document: \(err)")
                    } else {
                        print("Document successfully updated")
                    }
                }
            }
        } else {
            // Add note - this is a new note and does not already have an id
            if !consolations.title.isEmpty || !consolations.consolationData.isEmpty {
                var ref: DocumentReference? = nil
                ref = db.collection("consolations").addDocument(data: [
                    "title": consolations.title,
                    "consolationData": consolations.consolationData
                ]) { err in
                    if let err = err {
                        print("Error adding document: \(err)")
                    } else {
                        print("Document added with ID: \(ref!.documentID)")
                    }
                }
            }
        }
        
    }
}
