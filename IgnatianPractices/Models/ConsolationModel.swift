//
//  ConsolationModel.swift
//  IgnatianPractices
//
//  Created by Laurel Walker Davis on 4/13/23.
//

import Foundation
import FirebaseFirestoreSwift //import this and add @DocumentID to allow Firebase to generate IDs

struct ConsolationModel : Codable, Identifiable {
    @DocumentID var id: String?
    var title: String
    var consolationData: String
}
