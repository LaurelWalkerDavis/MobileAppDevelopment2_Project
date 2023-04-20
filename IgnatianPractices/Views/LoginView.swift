////
////  LoginView.swift
////  IgnatianPractices
////
////  Created by Laurel Walker Davis on 4/20/23.
////
//
//import SwiftUI
//
//struct LoginView: View {
//    @StateObject var log = LoginViewModel()
//    @State var email = ""
//    @State var password = ""
//        
//    var body: some View {
//        NavigationView {
//            VStack {
//                TextField("Email Address", text: $email)
//                    .padding()
//                SecureField("Password", text: $password)
//                    .padding()
//                Button(action: {
//                    log.signup(email: email, password: password)
//                }, label: {
//                    Text("Sign in")
//                        .foregroundColor(Color.white)
//                        .frame(width: 200, height: 50)
//                        .cornerRadius(8)
//                        .background(Color.green)
//                })
//            }
//        }
//    }
//}
//
//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView()
//    }
//}
