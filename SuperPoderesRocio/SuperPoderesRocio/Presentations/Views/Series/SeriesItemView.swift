//
//  SeriesItemView.swift
//  SuperPoderesRocio
//
//  Created by Rocio Martos on 30/4/24.
//

import SwiftUI

struct SeriesItemView: View {
    var serie: Serie
       
       var body: some View {
           HStack(spacing: 10) {
               // Imagen de la serie
               AsyncImage(url: URL(string: "\(serie.thumbnail.path).\(serie.thumbnail.imageExtension)")) { image in
                   image
                       .resizable()
                       .aspectRatio(contentMode: .fill)
                       .frame(width: 80, height: 80)
                       .cornerRadius(10)
               } placeholder: {
                   Image(systemName: "photo")
                       .resizable()
                       .aspectRatio(contentMode: .fill)
                       .frame(width: 80, height: 80)
                       .cornerRadius(10)
               }
               
               // Título y descripción de la serie
               VStack(alignment: .leading, spacing: 4) {
                   Text(serie.title)
                       .font(.headline)
                       .fontWeight(.bold)
                   
                   if let description = serie.description {
                       Text(description)
                           .font(.caption)
                           .foregroundColor(.secondary)
                           .lineLimit(2)
                   } else {
                       Text(NSLocalizedString("without_description", comment: ""))
                           .font(.caption)
                           .foregroundColor(.secondary)
                           .italic()
                   }
               }
               .frame(maxWidth: .infinity, alignment: .leading)
           }
           .padding(8)
           .background(Color.white)
           .cornerRadius(12)
           .shadow(radius: 3)
       }
   }

   struct SeriesView_Previews: PreviewProvider {
       static var previews: some View {
           SeriesItemView(serie:
               Serie(id: 1, title: "Rocío", description: "", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", imageExtension: .jpg)))
       }
   }
