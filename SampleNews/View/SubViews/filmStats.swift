//
//  filmStats.swift
//  SampleNews
//
//  Created by Bairi Akash on 25/10/23.
//

import SwiftUI

struct filmStats: View {
    
    var releaseData: String?
    var ratings: Double?
    var popularity: Double?
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            
            Text("Release Date")
                .font(.title3)
                .foregroundColor(Color.gray.opacity(0.9))
            
            Text(releaseData ?? "1/1/2023")
                .foregroundColor(Color.black.opacity(0.6))
            Spacer()
            Text("⭐️ Rating")
                .font(.title3)
                .foregroundColor(Color.gray.opacity(0.9))
            Text(String(ratings ?? 10.0))
                .foregroundColor(Color.black.opacity(0.6))
            Spacer()
            Text("❤️ Popularity")
                .font(.title3)
                .foregroundColor(Color.gray.opacity(0.9))
            Text(String(popularity ?? 0.0))
                .foregroundColor(Color.black.opacity(0.6))
            Spacer()
        }
    }
}

struct filmStats_Previews: PreviewProvider {
    static var previews: some View {
        filmStats()
    }
}
