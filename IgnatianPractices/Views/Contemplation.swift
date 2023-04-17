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
            VStack(alignment: .leading) {
                Text("Contemplation")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                List {
                    Section {
                        Text("One good way to practice contemplation is with the use of images of Christ or other significant Christian figures.")
                            .padding(.vertical, 4)
                    } header: {
                        Text("Exercise Description")
                            .font(.system(size: 18))
                    }
                    Section {
                        Text("1. Take a few moments to look closely at the image below.")
                        Text("2. What do you notice about Christ in the image?")
                        Text("3. Where do you see yourself in the image?")
                        Text("4. Write down what you have noticed.")
                            .padding(.vertical, 4)
                    } header: {
                        Text("Invitation")
                            .font(.system(size: 18))
                    }
                Section {
                    Image(image.fileName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 400, height: 400, alignment: .center)
                    Text(image.credit).font(.system(size: 12))
                } header: {
                    Text(image.description).font(.system(size: 18))
                }
                Section {
                    
                }
                }.listStyle(SidebarListStyle())
        }
    }


struct Contemplation_Previews: PreviewProvider {
    static var previews: some View {
        Contemplation()
    }
}
}
