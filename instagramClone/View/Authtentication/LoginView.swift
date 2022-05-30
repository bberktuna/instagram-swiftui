//
//  LoginView.swift
//  instagramClone
//
//  Created by berk tuna on 26/05/2022.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        NavigationView {
                ZStack {
                    LinearGradient(gradient: Gradient(colors: [Color.purple, Color.orange]), startPoint: .top, endPoint: .bottom)
                        .ignoresSafeArea()
                    VStack{
                            Image("instagram-text")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 220, height: 100)
                            

                        VStack(spacing: 20) {
                            //email field
                            CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
                                .padding()
                                .background(Color(.init(white: 1, alpha: 0.15)))
                                .cornerRadius(10)
                                .foregroundColor(.white)
                                .padding(.horizontal, 32)
                            
                            //password field
                            
                            CustomSecureField(text: $password, placeholder: Text("Password"))
                                .padding()
                                .background(Color(.init(white: 1, alpha: 0.15)))
                                .cornerRadius(10)
                                .foregroundColor(.white)
                                .padding(.horizontal, 32)
                        }
                        //forgot password
                        HStack {
                            Spacer()
                            Button(action: {}, label: {
                                Text("Forgot Password?")
                                    .font(.system(size: 13, weight: .semibold))
                                    .foregroundColor(.white)
                                    .padding(.top)
                                    .padding(.trailing, 30)
                            })
                        }
                        //sign in
                        
                        Button(
                            action: {
                                viewModel.login()
                            },
                            label: {
                            Text("Sign In")
                                .font(.headline)
                                .frame(width: 330, height: 50)
                                .background(.orange)
                                .foregroundColor(.white)
                                .clipShape(Capsule())
                                .padding()
                        })
                        Spacer()
                        
                        //navigate to sign up
                        NavigationLink(destination: RegisterView().navigationBarHidden(true), label: {
                            HStack {
                                Text("Don't have an account?")
                                    .font(.system(size: 14))
                                Text("Sign Up")
                                    .font(.system(size: 14, weight: .semibold))
                            }.foregroundColor(.white)
                        }).padding(.bottom, -4)

                    }.padding(.top, -44)
                }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
