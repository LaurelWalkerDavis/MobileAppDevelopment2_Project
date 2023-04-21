//
//  LoginView.swift
//  IgnatianPractices
//
//  Created by Laurel Walker Davis on 4/20/23.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    @Binding var currentViewShowing: String
    @AppStorage("username") var username: String = ""
    @State private var loggedIn = false
    @StateObject var log = LoginViewModel()
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        if loggedIn {
            MenuView()
        } else {
            content
        }
    }
    
    var content: some View {
        NavigationView {
            VStack {
                Image("Logo2")
                    .resizable()
                    .scaledToFit()
                    .edgesIgnoringSafeArea(.all)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 500)
                    .background(Color.white.opacity(0.2)) // add a color overlay if needed
                Text("Welcome Back!").font(.largeTitle).bold()
                HStack {
                    Image(systemName: "at.circle.fill")
                        .font(.system(size: 30))
                        .foregroundColor(.black)
                    TextField("Email Address", text: $email)
                }.padding()
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2))
                HStack {
                    Image(systemName: "lock.circle.fill")
                        .font(.system(size: 30))
                        .foregroundColor(.black)
                    SecureField("Password", text: $password)
                }.padding()
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2))
                Button(action: {
                    log.login(email: email, password: password)
                    withAnimation {
                        username = log.auth.currentUser!.email!
                    }
                }, label: {
                    Text("Sign in")
                        .foregroundColor(Color.white)
                        .frame(width: 200, height: 50)
                        .cornerRadius(8)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.brown))
                })
                Button(action: {withAnimation {self.currentViewShowing = "signup"}}) {
                    Text("Create new account")
                        .foregroundColor(.blue.opacity(0.7))
                }
                Spacer()
                Spacer()
            }.onAppear {
                Auth.auth().addStateDidChangeListener {
                    auth, user in if log.isSignedIn { loggedIn = true}
                }
            }
        }.padding()
    }
}

//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView(currentViewShowing: $currentViewShowing)
//    }
//}
