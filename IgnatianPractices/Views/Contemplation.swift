//
//  Contemplation.swift
//  IgnatianPractices
//
//  Created by Laurel Walker Davis on 4/17/23.
//

import SwiftUI
import Foundation

struct Contemplation: View {
    @ObservedObject var contemp = ContemplationViewModel()
    
    
    var body: some View {
        let image = contemp.getTodaysImage()
        ScrollView {
            VStack(alignment: .center) {
                //List {
                Section {
                    Image(image.fileName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 400, height: 400, alignment: .center)
                } header: {
                    Text(image.description)
                }
                Section {
                    Text(image.credit).font(.system(size: 12))
                }
                //}.listStyle(SidebarListStyle())
            }
        }
    }


struct Contemplation_Previews: PreviewProvider {
    static var previews: some View {
        Contemplation()
    }
}
}
