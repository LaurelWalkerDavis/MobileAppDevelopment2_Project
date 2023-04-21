//
//  SignUpView.swift
//  IgnatianPractices
//
//  Created by Laurel Walker Davis on 4/20/23.
//

import SwiftUI
import FirebaseAuth

struct SignUpView: View {
    @Binding var currentViewShowing: String
    @AppStorage("uid") var userID: String = ""
    @StateObject var log = LoginViewModel()
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Image("Logo2")
                    .resizable()
                    .scaledToFit()
                    .edgesIgnoringSafeArea(.all)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 500)
                    .background(Color.white.opacity(0.2)) // add a color overlay if needed
                Text("Create an Account").font(.largeTitle).bold()
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
                    log.signup(email: email, password: password)
                    withAnimation {
                        userID = log.auth.currentUser!.uid
                    }
                }, label: {
                    Text("Create Account")
                        .foregroundColor(Color.white)
                        .frame(width: 200, height: 50)
                        .cornerRadius(8)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.brown))
                })
                Button(action: {withAnimation {self.currentViewShowing = "login"}}) {
                    Text("Already have an account?")
                        .foregroundColor(.blue.opacity(0.7))
                }
                Spacer()
                Spacer()
            }
        }.padding()
    }
}

//struct SignUpView_Previews: PreviewProvider {
//    static var previews: some View {
//        SignUpView(currentViewShowing: $currentViewShowing)
//    }
//}
