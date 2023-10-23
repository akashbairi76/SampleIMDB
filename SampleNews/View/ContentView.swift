

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(networkManager.posts, id: \.id) { post in
                
                HStack{
                    PosterImage(edgeRadius: 8,imageFileName: post.poster_path)
                        .frame(width: 96, height: 120)
                    VStack( alignment: .leading) {
                       
                        Text(post.title!).font(.title2)
                            .bold()
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 8, trailing: 0))
                       
                        Text(post.overview!).lineLimit(3)
                        Spacer()
                    }
                }
                    
                            
            }
            
        }
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
