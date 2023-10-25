//
//  FilmOverview.swift
//  SampleNews
//
//  Created by Bairi Akash on 25/10/23.
//

import SwiftUI

struct FilmOverview: View {
    
    var movieOverview: String?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Overview")
                .font(.title2)
                .foregroundColor(Color.gray.opacity(0.8))
                .bold()
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 8, trailing: 0))
            
            Text(movieOverview ?? "Overview" )
                .foregroundColor(Color.black.opacity(0.5))
        }
    }
}

struct FilmOverview_Previews: PreviewProvider {
    static var previews: some View {
        FilmOverview()
    }
}
