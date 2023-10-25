

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager()
    
    //  @State variable to store the search text
    @State private var searchText = ""
        
    var body: some View {
        NavigationView {
            VStack {
                //  Add a TextField for searching
                TextField("Search Movies", text: $searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                //filtering list of movies either empty searched or there is substring matches searched test and entered text is casesenisitive
                
                List(networkManager.posts.filter {
                    searchText.isEmpty || $0.title?.range(of: searchText, options: .caseInsensitive) != nil
                }, id: \.id) { post in
                    
                    //it act as a segue in UIkit link between first and second page
                    NavigationLink(destination: MovieDetailsView(film: post)){
                        HStack{
                            PosterImage(edgeRadius: 8,imageFileName: post.poster_path)
                                .frame(width: 96, height: 120)
                            VStack( alignment: .leading) {
                                Spacer()
                                Text(post.title!).font(.title2)
                                    .bold()
                                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 8, trailing: 0))
                                Text(post.overview!).lineLimit(3)
                                Spacer()
                            }
                        }
                    }
                }
                
            }
        }
        .onAppear {
            self.networkManager.fetchData(with: searchText)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
