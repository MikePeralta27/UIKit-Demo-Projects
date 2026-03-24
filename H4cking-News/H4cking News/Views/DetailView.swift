//
//  DetailView.swift
//  H4cking News
//
//  Created by Michael Peralta on 4/2/23.
//

import SwiftUI
import WebKit

struct DetailView: View {
    let url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://google.com")
        
    }
}

