

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(networkManager.posts, id: \.id) { post in
                    VStack {
                        Text(post.title!).font(.title2)
                            .foregroundColor(Color.gray.opacity(0.8))
                            .bold()
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 8, trailing: 0))
                        
                        Text(post.overview!) //.foregroundColor(Color.black.opacity(0.5))
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
