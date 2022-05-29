//
//  RegisterView.swift
//  instagramClone
//
//  Created by berk tuna on 26/05/2022.
//

import SwiftUI

struct RegisterView: View {
    @State private var fullName = ""
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""
    @State private var selectedImage: UIImage?
    @State private var image: Image?
    @State var imagePickerPresented = false
    @Environment(\.presentationMode) var mode
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.purple, Color.orange]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
            ZStack{
            
                if let image = image {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 140, height: 140)
                        .clipShape(Circle())
                        .padding([.top, .bottom])
                        .foregroundColor(Color(.init(white: 1, alpha: 0.7)))
                } else {
                    Button(action: { imagePickerPresented.toggle() }, label: {
                        Image(systemName: "plus.square")
                            .resizable()
                            .renderingMode(.template)
                            .scaledToFill()
                            .frame(width: 90, height: 90)
                            .clipped()
                            .padding([.top, .bottom])
                            .foregroundColor(Color(.init(white: 1, alpha: 0.7)))
                    }).sheet(
                        isPresented: $imagePickerPresented,
                        onDismiss: loadImage,
                        content: {
                            ImagePicker(image: $selectedImage)
                        })
                    .padding()

                }
                
            }
               

                VStack(spacing: 20) {
                    //email field
                    CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal, 32)
                    
                    //username field
                    CustomTextField(text: $username, placeholder: Text("Username"), imageName: "person")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal, 32)
                    
                    //fullname field
                    CustomTextField(text: $fullName, placeholder: Text("Full Name"), imageName: "person")
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

                //sign in
                
                Button(action: {}, label: {
                    Text("Sign Up")
                        .font(.headline)
                        .frame(width: 330, height: 50)
                        .background(.orange)
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                        .padding()
                })
                Spacer()
                
                //navigate to sign up
                
                Button(action: { mode.wrappedValue.dismiss() }, label: {
                    HStack {
                        Text("Already have an account?")
                            .font(.system(size: 14))
                        Text("Sign In")
                            .font(.system(size: 14, weight: .semibold))
                    }.foregroundColor(.white)
                }).padding(.bottom, -4)
            }.padding()
            }
        }
}
extension RegisterView {
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        image = Image(uiImage: selectedImage)
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
