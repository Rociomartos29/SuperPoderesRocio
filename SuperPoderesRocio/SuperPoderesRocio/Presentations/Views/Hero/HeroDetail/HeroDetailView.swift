//
//  HeroDetailView.swift
//  SuperPoderesRocio
//
//  Created by Rocio Martos on 4/5/24.
//

import SwiftUI

struct HeroDetailView: View {
    let hero: SuperHero
    var series: [Serie] = []
    var body: some View {
        NavigationStack {
            ZStack {
                // Imagen de fondo con título y descripción
                ZStack {
                    AsyncImage(url: URL(string: "\(hero.thumbnail.path)"+"\(hero.thumbnail.extension)")) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .edgesIgnoringSafeArea(.all)
                    } placeholder: {
                        Image("Placeholder")
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .edgesIgnoringSafeArea(.all)
                    }
                    
                    // Overlay oscuro
                    Color.black.opacity(0.5)
                    
                    // Contenido centrado
                    VStack {
                        Text(hero.name)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding()
                        
                        Text(hero.description)
                            .foregroundColor(.white)
                            .padding([.leading, .trailing])
                            .frame(maxWidth: .leastNonzeroMagnitude, alignment: .center)
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                }
                
                // Barra de navegación con título
                VStack {
                    Spacer()
                    
                    HStack {
                        Button(action: {
                            // Acción para retroceder
                        }) {
                            Image(systemName: "chevron.left")
                                .foregroundColor(.orange)
                        }
                        .padding()
                        
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
            .navigationTitle("")
            .navigationBarHidden(true)
        }
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(series.indices, id: \.self) { index in
                    NavigationLink {
                        // Asegúrate de pasar la serie correcta a la vista de detalle
                        SeriesView(serie: series[index])
                    } label: {
                        ZStack {
                            AsyncImage(url: URL(string: "\(series[index].thumbnail.path).\(series[index].thumbnail.imageExtension)")) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                            } placeholder: {
                                Image("Placeholder")
                                    .resizable()
                                    .scaledToFill()
                            }
                        }
                    }
                }
            }
            .padding(.horizontal)
        }
        .frame(height: 100)
    }
}
#Preview {
    HeroDetailView(hero: SuperHero(id: 0001, name: "Periquito", description: "En la naturaleza, son las aves con más población de toda Australia lo que podría deberse a su rápida reproducción ya que dejan de ser pichones y empiezan su reproducción a partir de los sesenta días de haber nacido, y a que las hembras ponen, en promedio, de cinco a seis huevos, lo cual las hace ser muy adaptables, aunque ellas habitan en Australia extendiéndose por el centro del país.", modified: "", thumbnail: SuperHeroThumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", extension: ".jpg"), resourceURI: "", comics: SuperHeroComics(available: 1, collectionURI: "", items: [], returned: 12), series: SuperHeroComics(available: 12, collectionURI: "", items: [], returned: 12), stories: SuperHeroComics(available: 12, collectionURI: "", items: [], returned: 12), events: SuperHeroComics(available: 12, collectionURI: "", items: [], returned: 2), urls: []))
}
