//
//  InfoView.swift
//  MichaelCard
//
//  Created by Michael Peralta on 4/2/23.
//

import SwiftUI

struct InfoView: View {
    let text: String
    let imageName: String
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color("RadiusColor"))
            .frame(height: 50)
            .overlay(HStack {
                Image(systemName: imageName)
                    .foregroundColor(.green)
                Text(text).foregroundColor(Color("Info Color"))
            })
            .padding(.all)
    }
}


struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(text:"Hello", imageName: "phone.fill")
            .previewLayout(.sizeThatFits)
    }
}
