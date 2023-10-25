

import SwiftUI

struct PosterImage: View {
    
    var temporaryImage: Image = Image("photo")
    var edgeRadius: CGFloat = 20
    var imageFileName: String?
    
    // Calculate the imagePath based on the imageFileName, if it exists
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
                    // Display the loaded image with rounded corners
                    image.resizable()
                        .clipShape(RoundedRectangle(cornerRadius: edgeRadius))
                } placeholder: {
                    
                    temporaryImage
                        .resizable()
                        .clipShape(RoundedRectangle(cornerRadius: edgeRadius))
                }
            }else {
                // Display the temporary image with rounded corners since imagePath is nil as already we checked if condition
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
