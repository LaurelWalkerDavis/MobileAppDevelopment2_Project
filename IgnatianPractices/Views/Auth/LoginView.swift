//
//  LoginView.swift
//  IgnatianPractices
//
//  Created by Laurel Walker Davis on 4/20/23.
//

import SwiftUI
//import FirebaseAuth
import Combine


private enum FocusableField: Hashable {
  case email
  case password
}

struct LoginView: View {
    @EnvironmentObject var viewModel: AuthenticationViewModel
    @Environment(\.dismiss) var dismiss
    
    @FocusState private var focus: FocusableField?
    
    //@Binding var currentViewShowing: String
    @AppStorage("uid") var userID: String = ""
    //@State private var loggedIn = false
    @StateObject var log = AuthenticationViewModel()
    @State var email = ""
    @State var password = ""
    
    private func signInWithEmailPassword() {
      Task {
        if await viewModel.signInWithEmailPassword() == true {
          dismiss()
        }
      }
    }
    
//    var body: some View {
//        if log.isSignedIn {
//            MenuView()
//        } else {
//            content
//        }
//    }
    
    var body: some View {
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
                    TextField("Email Address", text: $viewModel.email)
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                        .focused($focus, equals: .email)
                        .submitLabel(.next)
                        .onSubmit {
                            self.focus = .password
                        }
                }.padding()
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2))
                HStack {
                    Image(systemName: "lock.circle.fill")
                        .font(.system(size: 30))
                        .foregroundColor(.black)
                    SecureField("Password", text: $viewModel.password)
                        .focused($focus, equals: .password)
                        .submitLabel(.go)
                        .onSubmit {
                            signInWithEmailPassword()
                        }
                }.padding()
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2))
                
                if !viewModel.errorMessage.isEmpty {
                    VStack {
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color(UIColor.systemRed))
                    }
                }
                
                Button(action: signInWithEmailPassword) {
                    if viewModel.authenticationState != .authenticating {
                        Text("Login")
                            .padding(.vertical, 8)
                            .frame(maxWidth: .infinity)
                    }
                    else {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .white))
                            .padding(.vertical, 8)
                            .frame(maxWidth: .infinity)
                    }
                }
                .disabled(!viewModel.isValid)
                .frame(maxWidth: .infinity)
                .buttonStyle(.borderedProminent)
                
                //                Button(action: {
                //                    log.login(email: email, password: password)
                ////                    loggedIn = true
                ////                    withAnimation {
                ////                        userID = log.auth.currentUser!.uid
                ////                    }
                //                    NavigationLink(destination: MenuView(), isActive: log.isSignedIn)
                //                }, label: {
                //                    Text("Sign in")
                //                        .foregroundColor(Color.white)
                //                        .frame(width: 200, height: 50)
                //                        .cornerRadius(8)
                //                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.brown))
                //                })
                //                Button(action: {withAnimation {self.currentViewShowing = "signup"}}) {
                //                    Text("Create new account")
                //                        .foregroundColor(.blue.opacity(0.7))
                //                }
                
                HStack {
                    Text("Don't have an account yet?")
                    Button(action: { viewModel.switchFlow() }) {
                        Text("Sign up")
                            .fontWeight(.semibold)
                            .foregroundColor(.blue)
                    }
                }
                
                Spacer()
                Spacer()
                //            }.onAppear {
                //                Auth.auth().addStateDidChangeListener {
                //                    auth, user in if log.isSignedIn { NavigationLink(destination: MenuView()) }
                //                }
                //            }
            }
        }.padding()
    }
}

struct LoginView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      LoginView()
      LoginView()
        .preferredColorScheme(.dark)
    }
    .environmentObject(AuthenticationViewModel())
  }
}
