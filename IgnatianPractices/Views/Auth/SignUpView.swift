//
//  SignUpView.swift
//  IgnatianPractices
//
//  Created by Laurel Walker Davis on 4/20/23.
//

import SwiftUI
import FirebaseAuth
import Combine

private enum FocusableField: Hashable {
  case email
  case password
  case confirmPassword
}

struct SignUpView: View {
    //@Binding var currentViewShowing: String
    @AppStorage("uid") var userID: String = ""
    @AppStorage("identifier") var userEmail: String = ""
    @State private var loggedIn = false
    @StateObject var log = AuthenticationViewModel()
    @State var email = ""
    @State var password = ""
    
//    var body: some View {
//        if log.isSignedIn {
//            MenuView()
//        } else {
//            content
//        }
//    }
    
    @EnvironmentObject var viewModel: AuthenticationViewModel
    @Environment(\.dismiss) var dismiss

    @FocusState private var focus: FocusableField?

    private func signUpWithEmailPassword() {
      Task {
        if await viewModel.signUpWithEmailPassword() == true {
          dismiss()
        }
      }
    }
    
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
                        .submitLabel(.next)
                        .onSubmit {
                            self.focus = .confirmPassword
                        }
                }.padding()
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2))
                //                Button(action: {
                //                    log.signup(email: email, password: password)
                //                    withAnimation {
                //                        userID = log.auth.currentUser!.uid
                //                    }
                //                    withAnimation {
                //                        userEmail = log.auth.currentUser!.email!
                //                    }
                //                }, label: {
                //                    Text("Create Account")
                //                        .foregroundColor(Color.white)
                //                        .frame(width: 200, height: 50)
                //                        .cornerRadius(8)
                //                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.brown))
                //                })
                //                Button(action: {withAnimation {self.currentViewShowing = "login"}}) {
                //                    Text("Already have an account?")
                //                        .foregroundColor(.blue.opacity(0.7))
                //                }
                
                Button(action: signUpWithEmailPassword) {
                    if viewModel.authenticationState != .authenticating {
                        Text("Sign up")
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
                
                HStack {
                  Text("Already have an account?")
                  Button(action: { viewModel.switchFlow() }) {
                    Text("Log in")
                      .fontWeight(.semibold)
                      .foregroundColor(.blue)
                  }
                }
                .padding([.top, .bottom], 50)
                
                Spacer()
                Spacer()
            }
//            }.onAppear {
//                Auth.auth().addStateDidChangeListener {
//                    auth, user in if log.isSignedIn { loggedIn = true}
//                }
//            }
        }.padding()
    }
}

struct SignupView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      SignUpView()
      SignUpView()
        .preferredColorScheme(.dark)
    }
    .environmentObject(AuthenticationViewModel())
  }
}
