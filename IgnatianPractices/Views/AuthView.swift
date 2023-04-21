//
//  AuthView.swift
//  IgnatianPractices
//
//  Created by Laurel Walker Davis on 4/20/23.
//

import SwiftUI

struct AuthView: View {
    @State private var currentViewShowing: String = "login" // login or signup
    
    var body: some View {
        if(currentViewShowing == "login") {
            LoginView(currentViewShowing: $currentViewShowing)
        } else {
            SignUpView(currentViewShowing: $currentViewShowing)
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
