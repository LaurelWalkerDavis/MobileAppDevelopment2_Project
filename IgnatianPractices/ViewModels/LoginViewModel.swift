////
////  LoginViewModel.swift
////  IgnatianPractices
////
////  Created by Laurel Walker Davis on 4/20/23.
////
//
//import Foundation
//import FirebaseCore
//import FirebaseFirestore
//import FirebaseAuth
//import SwiftUI
//
//class LoginViewModel : ObservableObject {
//    @Published var email = ""
//    @Published var password = ""
//    
//    let auth = Auth.auth()
//    
//    var isSignedIn: Bool {
//        return auth.currentUser != nil
//    }
//    
//    func login(email: String, password: String) {
//        Auth.auth().signIn(withEmail: email, password: password) {
//            result, error in guard result != nil, error == nil else {
//                return
//            } //successful login
//        }
//    }
//    func signup(email: String, password: String) {
//        auth.createUser(withEmail: email, password: password) {
//            result, error in guard result != nil, error == nil else {
//                return
//            } //successful signup
//        }
//    }
//}
