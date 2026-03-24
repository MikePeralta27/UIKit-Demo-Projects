//
//  ContentView.swift
//  MichaelCard
//
//  Created by Michael Peralta on 3/18/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color(red: 0.09, green: 0.63, blue: 0.52)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("Michael2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150.0, height: 150.0)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .overlay(
                        Circle().stroke(Color("RadiusColor"), lineWidth: 5)
                    )
                Text("Michael Peralta")
                    .font(Font.custom("Pacifico-Regular", size: 40))
                    .bold()
                    .foregroundColor(Color("RadiusColor"))
                Text("iOS Developer")
                    .foregroundColor(Color("RadiusColor"))
                    .font(.system(size: 25))
                Divider()
                InfoView(text: "609-854-6275", imageName: "phone.fill")
                InfoView(text: "Peralta.michael27@gmail.com", imageName: "envelope.fill")
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

