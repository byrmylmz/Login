//
//  ContentView.swift
//  LoginPage-1
//
//  Created by Bayram Yilmaz on 17/05/2022.
//

import SwiftUI

let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 100)

struct ContentView: View {
    
    @State var username: String = ""
    
    var body: some View {
        VStack {
            HelloText()
            UserImage()
            TextField("Username", text: $username)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(5.0)
                .padding(.bottom,20)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct HelloText: View {
    var body: some View {
        Text("Hello Bayram!")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(/*@START_MENU_TOKEN@*/.bottom, 20.0/*@END_MENU_TOKEN@*/)
    }
}

struct UserImage: View {
    var body: some View {
        Image("userImage")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .cornerRadius(150)
            .frame(width: 150.0, height: 150.0)
    }
}
