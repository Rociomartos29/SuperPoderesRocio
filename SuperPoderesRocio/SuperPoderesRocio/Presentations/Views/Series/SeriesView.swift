//
//  SeriesView.swift
//  SuperPoderesRocio
//
//  Created by Rocio Martos on 30/4/24.
//

import SwiftUI

struct SeriesView: View {
    let serie: Serie
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                ZStack(alignment: .bottom) {
                    // Imagen con fondo borroso
                    ZStack {
                        AsyncImage(url: URL(string: "\(serie.thumbnail.path)" + "\(serie.thumbnail.imageExtension)")) { image in
                            image
                                .resizable()
                                .scaledToFill()
                        } placeholder: {
                            Image("Placeholder")
                                .resizable()
                                .scaledToFill()
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .edgesIgnoringSafeArea(.all)
                        
                    }
                    
                    // Área de texto desplazable
                    ScrollView(.vertical, showsIndicators: false) {
                        Text(serie.description ?? "")
                            .font(.body)
                            .foregroundColor(.white)
                            .padding()
                    }
                    .frame(height: UIScreen.main.bounds.height * 0.25)
                }
                .frame(height: UIScreen.main.bounds.height * 0.4)
                
                Spacer()
            }
            .navigationTitle(serie.title)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Image("CustomLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 35)
                }
            }
        }
    }
}
#Preview {
    SeriesView(serie:
              Serie(
                  id: 1,
                  title: "Título de la Serie 1",
                  description: "Descripción de la Serie 1",
                  thumbnail: Thumbnail(path: "https://ejemplo.com/serie1.jpg", imageExtension: .jpg)
              )
      )
  }
    
