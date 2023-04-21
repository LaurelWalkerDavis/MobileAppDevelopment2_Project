//
//  AuthView.swift
//  IgnatianPractices
//
//  Created by Laurel Walker Davis on 4/20/23.
//

import SwiftUI
import Combine

struct AuthView: View {
    //@State private var currentViewShowing: String = "login" // login or signup
    @EnvironmentObject var viewModel: AuthenticationViewModel
    
//    var body: some View {
//        if(currentViewShowing == "login") {
//            LoginView(currentViewShowing: $currentViewShowing)
//        } else {
//            SignUpView(currentViewShowing: $currentViewShowing)
//        }
//    }
    var body: some View {
      VStack {
        switch viewModel.flow {
        case .login:
          LoginView()
            .environmentObject(viewModel)
        case .signUp:
          SignUpView()
            .environmentObject(viewModel)
        }
      }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
            .environmentObject(AuthenticationViewModel())
    }
}
