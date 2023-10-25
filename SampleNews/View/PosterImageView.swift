//
//  PosterImage.swift
//  SampleNews
//
//  Created by Bairi Akash on 23/10/23.
//

import SwiftUI

struct PosterImage: View {
    var temporaryImage: Image = Image("photo")
    var edgeRadius: CGFloat = 20
    var imageFileName: String?
    var imagePath: String? {
        guard let imageFileName = imageFileName else {
            return nil
        }
        return "https://image.tmdb.org/t/p/w500/" + imageFileName
    }
    
    
    var body: some View {
        Group {
            if let imagePath = imagePath {
                AsyncImage(url: URL(string: imagePath)) { image in
                    image.resizable()
                        .clipShape(RoundedRectangle(cornerRadius: edgeRadius))
                } placeholder: {
                    
                    temporaryImage
                        .resizable()
                        .clipShape(RoundedRectangle(cornerRadius: edgeRadius))
                }
            }else {
                temporaryImage
                    .resizable()
                    .clipShape(RoundedRectangle(cornerRadius: edgeRadius))
            }
        }
    }
}

struct PosterImage_Previews: PreviewProvider {
    static var previews: some View {
        PosterImage()
    }
}
