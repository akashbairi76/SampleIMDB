//
//  MovieDetailsView.swift
//  SampleNews
//
//  Created by Bairi Akash on 23/10/23.
//

import SwiftUI

struct MovieDetailsView: View {
    
    var film: Movie
   
    var body: some View {
       // Spacer()
        VStack( alignment: .leading ){
            HStack{
                PosterImage(imageFileName: film.poster_path)
                    .frame(width: 200, height: 300)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 8))
                
                filmStats(releaseData: film.release_date, ratings: film.vote_average, popularity: film.popularity)
               
            }.padding().frame(height: 320)
            
            FilmOverview(movieOverview: film.overview).padding(EdgeInsets(top: 32, leading: 20, bottom: 0, trailing: 16 ))
        }.navigationBarTitle(film.title ?? "Movie Title")
            .padding(.top, 20)
        
       
    }
}

struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsView( film: Movie())
    }
}
