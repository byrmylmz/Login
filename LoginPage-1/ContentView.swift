//
//  ContentView.swift
//  LoginPage-1
//
//  Created by Bayram Yilmaz on 17/05/2022.
//

import SwiftUI

let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 100)

let storedUsername = "Bayram"
let storedpassword = "abcabc"

struct ContentView: View {

    @State var username: String = ""
    @State var password: String = ""
    
    @State var authenticationDidFail: Bool = false
    @State var authenticationDidSucceed: Bool = false
    
    var body: some View {
        ZStack{
            VStack {
                HelloText()
                UserImage()
                UserNameTextField(username: $username)
                PasswordSecureField(password: $password)
                if authenticationDidFail {
                    Text("Information is not correct. Try Again.")
                        .foregroundColor(.red)
                }
                
                Button(action:{
                    if self.username == storedUsername && self.password == storedpassword
                    {
                        self.authenticationDidSucceed = true
                        self.authenticationDidFail = false
                    }else
                    {
                        self.authenticationDidFail = true
                        self.authenticationDidSucceed=false
                    }
                }){
                    LoginButtonContent()
                }
                
            }
            .padding()
            if authenticationDidSucceed{
                Text("Login Succeded!")
                    .font(.headline)
                    .frame(width: 220.0, height: 30.0)
                    .background(Color.yellow)
                    .cornerRadius(20.0)
            }
        }

    }
}

//view
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// hello text
struct HelloText: View {
    var body: some View {
        Text("Hello Bayram!")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(/*@START_MENU_TOKEN@*/.bottom, 20.0/*@END_MENU_TOKEN@*/)
    }
}

// User image
struct UserImage: View {
    var body: some View {
        Image("userImage")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .cornerRadius(150)
            .frame(width: 170.0, height: 170.0)
            .clipShape(Circle())
            .overlay{
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
            .padding(.bottom, 20.0)
            
    }
}

//Login button
struct LoginButtonContent: View {
    var body: some View {
        Text("LOGIN")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 220, height: 60)
            .background(Color.black)
            .cornerRadius(35.0)
    }
}

struct UserNameTextField: View {
    
    @Binding var username: String
    
    var body: some View {
        TextField("Username", text: $username)
            .padding()
            .background(lightGreyColor)
            .cornerRadius(5.0)
            .padding(.bottom,20)
    }
}

struct PasswordSecureField: View {
    
    @Binding var password: String
    
    var body: some View {
        SecureField("Password",text: $password)
            .padding()
            .background(lightGreyColor)
            .cornerRadius(5.0)
            .padding(.bottom,20)
    }
}
