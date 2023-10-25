

import Foundation

class NetworkManager: ObservableObject {
    
   //@Published means that any views observing this property will be notified when it changes( property wrapper)
    @Published var posts = [Movie]()
    
    var  urlString="https://api.themoviedb.org/3/movie/now_playing?api_key=38a73d59546aa378980a88b645f487fc&language=en-US"
    
    func fetchData(with searchedString: String) {
        // This function is used to fetch movie data based on a search string
        
        if( searchedString != ""){
            urlString = urlString + "&" + searchedString
        }
        
        
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                // Create a data task to perform an HTTP GET request( we are now in closure)
                
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let result = try decoder.decode(Results.self, from: safeData)
                            // Attempt to decode the JSON data into a 'Results' object.
                            DispatchQueue.main.async {
                                // Update the 'posts' property with the results on the main thread, which is necessary for UI updates.
                                self.posts = result.results!
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
}
